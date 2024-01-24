#!/bin/bash
# Generate an unlimied # of prime #s with option to output to a file and stdout

generate_random_number() {
    od -An -N13 -tu8 /dev/random | tr -d ' \n' | head -c 26
}

# Check if the first argument is provided and if it's a positive integer
if [ $# -lt 1 ] || ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <number_of_primes> [output_filename]"
    exit 1
fi

count=0
target_count=$1

# Set the default filename or use the provided one
filename=${2:-primes_$1.txt}

while [ $count -lt $target_count ]; do
    # Generate a 26-digit number
    num=$(generate_random_number)

    # Check if the number is prime
    if openssl prime $num > /dev/null 2>&1; then
        echo $num | tee -a "$filename"
        let count=count+1
    fi
done


-------- 
Example #1: Generate 12 primes 
[user1@Dropit1]$ ./prime2.sh 12
12841404153132670026955299
27857054904724552452284754
81568310181044201531493938
13079869097336916608138295
11548181180832955080995945
51463094490179387894276957
51030299236699634947776115
14450703660266325360717879
64547985867585941466931577
78069251415985862634474037
10465971001526544641642888
27731469424405572187906701

Example #2 - Generate 12 primes / output to twelve.txt
./prime2.sh 12 twelve.txt
14058270243095749056747305
68011603837278347949412365
11277947476716840890932116
66936680256308439242408566
11965437968024304730105808
54942917158512288613326915
12494590686059160418473943
16290559459276668804409535
89538606352698454812906633
76786475325997456661038398
93794115422726573233737930
96859693040626510435307809
[9x]::[07:52 AM]:[~]
[user1@Dropit1]# ls -altr twelve.txt 
-rw-r--r-- 1 user user 324 Jan 24 07:52 twelve.txt <- Content are in this 

