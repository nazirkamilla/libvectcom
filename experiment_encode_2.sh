#! /bin/bash -ve

make.sh


unlink data-experiment-encode.txt || true
touch data-experiment-encode.txt

echo "# filesize runtime storage" > data-experiment-encode.txt
BenchEncode 50 150 10000 500 2>/dev/null 1>>data-experiment-encode.txt
BenchEncode 100 300 5000 500 2>/dev/null 1>>data-experiment-encode.txt
BenchEncode 150 450 3330 500 2>/dev/null 1>>data-experiment-encode.txt
BenchEncode 200 600 2500 500 2>/dev/null 1>>data-experiment-encode.txt





