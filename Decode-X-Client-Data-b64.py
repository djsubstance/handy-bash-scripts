# Decode-X-Client-Data-b64.py
# Created: 04/22/2024
# Last Mod: 04/22/2024
# purpose : decode header X-Client-Data in google requests (python 3.x script)

pip3 install protobuf


To ensure the encoded string is compatible with the format expected by Chromium, we need to understand the protobuf structure and the base64 encoding process.

Protobuf Structure
The protobuf message ClientVariations has a single repeated field variation_id which is an int32. The protobuf wire format for a repeated int32 field with packed encoding includes:

A tag (which is a combination of the field number and wire type).
A length prefix indicating the number of bytes in the packed repeated field.
The packed repeated field data (the int32 values).
Encoding Details
For a single int32 value:

The tag is 1 byte.
The length prefix for a single int32 is typically 1 byte (since the maximum length of an int32 in varint encoding is 5 bytes).
Each int32 value can be between 1 and 5 bytes (in varint encoding).
For multiple int32 values:

The length prefix will increase to accommodate the total number of bytes in the packed repeated field.
Base64 Encoding
Base64 encoding converts binary data into a text string, with each 3 bytes of binary data encoded into 4 characters of Base64. The Base64 string length must be a multiple of 4, so padding with = characters is used as needed.

Minimum and Maximum Length
Minimum Length:
For the minimum valid protobuf message, we need at least one variation_id. The minimum protobuf message would have:
1 byte for the tag
1 byte for the length prefix
1 byte for the smallest int32 value (0)
Total: 3 bytes
Base64 encoding of 3 bytes results in 4 Base64 characters.
Maximum Length:
The maximum length depends on the practical limits of int32 values and the number of variation_id entries.
For a large number of variation_id values (e.g., hundreds or thousands), the length prefix will expand, and the total message length will increase.
Each additional int32 value adds between 1 and 5 bytes.


To get a header and verify this is working:
Right click a google page, inspect, "network". Click on a request and scroll down look for :

(its only in some requests)
X-Client-Data: CNPxygE=
                  ^ The browser automatically detects and decodes this
Decoded:
message ClientVariations {
  // Active client experiment variation IDs.
  repeated int32 variation_id = [3324115];
}

This is how its possible to verify our decoding works:

decode_x_client_data "CNPxygE="


----- Python Script:
import base64
import sys
from google.protobuf import descriptor_pb2, descriptor_pool, message_factory

# Define the protobuf schema for ClientVariations
client_variations_proto = """
syntax = "proto2";

message ClientVariations {
  repeated int32 variation_id = 1 [packed=true];
}
"""

MIN_PROTOBUF_SIZE = 3  # Minimum size in bytes for one int32 value encoded as protobuf
MAX_PROTOBUF_SIZE = 1024  # Arbitrary large value for practical purposes, can be adjusted

def decode_base64_data(encoded_data):
    try:
        return base64.b64decode(encoded_data)
    except base64.binascii.Error as e:
        raise ValueError(f"Error decoding base64 data: {e}")

def encode_base64_data(data):
    try:
        return base64.b64encode(data).decode('utf-8')
    except Exception as e:
        raise ValueError(f"Error encoding base64 data: {e}")

def create_file_descriptor_proto():
    file_descriptor_proto = descriptor_pb2.FileDescriptorProto()
    file_descriptor_proto.name = 'client_variations.proto'
    file_descriptor_proto.syntax = 'proto2'
    
    message_type = file_descriptor_proto.message_type.add()
    message_type.name = 'ClientVariations'
    
    field = message_type.field.add()
    field.name = 'variation_id'
    field.number = 1
    field.label = descriptor_pb2.FieldDescriptorProto.LABEL_REPEATED
    field.type = descriptor_pb2.FieldDescriptorProto.TYPE_INT32
    field.options.packed = True
    
    return file_descriptor_proto

def decode_protobuf(data, file_descriptor_proto):
    # Create a descriptor pool and add the file descriptor proto
    pool = descriptor_pool.Default()
    pool.Add(file_descriptor_proto)
    
    # Get the message descriptor and create a dynamic message class
    message_descriptor = pool.FindMessageTypeByName('ClientVariations')
    message_class = message_factory.GetMessageClass(message_descriptor)
    
    # Decode the protobuf message
    message = message_class()
    message.ParseFromString(data)
    return message

def encode_protobuf(variation_ids, file_descriptor_proto):
    # Create a descriptor pool and add the file descriptor proto
    pool = descriptor_pool.Default()
    pool.Add(file_descriptor_proto)
    
    # Get the message descriptor and create a dynamic message class
    message_descriptor = pool.FindMessageTypeByName('ClientVariations')
    message_class = message_factory.GetMessageClass(message_descriptor)
    
    # Create a new protobuf message and set the variation_id field
    message = message_class()
    message.variation_id.extend(variation_ids)
    
    # Serialize the message to a binary string
    return message.SerializeToString()

def main():
    if len(sys.argv) < 2 or sys.argv[1] not in ('encode', 'decode'):
        print(f"Usage: {sys.argv[0]} <encode|decode> [data]")
        sys.exit(1)

    operation = sys.argv[1]

    # Create the FileDescriptorProto
    file_descriptor_proto = create_file_descriptor_proto()

    if operation == 'decode':
        if len(sys.argv) != 3:
            print(f"Usage: {sys.argv[0]} decode <encoded_data>")
            sys.exit(1)

        encoded_data = sys.argv[2]
        
        # Base64 decode
        decoded_data = decode_base64_data(encoded_data)
        
        # Decode protobuf
        decoded_message = decode_protobuf(decoded_data, file_descriptor_proto)
        
        # Format the output to match Chromium's style
        output = "message ClientVariations {\n"
        output += "  // Active client experiment variation IDs.\n"
        output += "  repeated int32 variation_id = ["
        output += ", ".join(map(str, decoded_message.variation_id))
        output += "];\n"
        output += "}"
        
        print(output)

    elif operation == 'encode':
        if len(sys.argv) < 3:
            print(f"Usage: {sys.argv[0]} encode <variation_id1> <variation_id2> ...")
            sys.exit(1)
        
        variation_ids = list(map(int, sys.argv[2:]))
        
        # Encode protobuf
        encoded_data = encode_protobuf(variation_ids, file_descriptor_proto)
        
        # Check if the protobuf message size is within the limits
        if not (MIN_PROTOBUF_SIZE <= len(encoded_data) <= MAX_PROTOBUF_SIZE):
            print(f"Error: Encoded protobuf message size {len(encoded_data)} is out of bounds.")
            sys.exit(1)
        
        # Base64 encode
        encoded_base64 = encode_base64_data(encoded_data)
        
        print(encoded_base64)

if __name__ == "__main__":
    main()



--- Save and run - The encoded data that is definately valid: CNPxygE=

First we decode it:
python3 ./encodedecode.py decode "CNPxygE="


Verified output:
----------------
message ClientVariations {
  // Active client experiment variation IDs.
  repeated int32 variation_id = [3324115];
}
(venv) 






