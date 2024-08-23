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

import ballerina/constraint;

# MTI 0200 - Financial Request.
# The `MTI_0200` record represents a financial request in the ISO 8583 standard.
#
# + MTI - The message type indicator (MTI) of the transaction.
# + PrimaryAccountNumber - The primary account number (PAN) of the cardholder.
# + ProcessingCode - A code indicating the type of transaction being performed.
# + AmountTransaction - The amount of the transaction.
# + TransmissionDateTime - The date and time when the transaction was initiated.
# + SystemTraceAuditNumber - A unique number assigned to the transaction for tracking purposes.
# + LocalTransactionTime - The local time at the point of transaction.
# + LocalTransactionDate - The local date at the point of transaction.
# + MerchantType - A code representing the type of merchant.
# + PointOfServiceEntryMode - The mode of entry of the card data at the point of service.
# + PointOfServiceConditionCode - A code representing the condition of the point of service.
# + AmountTransactionFee - The amount of the transaction fee.
# + AcquiringInstitutionIdentificationCode - The identification code of the acquiring institution.
# + RetrievalReferenceNumber - A reference number used to retrieve the transaction.
# + CardAccepterTerminalIdentification - The identification code of the terminal where the card was accepted.
# + CardAccepterIdentificationCode - The identification code of the card accepter.
# + CardAccepterNameLocation - The name and location of the card accepter.
# + CurrencyCodeTransaction - The currency code of the transaction.
# + IntegratedCircuitCardSystemRelatedData - The integrated circuit card system related data.
# + AccountIdentification1 - The first account identification.
# + AccountIdentification2 - The second account identification.
# + EftTlvData - The TLV (Tag-Length-Value) data for the transaction.
# + MessageAuthenticationCode - The message authentication code for the transaction.
# + SettlementDate - The date when the transaction is settled.
# + DateCapture - The date when the transaction data was captured.
# + PinData - The PIN data for the transaction.
# + AdditionalTerminalDetails - Additional details about the terminal.

public type MTI_0200 record {|
    string MTI = "0200";
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for PrimaryAccountNumber"
        }
    }
    string PrimaryAccountNumber?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for ProcessingCode"
        }
    }
    string ProcessingCode;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for AmountTransaction"
        }
    }
    string AmountTransaction;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for TransmissionDateTime"
        }
    }
    string TransmissionDateTime;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for SystemTraceAuditNumber"
        }
    }
    string SystemTraceAuditNumber;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for LocalTransactionTime"
        }
    }
    string LocalTransactionTime;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for LocalTransactionDate"
        }
    }
    string LocalTransactionDate;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for MerchantType"
        }
    }
    string MerchantType;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for PointOfServiceEntryMode"
        }
    }
    string PointOfServiceEntryMode?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for PointOfServiceConditionCode"
        }
    }
    string PointOfServiceConditionCode;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for AmountTransactionFee"
        }
    }
    string AmountTransactionFee?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
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
    string CardAccepterTerminalIdentification?;
    string CardAccepterIdentificationCode?;
    string CardAccepterNameLocation?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for CurrencyCodeTransaction"
        }
    }
    string CurrencyCodeTransaction;
    @constraint:String {
        pattern: {
            value: re `[0-1]+`,
            message: "Only binary data allowed for IntegratedCircuitCardSystemRelatedData"
        }
    }
    string IntegratedCircuitCardSystemRelatedData?;
    string AccountIdentification1?;
    string AccountIdentification2?;
    string EftTlvData;
    @constraint:String {
        pattern: {
            value: re `[0-1]+`,
            message: "Only binary data allowed for CardIssuerReferenceData"
        }
    }
    string MessageAuthenticationCode?;
    @constraint:String {
        pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for SettlementDate"
        }
    }
    string SettlementDate?;
    @constraint:String {
        pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for DateCapture"
        }
    }
    string DateCapture?;
    @constraint:String {
        pattern: {
            value: re `[0-1]+`,
            message: "Only binary data allowed for PinData"
        }
    }
    string PinData?;
    @constraint:String {
        pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for AdditionalTerminalDetails"
        }
    }
    string AdditionalTerminalDetails;
|};

# MTI 0210 - Issuer Response to Financial Request	
# The `MTI_0210` record represents a response to a financial request in the ISO 8583 standard.
#
# + MTI - The message type indicator (MTI) of the transaction.
# + PrimaryAccountNumber - The primary account number (PAN) of the cardholder.
# + ProcessingCode - A code indicating the type of transaction being performed.
# + AmountTransaction - The amount of the transaction.
# + TransmissionDateTime - The date and time when the transaction was initiated.
# + SystemTraceAuditNumber - A unique number assigned to the transaction for tracking purposes.
# + LocalTransactionTime - The local time at the point of transaction.
# + LocalTransactionDate - The local date at the point of transaction.
# + MerchantType - A code representing the type of merchant.
# + PointOfServiceEntryMode - The mode of entry of the card data at the point of service.
# + PointOfServiceConditionCode - A code representing the condition of the point of service.
# + AmountTransactionFee - The amount of the transaction fee.
# + AcquiringInstitutionIdentificationCode - The identification code of the acquiring institution.
# + RetrievalReferenceNumber - A reference number used to retrieve the transaction.
# + CardAccepterTerminalIdentification - The identification code of the terminal where the card was accepted.
# + CardAccepterIdentificationCode - The identification code of the card accepter.
# + CardAccepterNameLocation - The name and location of the card accepter.
# + CurrencyCodeTransaction - The currency code of the transaction.
# + IntegratedCircuitCardSystemRelatedData - The integrated circuit card system related data.
# + AccountIdentification1 - The first account identification.
# + AccountIdentification2 - The second account identification.
# + EftTlvData - The TLV (Tag-Length-Value) data for the transaction.
# + MessageAuthenticationCode - The message authentication code for the transaction.
# + SettlementDate - The date when the transaction is settled.
# + DateCapture - The date when the transaction data was captured.
# + AuthorizationNumber - The authorization number assigned to the transaction.
# + ResponseCode - A code indicating the result of the authorization request.
# + ReceivingInstitutionIdentificationCode - The identification code of the receiving institution.
public type MTI_0210 record {|
    string MTI = "0210";
    string PrimaryAccountNumber?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for ProcessingCode"
        }
    }
    string ProcessingCode;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for AmountTransaction"
        }
    }
    string AmountTransaction;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for TransmissionDateTime"
        }
    }
    string TransmissionDateTime;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for SystemTraceAuditNumber"
        }
    }
    string SystemTraceAuditNumber;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for LocalTransactionTime"
        }
    }
    string LocalTransactionTime;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for LocalTransactionDate"
        }
    }
    string LocalTransactionDate;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for MerchantType"
        }
    }
    string MerchantType;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for PointOfServiceEntryMode"
        }
    }
    string PointOfServiceEntryMode?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for PointOfServiceConditionCode"
        }
    }
    string PointOfServiceConditionCode;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for AmountTransactionFee"
        }
    }
    string AmountTransactionFee?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
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
    string CardAccepterTerminalIdentification?;
    string CardAccepterIdentificationCode?;
    string CardAccepterNameLocation?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for CurrencyCodeTransaction"
        }
    }
    string CurrencyCodeTransaction;
    @constraint:String {
        pattern: {
            value: re `[0-1]+`,
            message: "Only binary data allowed for IntegratedCircuitCardSystemRelatedData"
        }
    }
    string IntegratedCircuitCardSystemRelatedData?;
    string AccountIdentification1?;
    string AccountIdentification2?;
    string EftTlvData;
    @constraint:String {
        pattern: {
            value: re `[0-1]+`,
            message: "Only binary data allowed for CardIssuerReferenceData"
        }
    }
    string MessageAuthenticationCode?;
    string SettlementDate;
    string DateCapture;
    string AuthorizationNumber?;
    string ResponseCode;
    string ReceivingInstitutionIdentificationCode;
|};
