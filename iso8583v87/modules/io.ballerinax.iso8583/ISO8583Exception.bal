// Ballerina error type for `io.ballerinax.iso8583.ISO8583Exception`.

public const ISO8583EXCEPTION = "ISO8583Exception";

type ISO8583ExceptionData record {
    string message;
};

public type ISO8583Exception distinct error<ISO8583ExceptionData>;

