#! /bin/bash -ve

make.sh


unlink data-experiment-commit-k30.txt || true
touch data-experiment-commit-k30.txt

echo "k L iter filesize runtime" > data-experiment-commit-k30.txt
BenchCommit 30 2000 100 2>/dev/null 1>>data-experiment-commit-k30.txt
BenchCommit 30 4000 100 2>/dev/null 1>>data-experiment-commit-k30.txt
BenchCommit 30 6000 100 2>/dev/null 1>>data-experiment-commit-k30.txt
BenchCommit 30 8000 100 2>/dev/null 1>>data-experiment-commit-k30.txt
BenchCommit 30 10000 100 2>/dev/null 1>>data-experiment-commit-k30.txt
BenchCommit 30 12000 100 2>/dev/null 1>>data-experiment-commit-k30.txt
BenchCommit 30 14000 100 2>/dev/null 1>>data-experiment-commit-k30.txt
BenchCommit 30 16000 100 2>/dev/null 1>>data-experiment-commit-k30.txt


unlink data-experiment-commit-k300.txt || true
touch data-experiment-commit-k300.txt

echo "k L iter filesize runtime" > data-experiment-commit-k300.txt
BenchCommit 300 200 500 2>/dev/null 1>>data-experiment-commit-k300.txt
BenchCommit 300 400 500 2>/dev/null 1>>data-experiment-commit-k300.txt
BenchCommit 300 800 500 2>/dev/null 1>>data-experiment-commit-k300.txt
BenchCommit 300 1200 500 2>/dev/null 1>>data-experiment-commit-k300.txt
BenchCommit 300 1600 500 2>/dev/null 1>>data-experiment-commit-k300.txt
BenchCommit 300 2000 500 2>/dev/null 1>>data-experiment-commit-k300.txt
BenchCommit 300 2400 500 2>/dev/null 1>>data-experiment-commit-k300.txt
BenchCommit 300 2800 500 2>/dev/null 1>>data-experiment-commit-k300.txt
BenchCommit 300 3000 500 2>/dev/null 1>>data-experiment-commit-k300.txt


unlink data-experiment-commit-k100.txt || true
touch data-experiment-commit-k100.txt

echo "k L iter filesize runtime" > data-experiment-commit-k100.txt
BenchCommit 100 70 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 120 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 250 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 400 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 530 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 700 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 800 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 900 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 1000 500 2>/dev/null 1>>data-experiment-commit-k100.txt
