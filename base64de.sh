#!/bin/bash

# Function to detect if a string is base64-encoded
detect_base64() {
    local input="$1"
    # Base64 strings typically contain characters [A-Za-z0-9+/=]
    # Check if the input contains only these characters
    if [[ "$input" =~ ^[A-Za-z0-9+\/=]+$ ]]; then
        echo "String appears to be base64-encoded."
    else
        echo "String is not base64-encoded."
    fi
}

decode_base64() {
    local encoded="$1"
    local decoded
    decoded=$(echo "$encoded" | base64 -d 2>/dev/null)
    if [ $? -eq 0 ]; then
        echo "Original string: $encoded"
        echo "Decoded string: $decoded"
    else
        echo "Error: Unable to decode string. It may not be base64-encoded."
    fi
}


input_string="VGhpcyBpcyBhIGJhc2U2NC1lbmNvZGVkIHN0cmluZw=="
echo "Input string: $input_string"
detect_base64 "$input_string"
decode_base64 "$input_string"
-- Example:
Input string: VGhpcyBpcyBhIGJhc2U2NC1lbmNvZGVkIHN0cmluZw==
String appears to be base64-encoded.
Original string: VGhpcyBpcyBhIGJhc2U2NC1lbmNvZGVkIHN0cmluZw==
Decoded string: This is a base64-encoded string

