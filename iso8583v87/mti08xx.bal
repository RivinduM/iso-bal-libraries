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


# MTI 0800 - Network Management Request
# The `MTI_0800` record represents a network management request in the ISO 8583 standard.
# 
# + MTI - The message type indicator (MTI) of the transaction.
# + TransmissionDateTime - The date and time when the transaction was initiated.
# + SystemTraceAuditNumber - A unique number assigned to the transaction for tracking purposes.
# + SettlementDate - The date when the transaction is settled.
# + AcquiringInstitutionIdentificationCode - The identification code of the acquiring institution.
# + AdditionalDataPrivate - Additional data (private).
# + NetworkManagementInformationCode - The network management information code.
# + NetworkManagementInformationChannelType - The network management information channel type.
public type MTI_0800 record {|
    string MTI = "0800";
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
            message: "Only numeric values allowed for SettlementDate"
        }
    }
    string SettlementDate?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for AcquiringInstitutionIdentificationCode"
        }
    }
    string AcquiringInstitutionIdentificationCode?;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for AdditionalDataPrivate"
        }
    }
    string AdditionalDataPrivate?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for NetworkManagementInformationCode"
        }
    }
    string NetworkManagementInformationCode;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for NetworkManagementInformationChannelType"
        }
    }
    string NetworkManagementInformationChannelType?;
|};

# MTI 0810 - Network Management Response
# The `MTI_0810` record represents a network management response in the ISO 8583 standard.
# 
# + MTI - The message type indicator (MTI) of the transaction.
# + TransmissionDateTime - The date and time when the transaction was initiated.
# + SystemTraceAuditNumber - A unique number assigned to the transaction for tracking purposes.
# + SettlementDate - The date when the transaction is settled.
# + AcquiringInstitutionIdentificationCode - The identification code of the acquiring institution.
# + AdditionalDataPrivate - Additional data (private).
# + NetworkManagementInformationCode - The network management information code.
# + NetworkManagementInformationChannelType - The network management information channel type.
# + ResponseCode - A code indicating the result of the authorization request.
public type MTI_0810 record {|
    string MTI = "0810";
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
            message: "Only numeric values allowed for SettlementDate"
        }
    }
    string SettlementDate?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for AcquiringInstitutionIdentificationCode"
        }
    }
    string AcquiringInstitutionIdentificationCode?;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for AdditionalDataPrivate"
        }
    }
    string AdditionalDataPrivate?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for NetworkManagementInformationCode"
        }
    }
    string NetworkManagementInformationCode;
    @constraint:String {
         pattern: {
            value: re `^[a-zA-Z0-9]+$`,
            message: "Only alpha numeric values allowed for NetworkManagementInformationChannelType"
        }
    }
    string NetworkManagementInformationChannelType?;
    @constraint:String {
         pattern: {
            value: re `^\d+`,
            message: "Only numeric values allowed for ResponseCode"
        }
    }
    string ResponseCode;
|};
