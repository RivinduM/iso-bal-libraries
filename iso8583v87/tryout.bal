// import ballerina/io;

import ballerina/constraint;
import ballerina/http;
import ballerina/log;

import iso/iso20022;

// public function main2() {
//     string isoMessage = "0200B2384081080080100000000000000100201345000000500000011152218212348945566612348888120610000912a456789123012006abc123021ABCDEFGHIJ 1234567890";
//     anydata|ISOError parsedISO8583Msg = parse(isoMessage);

//     if parsedISO8583Msg is ISOError {
//         io:println("Error while 8583 message parsing" + parsedISO8583Msg.toBalString());
//     } else {
//         map<anydata> parsedISO8583Map = <map<anydata>>parsedISO8583Msg;

//         if parsedISO8583Map["MTI"] == "0200" {

//             MTI_0200|error mti0200Msg = parsedISO8583Msg.cloneWithType(MTI_0200);
//             if mti0200Msg is MTI_0200 {
//                 // validate 8583 MTI message
//                 MTI_0200|error validatedMsg = constraint:validate(mti0200Msg);
//                 if validatedMsg is error {
//                     io:println("Error while validating: " + validatedMsg.message());
//                 } else {
//                     MTI_0210 transformResult = transform(validatedMsg);
//                     io:println("Response -->" + transformResult.toBalString());
//                 }   
//             } else {
//                 io:println("Error while cloning: " + mti0200Msg.message());
//                 io:println(mti0200Msg);
//             }
//         } else {
//             io:println("MTI is not supported");
//         }
//     }

// }

public function main() {

    // string isoMessage = "0200B238408108008010000000000000010020134500000050000001115221821234894556661234888812061000" +
    //     "0912a456789123012006abc123021ABCDEFGHIJ 1234567890";
   string isoMessage = "0200B2384081080080100000000000000100201345000000500000011152218212348945566612348888120610000"
   + "912a456789123012006abc123110002011NTBCLKLXXXX004011NTBCLKLXXXX005004900000600460000070049001010003123011004MBNO012013006041234123401300200";

    anydata|ISOError parsedISO8583Msg = parse(isoMessage);

    if parsedISO8583Msg is ISOError {
        log:printError("Error while 8583 message parsing" + parsedISO8583Msg.toBalString());
    } else {
        map<anydata> parsedISO8583Map = <map<anydata>>parsedISO8583Msg;
        if parsedISO8583Map["MTI"] == "0200" {
            MTI_0200|error mti0200Msg = parsedISO8583Msg.cloneWithType(MTI_0200);
            if mti0200Msg is MTI_0200 {
                // validate 8583 MTI message
                MTI_0200|error validatedMsg = constraint:validate(mti0200Msg);
                if validatedMsg is MTI_0200 {
                    log:printInfo("Validated ISO 8583 MTI 0200 record: " + validatedMsg.toBalString());
                } else {
                    log:printError("Error while validating: " + validatedMsg.message());
                }
            } else {
                log:printError("Error while cloning to type: " + mti0200Msg.message());
            }
        } else {
            log:printError("MTI is not supported");
        }
    }

}

isolated function transform(MTI_0200 mti0200) returns MTI_0210 => {
    SettlementDate: mti0200.SettlementDate ?: "0000",
    DateCapture: mti0200.DateCapture ?: "0000",
    ResponseCode: mti0200.AdditionalTerminalDetails,
    ProcessingCode: mti0200.ProcessingCode,
    AmountTransaction: mti0200.AmountTransaction,
    TransmissionDateTime: mti0200.TransmissionDateTime,
    SystemTraceAuditNumber: mti0200.SystemTraceAuditNumber,
    LocalTransactionTime: mti0200.LocalTransactionTime,
    LocalTransactionDate: mti0200.LocalTransactionDate,
    MerchantType: mti0200.MerchantType,
    PointOfServiceConditionCode: mti0200.PointOfServiceConditionCode,
    AcquiringInstitutionIdentificationCode: mti0200.AcquiringInstitutionIdentificationCode,
    RetrievalReferenceNumber: mti0200.RetrievalReferenceNumber,
    CurrencyCodeTransaction: mti0200.CurrencyCodeTransaction,
    EftTlvData: mti0200.EftTlvData,
    ReceivingInstitutionIdentificationCode: mti0200.PrimaryAccountNumber ?: "0000"
};

const MTI = "MTI";
const TYPE_MTI_0200 = "0200";
const TYPE_MTI_0210 = "0210";
const TYPE_MTI_0420 = "0420";
const TYPE_MTI_0430 = "0430";
const TYPE_MTI_0421 = "0421";
const TYPE_MTI_0800 = "0800";
const TYPE_MTI_0810 = "0810";

service /lankaPay on new http:Listener(9090) {

    isolated resource function post inbound(http:Caller caller, http:Request req) returns error? {
        // Extract the string payload from the request
        string payload = check req.getTextPayload();

        // Respond with the same string payload or modify as needed
        anydata|ISOError parsedISO8583Msg = parse(payload);
        string|error response;
        if parsedISO8583Msg is ISOError {
            response = "Error while parsing ISO 8583 message";
        } else {
            map<anydata> parsedISO8583Map = <map<anydata>>parsedISO8583Msg;
            string mti = <string>parsedISO8583Map[MTI];
            match mti {
                TYPE_MTI_0200 => {
                    MTI_0200|error validatedMsg = constraint:validate(parsedISO8583Msg);
                    if (validatedMsg is MTI_0200) {
                        // MTI_0210 mti0200Msg = transform(validatedMsg);
                        // resolveRequestType(parsedISO8583Msg);

                        // transform
                        log:printInfo("Validated ISO 8583 MTI 0200 record: " + validatedMsg.toBalString());
                        iso20022:FIToFICstmrCdtTrf iso20022Msg = transformToISO20022(validatedMsg);
                        response = iso20022Msg.toBalString();
                        //call paynet proxy
                        anydata|error? outboundResult = outbound(iso20022Msg);
                        if outboundResult is error {
                            log:printError("Error while retrieving proxy resolution response: " + outboundResult.message());
                            response = "Error while retrieving proxy resolution response: " + outboundResult.message();
                        } else {
                            log:printInfo("Response -->" + outboundResult.toBalString());
                            response = "Response -->" + outboundResult.toBalString();
                        }
                    } else {
                        log:printError("Error while validating: " + validatedMsg.message());
                        response = "Error while validating: " + validatedMsg.toBalString();
                    }
                }
                TYPE_MTI_0210 => {
                    MTI_0210|error validatedMsg = constraint:validate(parsedISO8583Msg);
                    if validatedMsg is MTI_0210 {
                        log:printInfo("Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString());
                        response = "Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString();
                    } else {
                        log:printError("Error while validating: " + validatedMsg.toBalString());
                        response = "Error while validating: " + validatedMsg.toBalString();
                    }
                }
                TYPE_MTI_0420 => {
                    TYPE_MTI_0420|error validatedMsg = constraint:validate(parsedISO8583Msg);
                    if validatedMsg is TYPE_MTI_0420 {
                        log:printInfo("Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString());
                        response = "Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString();
                    } else {
                        log:printError("Error while validating: " + validatedMsg.toBalString());
                        response = "Error while validating: " + validatedMsg.toBalString();
                    }
                }
                TYPE_MTI_0421 => {
                    TYPE_MTI_0421|error validatedMsg = constraint:validate(parsedISO8583Msg);
                    if validatedMsg is TYPE_MTI_0421 {
                        log:printInfo("Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString());
                        response = "Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString();
                    } else {
                        log:printError("Error while validating: " + validatedMsg.toBalString());
                        response = "Error while validating: " + validatedMsg.toBalString();
                    }
                }
                TYPE_MTI_0430 => {
                    TYPE_MTI_0430|error validatedMsg = constraint:validate(parsedISO8583Msg);
                    if validatedMsg is TYPE_MTI_0430 {
                        log:printInfo("Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString());
                        response = "Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString();
                    } else {
                        log:printError("Error while validating: " + validatedMsg.toBalString());
                        response = "Error while validating: " + validatedMsg.toBalString();
                    }
                }
                TYPE_MTI_0800 => {
                    TYPE_MTI_0800|error validatedMsg = constraint:validate(parsedISO8583Msg);
                    if validatedMsg is TYPE_MTI_0800 {
                        log:printInfo("Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString());
                        response = "Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString();
                    } else {
                        log:printError("Error while validating: " + validatedMsg.toBalString());
                        response = "Error while validating: " + validatedMsg.toBalString();
                    }
                }
                TYPE_MTI_0810 => {
                    TYPE_MTI_0810|error validatedMsg = constraint:validate(parsedISO8583Msg);
                    if validatedMsg is TYPE_MTI_0810 {
                        log:printInfo("Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString());
                        response = "Validated ISO 8583 MTI 0210 record: " + validatedMsg.toBalString();
                    } else {
                        log:printError("Error while validating: " + validatedMsg.toBalString());
                        response = "Error while validating: " + validatedMsg.toBalString();
                    }
                }
                _ => {
                    log:printError("MTI is not supported");
                    response = error("MTI is not supported");
                }
            }

        }
        check caller->respond(response);
    }

}

isolated function resolveRequestType(MTI_0200 mti0200Msg) {

    if mti0200Msg.ProcessingCode.startsWith("31") {
        // Proxy resolution

    } else {
        // Fund transfer
    }
}

string msg = "002011NTBCLKLXXXX004011 NTBCLKLXXXX005004900000600460000070049001010003123011004MBNO012013006041234123401300200";

isolated function parseField120(string field120) returns map<string> {

    map<string> field120Parts = {};
    int i = 0;
    while i < field120.length() {
        string tagId = field120.substring(i, i + 3);
        int elementLength = check int:fromString(field120.substring(i + 3, i + 6));
        string data = field120.substring(i + 6, i + 6 + elementLength);
        field120Parts[tagId] = data;
        i = i + 6 + elementLength;
    } on fail var e {
    	log:printError("Error while parsing field 120: " + e.message());
    }
    return field120Parts;
}

isolated function transformToISO20022(MTI_0200 mti0200) returns iso20022:FIToFICstmrCdtTrf => {
    GrpHdr: {
        MsgId: mti0200.ProcessingCode,
        CreDtTm: mti0200.TransmissionDateTime,
        NbOfTxs: 1,
        SttlmInf: {
            SttlmMtd: "CLRG"
        }
    },
    CdtTrfTxInf: [],
    SplmtryData: mapSupplementaryData(parseField120(mti0200.EftTlvData))
};

isolated function mapSupplementaryData(map<string> supplementaryData) returns iso20022:SplmtryData[] {

    iso20022:SplmtryData[] splmtryDataArray = [];
    // iso20022:Envlp[] splmtryData = [];
    foreach string dataElement in supplementaryData.keys() {
        
        iso20022:Envlp envlp = {'key: dataElement, value: supplementaryData.get(dataElement)};
        iso20022:SplmtryData splmtryDataElement = {Envlp: envlp};
        splmtryDataArray.push(splmtryDataElement);
    }
    return splmtryDataArray;
}


