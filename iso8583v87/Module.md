# ISO 8583 Parser Module

### Sample Usage

**01. Parse to ISO 8583 base resource model**

In this approach user just need to provide only the ISO 8583 message payload. Based on the MTI(Message Type Identifier), parser will parse
it to it's MTI model.

```ballerina
import ballerina/log;
import ballerinax/financial.iso8583.parser;

public function main() {

    string isoMessage = "0200B2384081080080100000000000000100201345000000500000011152218212348945566612348888120610000912a456789123012006abc123021ABCDEFGHIJ 1234567890";
    anydata|ISOError parsedISO8583Msg = parser:parse(isoMessage);
    
    if parsedISO8583Msg is anydata {
        map<anydata> parsedISO8583Map = <map<anydata>>parsedISO8583Msg;

        if parsedISO8583Map["MTI"] == "0200" {

            MTI_0200|error cloneWithType = parsedISO8583Msg.cloneWithType(MTI_0200);
            if cloneWithType is MTI_0200 {
                // validate 8583 MTI message
                MTI_0200|error validatedMsg = constraint:validate(cloneWithType);
                if validatedMsg is error {
                    log:printError("Error while validating: " + validatedMsg.message());
                } else {
                    log:printInfo("Validated ISO 8583 record : " + validatedMsg.toBalString());
                }   
            } else {
                log:printError("Error while cloning: " + cloneWithType.message());
            }
        }
    } else {
        log:printError("Error while 8583 message parsing" + parsedISO8583Msg.toBalString());
    }
}
```

*Note:* `parse` function returns `anydata` type when success, and it needs to be cast to the relevant ISO 8583 MTI Resource type.
