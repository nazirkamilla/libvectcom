#! /bin/bash -ve

make.sh


unlink data-experiment-encode-k30.txt || true
touch data-experiment-encode-k30.txt

echo "n k L iter filesize runtime" > data-experiment-encode-k30.txt
BenchEncode 30 90 2000 500 2>/dev/null 1>>data-experiment-encode-k30.txt
BenchEncode 30 90 4000 500 2>/dev/null 1>>data-experiment-encode-k30.txt
BenchEncode 30 90 6000 500 2>/dev/null 1>>data-experiment-encode-k30.txt
BenchEncode 30 90 8000 500 2>/dev/null 1>>data-experiment-encode-k30.txt
BenchEncode 30 90 10000 500 2>/dev/null 1>>data-experiment-encode-k30.txt
BenchEncode 30 90 12000 500 2>/dev/null 1>>data-experiment-encode-k30.txt
BenchEncode 30 90 14000 500 2>/dev/null 1>>data-experiment-encode-k30.txt
BenchEncode 30 90 16000 500 2>/dev/null 1>>data-experiment-encode-k30.txt


unlink data-experiment-encode-k300.txt || true
touch data-experiment-encode-k300.txt

echo "n k L iter filesize runtime" > data-experiment-encode-k300.txt
BenchEncode 300 900 200 500 2>/dev/null 1>>data-experiment-encode-k300.txt
BenchEncode 300 900 400 500 2>/dev/null 1>>data-experiment-encode-k300.txt
BenchEncode 300 900 800 500 2>/dev/null 1>>data-experiment-encode-k300.txt
BenchEncode 300 900 1200 500 2>/dev/null 1>>data-experiment-encode-k300.txt
BenchEncode 300 900 1600 500 2>/dev/null 1>>data-experiment-encode-k300.txt
BenchEncode 300 900 2000 500 2>/dev/null 1>>data-experiment-encode-k300.txt
BenchEncode 300 900 2400 500 2>/dev/null 1>>data-experiment-encode-k300.txt
BenchEncode 300 900 2800 500 2>/dev/null 1>>data-experiment-encode-k300.txt
BenchEncode 300 900 3000 500 2>/dev/null 1>>data-experiment-encode-k300.txt


unlink data-experiment-encode-k75.txt || true
touch data-experiment-encode-k75.txt

echo "n k L iter filesize runtime" > data-experiment-encode-k75.txt
BenchEncode 75 225 700 500 2>/dev/null 1>>data-experiment-encode-k75.txt
BenchEncode 75 225 1200 500 2>/dev/null 1>>data-experiment-encode-k75.txt
BenchEncode 75 225 2500 500 2>/dev/null 1>>data-experiment-encode-k75.txt
BenchEncode 75 225 4000 500 2>/dev/null 1>>data-experiment-encode-k75.txt
BenchEncode 75 225 5300 500 2>/dev/null 1>>data-experiment-encode-k75.txt
BenchEncode 75 225 7000 500 2>/dev/null 1>>data-experiment-encode-k75.txt
BenchEncode 75 225 8000 500 2>/dev/null 1>>data-experiment-encode-k75.txt
BenchEncode 75 225 9000 500 2>/dev/null 1>>data-experiment-encode-k75.txt

