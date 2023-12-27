Filename: RandfromPrime.sh
Example 1: Both are identical except this example has "bash debugging" enabled with -x check it out

#!/bin/bash -x

generate_random_number() {
    od -An -N13 -tu8 /dev/random | tr -d ' \n' | head -c 26
}

count=0

while [ $count -lt 10 ]; do
    # Generate a 26-digit number
    num=$(generate_random_number)

    # Check if the number is prime
    if openssl prime $num > /dev/null 2>&1; then
        echo $num
        let count=count+1
    fi
done

----- Output with bash -x
<snip>
++ od -An -N13 -tu8 /dev/random
++ tr -d ' \n'
10607901464292936557869062
++ head -c 26
+ num=15598847946883484310884357
+ openssl prime 15598847946883484310884357
+ echo 15598847946883484310884357
+ let count=count+1
15598847946883484310884357
+ '[' 7 -lt 10 ']'
++ generate_random_number
++ head -c 26
++ tr -d ' \n'
++ od -An -N13 -tu8 /dev/random
+ num=52262050481677617616846695
+ openssl prime 52262050481677617616846695
+ echo 52262050481677617616846695
+ let count=count+1
52262050481677617616846695
+ '[' 8 -lt 10 ']'
++ generate_random_number
++ head -c 26
++ tr -d ' \n'
++ od -An -N13 -tu8 /dev/random
+ num=28909802443370402776220
<snip>

[ -------------------------------------------------------------------------------------------------------------------------------- ]
The Reason I did not just give you the script is you can learn alot from bash -x

#!/bin/bash
echo "Generating 26 digit long randomish #s"

generate_random_number() {
    od -An -N13 -tu8 /dev/random | tr -d ' \n' | head -c 26
}
count=0
while [ $count -lt 10 ]; do
    # Generate a 26-digit number
    num=$(generate_random_number)

    # Check if the number is prime
    if openssl prime $num > /dev/null 2>&1; then
        echo $num
        let count=count+1
    fi
done


--- output
./prime.sh  # run 1
40547082496694323310738841
76519631569493783047693132
13750629218000176106637602
17459218993053761879699503
79790910547694871399317903
15960352232631670369331427
96674330989809674312267783
19161115313089650426476158
14790328377967052182915347
45343241827324932269856120

./prime.sh    # run 2
93464145064590647244398724
16103860977751358657105186
10362564978254419614366830
68299946291691603572094896
53162906937965774827428648
12951220178826000194276472
14644443239106358703806496
36100279160830153467370977
16159389214870826510304346
17117068771411494349387341


./prime.sh  # Run 3 
16675167930912350168172886
73714755275047389671085705
11718769749823120493659161
18633763241610194081042444
87512585145085063333831421
54562794840690145561008514
12269968982947170079932399
11230552632548967195998251
17331846751946223018180685
16494624517852103435925688


Summary:
True random numbers are challenging to generate because most computational methods rely on deterministic processes,
which are inherently predictable and follow set algorithms. In contrast, true randomness requires unpredictability 
and the absence of any pattern, which is difficult to achieve with algorithm-based computer systems. Natural phenomena, 
such as atmospheric noise or radioactive decay, can provide true randomness, but these are harder to harness consistently 
and efficiently in computational systems.



