import iso/iso20022;
import ballerina/http;
import ballerina/time;
import ballerina/mime;
import ballerina/log;

isolated function outbound(anydata iso20022Msg) returns anydata|error? {
    if (iso20022Msg is iso20022:FIToFICstmrCdtTrf) {
        iso20022:FIToFICstmrCdtTrf isoPacs008Msg =  check iso20022Msg.cloneWithType(iso20022:FIToFICstmrCdtTrf);
        // Check for proxy and fund transfer request
        if (isoPacs008Msg.GrpHdr.MsgId.startsWith("31")) {
            // proxy request
            PrxyLookUpRspnCBFT|error paynetProxyResolution = getPaynetProxyResolution(isoPacs008Msg.SplmtryData);
            if (paynetProxyResolution is error) {
                log:printError("Error while resolving proxy: " + paynetProxyResolution.message());
                return paynetProxyResolution;
            }
            log:printInfo("Paynet Proxy Resolution: " + paynetProxyResolution.toBalString());
            return paynetProxyResolution;
        } else {
            // fund transfer request
            // todo
            return isoPacs008Msg;
        }
    } else {
        log:printError("Error while converting to ISO 20022 message");
        return "Error while converting to ISO 20022 message";
    }
}

isolated function getPaynetProxyResolution(iso20022:SplmtryData[]? proxyEnquiryData) returns PrxyLookUpRspnCBFT|error {

    if (proxyEnquiryData == ()) {
        return error("Supplementary data not found. Error while resolving proxy");
    }
    http:Client paynetClient = check new ("https://certification.api.developer.inet.paynet.my/v1/picasso-guard" + 
        "/banks/nad/v2/resolution");
    string secondaryIdType = "";
    string secondaryId = "";
    string bicCode = "";

    time:Utc utcTime = time:utcNow();
    time:Civil date = time:utcToCivil(utcTime);
    string currentDate = date.year.toString() + date.month.toString().padZero(2) + date.day.toString().padZero(2);
    foreach iso20022:SplmtryData item in proxyEnquiryData {
        if item.Envlp.key == "002" {
            bicCode = item.Envlp.value;
            continue;
        }
        if item.Envlp.key == "011" {
            secondaryIdType = item.Envlp.value;
            continue;
        }
        if item.Envlp.key == "012" {
            secondaryId = item.Envlp.value;
            continue;
        }
    }
    if (bicCode == "" || secondaryIdType == "" || secondaryId == "") {
        return error("Error while resolving proxy");
    }
    string xBusinessMsgId = currentDate + bicCode + "611";
    PrxyLookUpRspnCBFT response = check paynetClient->/[secondaryIdType]/[secondaryId]({
            Accept: mime:APPLICATION_JSON,
            Authorization: "Bearer 123",
            "X-Business-Message-Id": xBusinessMsgId + "ORB09781854",
            "X-Client-Id": "123456",
            "X-Gps-Coordinates": "3.1234, 101.1234",
            "X-Ip-Address": "1"
    });
    log:printInfo("Response from Paynet: " + response.toBalString());
    return response;
}


public type PrxyLookUpCBFT record {|
    GrpHdr GrpHdr;
    CdtTrfTxInf CdtTrfTxInf;
    LookUp LookUp;
|};

public type PrxyLookUpRspnCBFT record {|
    GrpHdr GrpHdr;
    OrgnlGrpInf OrgnlGrpInf;
    LkUpRspn LkUpRspn;
|};

public type GrpHdr record {|
    string MsgId;
    string CreDtTm;
    MsgSndr MsgSndr;
    TpOfSubmitr TpOfSubmitr?;
|};

public type MsgSndr record {|
    Agt Agt;
|};

public type Agt record {|
    FinInstnId FinInstnId;
|};

public type FinInstnId record {|
    Othr Othr;
|};

public type Othr record {|
    string Id;
|};

public type TpOfSubmitr record {|
    string Cd;
|};

public type CdtTrfTxInf record {|
    string InstdAmt;
    string InstdAmtCcy;
    Dbtr Dbtr;
    Acct DbtrAcct;
|};

public type Dbtr record {|
    string Nm;
|};

public type Acct record {|
    Id Id;
    Tp Tp?;
|};


public type DebtrAcct record {|
    *Acct;
    string Nm?;
|};

public type Id record {|
    Othr Othr;
|};

public type Tp record {|
    string Prtry;
|};

public type LookUp record {|
    PrxyOnly PrxyOnly;
    CustomData CustomData?;
|};

public type PrxyOnly record {|
    string LkUpTp;
    string Id;
    string DestCountryCode;
    string DestCountryBankCode?;
    Requester PrxyRtrvl;
|};

public type CustomData record {|
    string Field1?;
    string Field2?;
    string Field3?;
    string Field4?;
    string Field5?;
    string Field6?;
    string Field7?;
    string Field8?;
    string Field9?;
    string Field10?;
    Requester PrxyRqstr?;
    string DsplNm?;
    Tp AcctTp?;
|};

public type OrgnlGrpInf record {|
    string OrgnlMsgId;
    string OrgnlMsgNmId;
    string OrgnlCreDtTm?;
|};

public type LkUpRspn record {|
    string OrgnlId;
    Requester OrgnlPrxyRtrvl;
    Requester OrgnlPrxyRqstr?;
    string OrgnlDspNm?;
    Tp OrgnlAcctTp?;
    RegnRspn RegnRspn;
|};

public type Requester record {|
    string Tp;
    string Val;
|};

public type RegnRspn record {|
    string PrxRspnSts;
    StsRsnInf StsRsnInf?;
    Requester Prxy?;
    string LkUpRef?;
    Regn Regn?;
    CustomData CustomData?;
|};

public type StsRsnInf record {|
    string Cd;
    string Prtry;
|};

public type Regn record {|
    string RegnId;
    string DsplNm;
    Agt Agt;
    DebtrAcct Acct;
    string PreAuthrsd;
|};
