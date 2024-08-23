import ballerina/constraint;
// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.


# MTI 0420 - Reversal Request
# The `MTI_0420` record represents a reversal request in the ISO 8583 standard.
# 
# + MTI - The message type indicator (MTI) of the transaction.
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
# + AccountIdentification1 - The first account identification.
# + AccountIdentification2 - The second account identification.
# + EftTlvData - The TLV (Tag-Length-Value) data for the transaction.
# + MessageAuthenticationCode - The message authentication code for the transaction.
# + OriginalData - The original data of the transaction.
public type MTI_0420 record {|
    string MTI = "0420";
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for PrimaryAccountNumber"
        }
    }
    string PrimaryAccountNumber?;
    @constraint:String {
         pattern: {
            value: re `^\d{6}$`,
            message: "Only numeric values allowed for ProcessingCode"
        }
    }
    string ProcessingCode;
    @constraint:String {
         pattern: {
            value: re `^\d{12}$`,
            message: "Only numeric values allowed for AmountTransaction"
        }
    }
    string AmountTransaction;
    @constraint:String {
         pattern: {
            value: re `^\d{10}$`,
            message: "Only numeric values allowed for TransmissionDateTime"
        }
    }
    string TransmissionDateTime;
    @constraint:String {
         pattern: {
            value: re `^\d{6}$`,
            message: "Only numeric values allowed for SystemTraceAuditNumber"
        }
    }
    string SystemTraceAuditNumber;
    @constraint:String {
         pattern: {
            value: re `^\d{6}$`,
            message: "Only numeric values allowed for LocalTransactionTime"
        }
    }
    string LocalTransactionTime;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for LocalTransactionDate"
        }
    }
    string LocalTransactionDate;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for SettlementDate"
        }
    }
    string SettlementDate;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for DateCapture"
        }
    }
    string DateCapture;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for MerchantType"
        }
    }
    string MerchantType;
    @constraint:String {
         pattern: {
            value: re `^\d{3}$`,
            message: "Only numeric values allowed for PointOfServiceEntryMode"
        }
    }
    string PointOfServiceEntryMode?;
    @constraint:String {
         pattern: {
            value: re `^\d{2}$`,
            message: "Only numeric values allowed for PointOfServiceConditionCode"
        }
    }
    string PointOfServiceConditionCode;
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for AcquiringInstitutionIdentificationCode"
        }
    }
    string AcquiringInstitutionIdentificationCode;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for RetrievalReferenceNumber"
        }
    }
    string RetrievalReferenceNumber;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for AuthorizationNumber"
        }
    }
    string AuthorizationNumber?;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for ResponseCode"
        }
    }
    string ResponseCode;
    string CardAccepterTerminalIdentification?;
    string CardAccepterIdentificationCode?;
    string CardAccepterNameLocation?;
    @constraint:String {
         pattern: {
            value: re `^\d{3}$`,
            message: "Only numeric values allowed for CurrencyCodeTransaction"
        }
    }
    string CurrencyCodeTransaction;
    string AccountIdentification1?;
    string AccountIdentification2?;
    string EftTlvData;
    @constraint:String {
         pattern: {
            value: re `[0-1]+`,
            message: "Only binary data allowed for MessageAuthenticationCode"
        }
    }
    string MessageAuthenticationCode?;
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for OriginalData"
        }
    }
    string OriginalData;
|};

# MTI 0421 - Reversal Request
# The `MTI_0421` record represents a reversal request in the ISO 8583 standard.
# 
# + MTI - The message type indicator (MTI) of the transaction.
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
# + AccountIdentification1 - The first account identification.
# + AccountIdentification2 - The second account identification.
# + EftTlvData - The TLV (Tag-Length-Value) data for the transaction.
# + MessageAuthenticationCode - The message authentication code for the transaction.
# + OriginalData - The original data of the transaction.
public type MTI_0421 record {|
    string MTI = "0421";
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for PrimaryAccountNumber"
        }
    }
    string PrimaryAccountNumber?;
    @constraint:String {
         pattern: {
            value: re `^\d{6}$`,
            message: "Only numeric values allowed for ProcessingCode"
        }
    }
    string ProcessingCode;
    @constraint:String {
         pattern: {
            value: re `^\d{12}$`,
            message: "Only numeric values allowed for AmountTransaction"
        }
    }
    string AmountTransaction;
    @constraint:String {
         pattern: {
            value: re `^\d{10}$`,
            message: "Only numeric values allowed for TransmissionDateTime"
        }
    }
    string TransmissionDateTime;
    @constraint:String {
         pattern: {
            value: re `^\d{6}$`,
            message: "Only numeric values allowed for SystemTraceAuditNumber"
        }
    }
    string SystemTraceAuditNumber;
    @constraint:String {
         pattern: {
            value: re `^\d{6}$`,
            message: "Only numeric values allowed for LocalTransactionTime"
        }
    }
    string LocalTransactionTime;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for LocalTransactionDate"
        }
    }
    string LocalTransactionDate;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for SettlementDate"
        }
    }
    string SettlementDate;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for DateCapture"
        }
    }
    string DateCapture;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for MerchantType"
        }
    }
    string MerchantType;
    @constraint:String {
         pattern: {
            value: re `^\d{3}$`,
            message: "Only numeric values allowed for PointOfServiceEntryMode"
        }
    }
    string PointOfServiceEntryMode?;
    @constraint:String {
         pattern: {
            value: re `^\d{2}$`,
            message: "Only numeric values allowed for PointOfServiceConditionCode"
        }
    }
    string PointOfServiceConditionCode;
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for AcquiringInstitutionIdentificationCode"
        }
    }
    string AcquiringInstitutionIdentificationCode;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for RetrievalReferenceNumber"
        }
    }
    string RetrievalReferenceNumber;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for AuthorizationNumber"
        }
    }
    string AuthorizationNumber?;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for ResponseCode"
        }
    }
    string ResponseCode;
    string CardAccepterTerminalIdentification?;
    string CardAccepterIdentificationCode?;
    string CardAccepterNameLocation?;
    @constraint:String {
         pattern: {
            value: re `^\d{3}$`,
            message: "Only numeric values allowed for CurrencyCodeTransaction"
        }
    }
    string CurrencyCodeTransaction;
    string AccountIdentification1?;
    string AccountIdentification2?;
    string EftTlvData;
    @constraint:String {
         pattern: {
            value: re `[0-1]+`,
            message: "Only binary data allowed for MessageAuthenticationCode"
        }
    }
    string MessageAuthenticationCode?;
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for OriginalData"
        }
    }
    string OriginalData;
|};

# MTI 0430 - Reversal Response
# The `MTI_0430` record represents a reversal request response in the ISO 8583 standard.
# 
# + MTI - The message type indicator (MTI) of the transaction.
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
# + AccountIdentification1 - The first account identification.
# + AccountIdentification2 - The second account identification.
# + EftTlvData - The TLV (Tag-Length-Value) data for the transaction.
# + MessageAuthenticationCode - The message authentication code for the transaction.
# + OriginalData - The original data of the transaction.
# + ReceivingInstitutionIdentificationCode - The identification code of the receiving institution.
public type MTI_0430 record {|
    string MTI = "0400";
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for PrimaryAccountNumber"
        }
    }
    string PrimaryAccountNumber?;
    @constraint:String {
         pattern: {
            value: re `^\d{6}$`,
            message: "Only numeric values allowed for ProcessingCode"
        }
    }
    string ProcessingCode;
    @constraint:String {
         pattern: {
            value: re `^\d{12}$`,
            message: "Only numeric values allowed for AmountTransaction"
        }
    }
    string AmountTransaction;
    @constraint:String {
         pattern: {
            value: re `^\d{10}$`,
            message: "Only numeric values allowed for TransmissionDateTime"
        }
    }
    string TransmissionDateTime;
    @constraint:String {
         pattern: {
            value: re `^\d{6}$`,
            message: "Only numeric values allowed for SystemTraceAuditNumber"
        }
    }
    string SystemTraceAuditNumber;
    @constraint:String {
         pattern: {
            value: re `^\d{6}$`,
            message: "Only numeric values allowed for LocalTransactionTime"
        }
    }
    string LocalTransactionTime;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for LocalTransactionDate"
        }
    }
    string LocalTransactionDate;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for SettlementDate"
        }
    }
    string SettlementDate;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for DateCapture"
        }
    }
    string DateCapture;
    @constraint:String {
         pattern: {
            value: re `^\d{4}$`,
            message: "Only numeric values allowed for MerchantType"
        }
    }
    string MerchantType;
    @constraint:String {
         pattern: {
            value: re `^\d{3}$`,
            message: "Only numeric values allowed for PointOfServiceEntryMode"
        }
    }
    string PointOfServiceEntryMode?;
    @constraint:String {
         pattern: {
            value: re `^\d{2}$`,
            message: "Only numeric values allowed for PointOfServiceConditionCode"
        }
    }
    string PointOfServiceConditionCode;
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for AcquiringInstitutionIdentificationCode"
        }
    }
    string AcquiringInstitutionIdentificationCode;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for RetrievalReferenceNumber"
        }
    }
    string RetrievalReferenceNumber;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for AuthorizationNumber"
        }
    }
    string AuthorizationNumber?;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for ResponseCode"
        }
    }
    string ResponseCode;
    string CardAccepterTerminalIdentification?;
    string CardAccepterIdentificationCode?;
    string CardAccepterNameLocation?;
    @constraint:String {
         pattern: {
            value: re `^\d{3}$`,
            message: "Only numeric values allowed for CurrencyCodeTransaction"
        }
    }
    string CurrencyCodeTransaction;
    string AccountIdentification1?;
    string AccountIdentification2?;
    string EftTlvData;
    @constraint:String {
         pattern: {
            value: re `[0-1]+`,
            message: "Only binary data allowed for MessageAuthenticationCode"
        }
    }
    string MessageAuthenticationCode?;
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for OriginalData"
        }
    }
    string OriginalData?;
    @constraint:String {
         pattern: {
            value: re `^\d$`,
            message: "Only numeric values allowed for ReceivingInstitutionIdentificationCode"
        }
    }
    string ReceivingInstitutionIdentificationCode;
|};
