import ballerina/data.xmldata;

// ISO 20022 records
public type SttlmInf record {
    string SttlmMtd;
};

public type GrpHdr record {
    string MsgId;
    string CreDtTm;
    int NbOfTxs;
    SttlmInf SttlmInf;
};

public type PmtId record {
    string EndToEndId;
};

public type IntrBkSttlmAmt record {
    decimal \#content?;
    @xmldata:Attribute
    string Ccy;
};

public type Dbtr record {
    string number;
};

public type DbtrAcct record {
    string Id;
};

public type DbtrAgt record {
    string FinInstnId;
};

public type CdtrAgt record {
    string FinInstnId;
};

public type Cdtr record {
};

public type CdtTrfTxInf record {
    PmtId PmtId;
    IntrBkSttlmAmt IntrBkSttlmAmt;
    string ChrgBr;
    Dbtr Dbtr?;
    DbtrAcct DbtrAcct?;
    DbtrAgt DbtrAgt?;
    CdtrAgt CdtrAgt;
    Cdtr Cdtr?;
};

public type Envlp record {
    string key;
    string value;
};

public type SplmtryData record {
    Envlp Envlp;
};

public type FIToFICstmrCdtTrf record {
    GrpHdr GrpHdr;
    CdtTrfTxInf[] CdtTrfTxInf;
    SplmtryData[] SplmtryData?;
};
