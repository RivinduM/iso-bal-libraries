// ISO 8583 MTI 0200 record
# Description.
#
# + MTI - field description  
# + PrimaryAccountNumber - field description  
# + ProcessingCode - field description  
# + AmountTransaction - field description  
# + TransmissionDateTime - field description  
# + SystemTraceAuditNumber - field description  
# + LocalTransactionTime - field description  
# + LocalTransactionDate - field description  
# + SettlementDate - field description  
# + DateCapture - field description  
# + MerchantType - field description  
# + PointOfServiceEntryMode - field description  
# + PointOfServiceConditionCode - field description  
# + AcquiringInstitutionIdentificationCode - field description  
# + RetrievalReferenceNumber - field description  
# + AuthorizationNumber - field description  
# + ResponseCode - field description  
# + CardAccepterTerminalIdentification - field description  
# + CardAccepterIdentificationCode - field description  
# + CardAccepterNameLocation - field description  
# + CurrencyCodeTransaction - field description  
# + AdditionalTerminalDetails - field description  
# + ReceivingInstitutionIdentificationCode - field description  
# + AccountIdentification1 - field description  
# + AccountIdentification2 - field description  
# + EftTlvData - field description  
# + MessageAuthenticationCode - field description
public type ISO8583_0200 record {
    string MTI;
    string PrimaryAccountNumber?;
    string ProcessingCode;
    string AmountTransaction;
    string TransmissionDateTime;
    string SystemTraceAuditNumber;
    string LocalTransactionTime;
    string LocalTransactionDate;
    string SettlementDate?;
    string DateCapture?;
    string MerchantType;
    int PointOfServiceEntryMode?;
    int PointOfServiceConditionCode;
    string AcquiringInstitutionIdentificationCode;
    string RetrievalReferenceNumber;
    string AuthorizationNumber?;
    string ResponseCode?;
    string CardAccepterTerminalIdentification?;
    string CardAccepterIdentificationCode?;
    string CardAccepterNameLocation?;
    string CurrencyCodeTransaction;
    string AdditionalTerminalDetails;
    string ReceivingInstitutionIdentificationCode?;
    string AccountIdentification1?;
    string AccountIdentification2?;
    string EftTlvData;
    string MessageAuthenticationCode?;
};
