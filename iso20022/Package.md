ISO 20022 ballerina records.
[//]: # (above is the package summary)

# Package Overview
This package contains ISO 20022 ballerina records.

# Try out instructions
Run the ballerina service
bal run /Users/rivindumadushan/CodeBases/LankaPay/MessageFormatLibraries/iso-bal-libraries/iso8583v87 

Try out sending a http request to http://localhost:9090/lankaPay/inbound with ISO 8583 payload
Sample
curl --location 'http://localhost:9090/lankaPay/inbound' \
--header 'Content-Type: application/xml' \
--data '0200B2384081080080100000000000000100311345000000500000011152218212348945566612348888120610000912a456789123012006abc123107002008NTBCLKLX004011NTBCLKLXXXX005004900000600460000070049001010003123011004MBNO012013006041234123401300200'

