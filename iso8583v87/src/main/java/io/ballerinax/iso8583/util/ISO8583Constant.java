/**
 * Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerinax.iso8583.util;

import java.util.HashMap;
import java.util.Map;

public class ISO8583Constant {

    public static final String PACKAGER_V_87 = "jposdefv87.xml";
    public static final String HEADER = "header";
    public static final String MTI = "MTI_";

    public static final Map<String, String> iso8583idNames = new HashMap<String, String>() {{
        put("0", "MTI");
        put("1", "Bitmap");
        put("2", "PrimaryAccountNumber");
        put("3", "ProcessingCode");
        put("4", "AmountTransaction");
        put("5", "AmountSettlement");
        put("6", "AmountCardholderBilling");
        put("7", "TransmissionDateTime");
        put("8", "AmountCardholderBillingFee");
        put("9", "ConversionRateSettlement");
        put("10", "ConversionRateCardholderBilling");
        put("11", "SystemTraceAuditNumber");
        put("12", "LocalTransactionTime");
        put("13", "LocalTransactionDate");
        put("14", "ExpirationDate");
        put("15", "SettlementDate");
        put("16", "CurrencyConversionDate");
        put("17", "CaptureDate");
        put("18", "MerchantType");
        put("19", "AcquiringInstitutionCountryCode");
        put("20", "PANCountryCode");
        put("21", "ForwardingInstitutionCountryCode");
        put("22", "PointOfServiceEntryMode");
        put("23", "ApplicationPANSequenceNumber");
        put("24", "FunctionCode");
        put("25", "PointOfServiceConditionCode");
        put("26", "PointOfServiceCaptureCode");
        put("27", "AuthorizingIdentificationResponseLength");
        put("28", "AmountTransactionFee");
        put("29", "AmountSettlementFee");
        put("30", "AmountTransactionProcessingFee");
        put("31", "AmountSettlementProcessingFee");
        put("32", "AcquiringInstitutionIdentificationCode");
        put("33", "ForwardingInstitutionIdentificationCode");
        put("34", "PrimaryAccountNumberExtended");
        put("35", "Track2Data");
        put("36", "Track3Data");
        put("37", "RetrievalReferenceNumber");
        put("38", "AuthorizationNumber");
        put("39", "ResponseCode");
        put("40", "ServiceRestrictionCode");
        put("41", "CardAcceptorTerminalID");
        put("42", "CardAcceptorIDCode");
        put("43", "CardAcceptorNameLocation");
        put("44", "AdditionalResponseData");
        put("45", "Track1Data");
        put("46", "AdditionalDataISO");
        put("47", "AdditionalDataNational");
        put("48", "AdditionalDataPrivate");
        put("49", "CurrencyCodeTransaction");
        put("50", "CurrencyCodeSettlement");
        put("51", "CurrencyCodeCardholderBilling");
        put("52", "PersonalIdentificationNumberData");
        put("53", "SecurityRelatedControlInformation");
        put("54", "AdditionalAmounts");
        put("60", "AdditionalTerminalDetails");
        put("64", "MAC");
        put("65", "ExtendedBitmapIndicator");
        put("66", "SettlementCode");
        put("67", "ExtendedPaymentCode");
        put("68", "ReceivingInstitutionCountryCode");
        put("69", "SettlementInstitutionCountryCode");
        put("70", "NetworkManagementInformationCode");
        put("71", "MessageNumber");
        put("72", "MessageNumberLast");
        put("73", "DateAction");
        put("74", "CreditsNumber");
        put("75", "CreditsReversalNumber");
        put("76", "DebitsNumber");
        put("77", "DebitsReversalNumber");
        put("78", "TransferNumber");
        put("79", "TransferReversalNumber");
        put("80", "InquiriesNumber");
        put("81", "AuthorizationsNumber");
        put("82", "CreditsProcessingFeeAmount");
        put("83", "CreditsTransactionFeeAmount");
        put("84", "DebitsProcessingFeeAmount");
        put("85", "DebitsTransactionFeeAmount");
        put("86", "CreditsAmount");
        put("87", "CreditsReversalAmount");
        put("88", "DebitsAmount");
        put("89", "DebitsReversalAmount");
        put("90", "OriginalDataElements");
        put("91", "FileUpdateCode");
        put("92", "FileSecurityCode");
        put("93", "ResponseIndicator");
        put("94", "ServiceIndicator");
        put("95", "ReplacementAmounts");
        put("96", "MessageSecurityCode");
        put("97", "AmountNetSettlement");
        put("98", "Payee");
        put("99", "SettlementInstitutionIdentificationCode");
        put("100", "ReceivingInstitutionID");
        put("101", "FileName");
        put("102", "AccountIdentification1");
        put("103", "AccountIdentification2");
        put("104", "TransactionDescription");
        put("120", "EftTlvData");
        put("128", "MAC");

        put("111", "AuthorisationIdentificationCode");
    }};
}



