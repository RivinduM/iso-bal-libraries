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

import ballerina/test;
import ballerina/constraint;

string VALID_ISO8583_MTI0200_MESSAGE = "0200B23840810800801000000000000001002013450000005000000111522182123489455666" +
    "12348888120610000912a456789123012006abc123021ABCDEFGHIJ 1234567890";
string ISO8583_MESSAGE_WITH_INCORRECT_BITMAP = "0200B238408Z08008010000000000000010020134500000050000001115221821234" +
    "8945566612348888120610000912a456789123012006abc123021ABCDEFGHIJ 1234567890";
string ISO8583_MESSAGE_WITH_INVALID_LENGTH_DE_120 = "0200B2384081080080100000000000000100201345000000500000011152218" +
    "212348945566612348888120610000912a456789123012006abc123021ABCDEFGHIJ1234567890";
string ISO8583_MESSAGE_WITHOUT_MANDATORY_FIELD = "0200B2384081080080000000000000000100201345000000500000011152218012" + 
    "348945566612348888120610000912a456789123USD006021ABCDEFGHIJ 1234567890";
string ISO8583_MESSAGE_WITH_INVALID_DE_TYPE_49 = "0200B2384081080080100000000000000100201345000000500000011152218212" +
    "348945566612348888120610000912a456789123USD006abc123021ABCDEFGHIJ 1234567890";
string ISO8583_MESSAGE_WITH_UNKNOWN_FIELD_63 = "0200B238408108008012000000000000010020134500000050000001115221801234" + 
    "8945566612348888120610000912a456789123USD006abc123006abc123021ABCDEFGHIJ 1234567890";

@test:Config {}        
function parseValidISO8583Message() returns error? {
    
    anydata parsedISO8583Msg = parse(VALID_ISO8583_MTI0200_MESSAGE);
    MTI_0200 mti0200Msg = check parsedISO8583Msg.cloneWithType(MTI_0200);
    test:assertEquals(mti0200Msg.MTI, "0200", "Mismatching MTI");
    test:assertEquals(mti0200Msg.ProcessingCode, "201345" , "Mismatching ProcessingCode");
    test:assertEquals(mti0200Msg.SystemTraceAuditNumber, "123489" , "Mismatching SystemTraceAuditNumber");

}

@test:Config {}
function parseInvalidISO8583MessageWithInvalidBitmap() {
    
    anydata|ISOError parsedISO8583Msg = parse(ISO8583_MESSAGE_WITH_INCORRECT_BITMAP);
    if (parsedISO8583Msg is ISOError) {
        test:assertTrue(parsedISO8583Msg.message.includes("Error while unpacking ISO message"));
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {}
function parseInvalidISO8583MessageWithInvalidField() {
    
    anydata|ISOError parsedISO8583Msg = parse(ISO8583_MESSAGE_WITH_INVALID_LENGTH_DE_120);
    if (parsedISO8583Msg is ISOError) {
        test:assertTrue(parsedISO8583Msg.message.includes("Error while unpacking ISO message"));
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {}
function parseInvalidISO8583MessageWithUnknownField() {
    
    anydata|ISOError parsedISO8583Msg = parse(ISO8583_MESSAGE_WITH_UNKNOWN_FIELD_63);
    if (parsedISO8583Msg is ISOError) {
        test:assertTrue(parsedISO8583Msg.message.includes("Unknown ISO8583 field id: 63"));
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {}
function parseInvalidISO8583MessageWithInvalidField1() {
    
    anydata parsedISO8583Msg = parse(ISO8583_MESSAGE_WITHOUT_MANDATORY_FIELD);
    MTI_0200|error mti0200 = parsedISO8583Msg.cloneWithType(MTI_0200);
    if (mti0200 is error) {
        test:assertTrue(mti0200.detail().toBalString().includes("missing required field 'AdditionalTerminalDetails' " +
            "of type 'string' in record 'financial.iso8583:MTI_0200"));
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {}
function parseInvalidISO8583MessageWithInvalidField2() returns error? {
    
    anydata parsedISO8583Msg = parse(ISO8583_MESSAGE_WITH_INVALID_DE_TYPE_49);
    MTI_0200 mti0200Msg = check parsedISO8583Msg.cloneWithType(MTI_0200);
    MTI_0200|error validatedMsg = constraint:validate(mti0200Msg);
    if (validatedMsg is error) {
        test:assertTrue(validatedMsg.toBalString()
            .includes("Only numeric values allowed for CurrencyCodeTransaction."));
    } else {
        test:assertFail("Expected an error");
    }
}