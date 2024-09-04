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

import financial.iso8583.io.ballerinax.iso8583;

import ballerina/data.jsondata;

# ISO 8583 message parser.
#
# + isoMessage - iso 8583 message
# + return - iso 8583 record as anydata
public isolated function parse(string isoMessage) returns anydata|ISOError {

    string|iso8583:ISO8583Exception iso8583unpackedMsg = iso8583:ISO8583Parser_unpackISOmessage(isoMessage);

    if iso8583unpackedMsg is string {
        json|error isoJsonMsg = iso8583unpackedMsg.fromJsonString();
        if isoJsonMsg is error {
            return createISOError("Error while converting to json: " + isoJsonMsg.message());
        } else {
            anydata|jsondata:Error isoRecord = jsondata:parseAsType(isoJsonMsg);
            if (isoRecord is anydata) {
                return isoRecord;
            } else {
                return createISOError("Error while parsing record");
            }
        }
    } else {
        return createISOError("Error while unpacking ISO message: " + iso8583unpackedMsg.toBalString());
    }
}
