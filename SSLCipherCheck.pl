#!/usr/bin/perl
use strict;
use warnings;

# Perl Script run IE:  perl ./SSLCipherCheck.pl msn.com:443
# Will check for insecure ciphers in use

my $server = $ARGV[0];

if (not defined $server) {
    die "Usage: $0 [server:port]\n";
}

# Fetch ciphers
my $ciphers = `openssl ciphers 'ALL:ALL'`;
chomp $ciphers;
my @cipher_list = split(/:/, $ciphers);

print "Obtaining cipher list from " . `openssl version`;

foreach my $cipher (@cipher_list) {
    # Skip the cipher if necessary, add any other conditions here
    next if $cipher =~ /ECDHE/;  # Skipping any cipher with ECDHE in its name
    next if $cipher =~ /DHE/;    # Skipping any cipher with DHE in its name

    print "Testing $cipher... ";

    # Try connecting with the cipher
    my $result = `echo -n | openssl s_client -cipher "$cipher" -connect $server 2>&1`;

    if ($result =~ /no cipher match/) {
        print "[LOCAL FAIL] (Cipher not supported by your OpenSSL)\n";
        next;
    } elsif ($result =~ /:error:/) {
        my ($error) = $result =~ /:error:.*:(.*)/;
        print "[FAIL] ($error)\n";
        next;
    } elsif ($result =~ /Cipher is ${cipher}/) {
        print "[PASS]\n";
    } else {
        print "UNKNOWN RESPONSE\n";
        print $result . "\n";
    }
}


