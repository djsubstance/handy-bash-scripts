#!/bin/python
#filename: eXtractIPv4v6.py

import re

text = "Sample text with IPv4 address 192.168.1.1 and IPv6 address 2001:0db8:85a3:0000:0000:8a2e:0370:7334."

# Define the regex pattern
pattern = r'\b(?:\d{1,3}\.){3}\d{1,3}\b|\b(?:[0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}\b'

# Use re.findall to extract IP addresses
ip_addresses = re.findall(pattern, text)

# Print the extracted IP addresses
print(ip_addresses)
