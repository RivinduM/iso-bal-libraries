# MTI 0200 - Financial Request.
# The `MTI_0200` record represents a financial request in the ISO 8583 standard.
#
# + PrimaryAccountNumber - The primary account number (PAN) of the cardholder. 
# + ProcessingCode - A code indicating the type of transaction being performed.
# + AmountTransaction - The amount of the transaction.
# + TransmissionDateTime - The date and time when the transaction was initiated.
# + SystemTraceAuditNumber - A unique number assigned to the transaction for tracking purposes.
# + LocalTransactionTime - The local time at the point of transaction.
# + LocalTransactionDate - The local date at the point of transaction.
# + SettlementDate - The date when the transaction is settled.
# + DateCapture - The date when the transaction data was captured.
# + MerchantType - A code representing the type of merchant.
# + PointOfServiceEntryMode - The mode of entry of the card data at the point of service. 
# + PointOfServiceConditionCode - A code representing the condition of the point of service.
# + AcquiringInstitutionIdentificationCode - The identification code of the acquiring institution.
# + RetrievalReferenceNumber - A reference number used to retrieve the transaction.
# + AuthorizationNumber - The authorization number assigned to the transaction. 
# + ResponseCode - A code indicating the result of the authorization request.
# + CardAccepterTerminalIdentification - The identification code of the terminal where the card was accepted. 
# + CardAccepterIdentificationCode - The identification code of the card accepter. 
# + CardAccepterNameLocation - The name and location of the card accepter. 
# + CurrencyCodeTransaction - The currency code of the transaction.
# + AdditionalTerminalDetails - Additional details about the terminal. 
# + ReceivingInstitutionIdentificationCode - The identification code of the receiving institution.
# + AccountIdentification1 - The first account identification. 
# + AccountIdentification2 - The second account identification. 
# + EftTlvData - The TLV (Tag-Length-Value) data for the transaction.
# + MessageAuthenticationCode - The message authentication code for the transaction. 
public type MTI_0200 record {
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

# MTI 0210 - Issuer Response to Financial Request	
# The `MTI_0210` record represents a response to a financial request in the ISO 8583 standard.
#
# + PrimaryAccountNumber - The primary account number (PAN) of the cardholder. 
# + ProcessingCode - A code indicating the type of transaction being performed.
# + AmountTransaction - The amount of the transaction.
# + TransmissionDateTime - The date and time when the transaction was initiated.
# + SystemTraceAuditNumber - A unique number assigned to the transaction for tracking purposes.
# + LocalTransactionTime - The local time at the point of transaction.
# + LocalTransactionDate - The local date at the point of transaction.
# + SettlementDate - The date when the transaction is settled.
# + DateCapture - The date when the transaction data was captured.
# + MerchantType - A code representing the type of merchant.
# + PointOfServiceEntryMode - The mode of entry of the card data at the point of service. 
# + PointOfServiceConditionCode - A code representing the condition of the point of service.
# + AcquiringInstitutionIdentificationCode - The identification code of the acquiring institution.
# + RetrievalReferenceNumber - A reference number used to retrieve the transaction.
# + AuthorizationNumber - The authorization number assigned to the transaction. 
# + ResponseCode - A code indicating the result of the authorization request.
# + CardAccepterTerminalIdentification - The identification code of the terminal where the card was accepted. 
# + CardAccepterIdentificationCode - The identification code of the card accepter. 
# + CardAccepterNameLocation - The name and location of the card accepter. 
# + CurrencyCodeTransaction - The currency code of the transaction.
# + AdditionalTerminalDetails - Additional details about the terminal. 
# + ReceivingInstitutionIdentificationCode - The identification code of the receiving institution.
# + AccountIdentification1 - The first account identification. 
# + AccountIdentification2 - The second account identification. 
# + EftTlvData - The TLV (Tag-Length-Value) data for the transaction.
# + MessageAuthenticationCode - The message authentication code for the transaction. 
public type MTI_0210 record {
    string PrimaryAccountNumber?;
    string ProcessingCode;
    string AmountTransaction;
    string TransmissionDateTime;
    string SystemTraceAuditNumber;
    string LocalTransactionTime;
    string LocalTransactionDate;
    string SettlementDate;
    string DateCapture;
    string MerchantType;
    int PointOfServiceEntryMode?;
    int PointOfServiceConditionCode;
    string AcquiringInstitutionIdentificationCode;
    string RetrievalReferenceNumber;
    string AuthorizationNumber?;
    string ResponseCode;
    string CardAccepterTerminalIdentification?;
    string CardAccepterIdentificationCode?;
    string CardAccepterNameLocation?;
    string CurrencyCodeTransaction;
    string AdditionalTerminalDetails?;
    string ReceivingInstitutionIdentificationCode;
    string AccountIdentification1?;
    string AccountIdentification2?;
    string EftTlvData;
    string MessageAuthenticationCode?;
};

# MTI 0800 - Network Management Request
# The `MTI_0800` record represents a network management request in the ISO 8583 standard.
#
# + TransmissionDateTime - The date and time when the transaction was initiated.
# + SystemTraceAuditNumber - A unique number assigned to the transaction for tracking purposes.
# + SettlementDate - The date when the transaction is settled.
# + AcquiringInstitutionIdentificationCode - The identification code of the acquiring institution.
# + AdditionalDataPrivate - Additional data (private).
# + NetworkManagementInformationCode - The network management information code.
# + NetworkManagementInformationChannelType - The network management information channel type.
public type MTI_0800 record {
    string TransmissionDateTime;
    string SystemTraceAuditNumber;
    string SettlementDate?;
    string AcquiringInstitutionIdentificationCode?;
    string AdditionalDataPrivate?;
    string NetworkManagementInformationCode;
    string NetworkManagementInformationChannelType?;
};

# MTI 0800 - Network Management Request Response.
# The `MTI_0800` record represents a network management request response in the ISO 8583 standard.
#
# + TransmissionDateTime - The date and time when the transaction was initiated.
# + SystemTraceAuditNumber - A unique number assigned to the transaction for tracking purposes.
# + SettlementDate - The date when the transaction is settled.
# + AcquiringInstitutionIdentificationCode - The identification code of the acquiring institution.
# + ResponseCode - A code indicating the result of the authorization request.
# + AdditionalDataPrivate - Additional data (private).
# + NetworkManagementInformationCode - The network management information code.
# + MessageAuthenticationCode - The message authentication code for the transaction.
public type MTI_0810 record {
    string TransmissionDateTime;
    string SystemTraceAuditNumber;
    string SettlementDate?;
    string AcquiringInstitutionIdentificationCode?;
    string ResponseCode;
    string AdditionalDataPrivate?;
    string NetworkManagementInformationCode;
    string MessageAuthenticationCode?;
};


# MTI 0420 - Reversal Request
# The `MTI_0420` record represents a reversal request in the ISO 8583 standard.
#
# + PrimaryAccountNumber - The primary account number (PAN) of the cardholder.
# + ProcessingCode - A code indicating the type of transaction being performed.
# + AmountTransaction - The amount of the transaction.
# + TransmissionDateTime - The date and time when the transaction was initiated.
# + SystemTraceAuditNumber - A unique number assigned to the transaction for tracking purposes.
# + LocalTransactionTime - The local time at the point of transaction.
# + LocalTransactionDate - The local date at the point of transaction.
# + SettlementDate - The date when the transaction is settled.
# + DateCapture - The date when the transaction data was captured.
# + MerchantType - A code representing the type of merchant.
# + PointOfServiceEntryMode - The mode of entry of the card data at the point of service.
# + PointOfServiceConditionCode - A code representing the condition of the point of service.
# + AmountTransactionFee - The amount of the transaction fee.
# + AcquiringInstitutionIdentificationCode - The identification code of the acquiring institution.
# + RetrievalReferenceNumber - A reference number used to retrieve the transaction.
# + AuthorizationNumber - The authorization number assigned to the transaction.
# + ResponseCode - A code indicating the result of the authorization request.
# + CardAccepterTerminalIdentification - The identification code of the terminal where the card was accepted.
# + CardAccepterIdentificationCode - The identification code of the card accepter.
# + CardAccepterNameLocation - The name and location of the card accepter.
# + CurrencyCodeTransaction - The currency code of the transaction.
# + OriginalData - The original data of the transaction.
# + ReceivingInstitutionIdentificationCode - The identification code of the receiving institution.
# + AccountIdentification1 - The first account identification.
# + AccountIdentification2 - The second account identification.
# + EftTlvData - The TLV (Tag-Length-Value) data for the transaction.
# + MessageAuthenticationCode - The message authentication code for the transaction.
public type MTI_04XX record {
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
    string AmountTransactionFee?;
    string AcquiringInstitutionIdentificationCode;
    string RetrievalReferenceNumber;
    string AuthorizationNumber?;
    string ResponseCode?;
    string CardAccepterTerminalIdentification?;
    string CardAccepterIdentificationCode?;
    string CardAccepterNameLocation?;
    string CurrencyCodeTransaction;
    string OriginalData;
    string ReceivingInstitutionIdentificationCode?;
    string AccountIdentification1?;
    string AccountIdentification2?;
    string EftTlvData;
    string MessageAuthenticationCode?;
};


// Todo - All fields are same except conditionality. Need to find a way to reuse the fields.
// Open or close records
// field validations
// Licence?