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
BenchCommit 100 700 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 1200 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 2500 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 4000 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 5300 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 7000 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 8000 500 2>/dev/null 1>>data-experiment-commit-k100.txt
BenchCommit 100 9000 500 2>/dev/null 1>>data-experiment-commit-k100.txt


unlink data-experiment-commit-k75.txt || true
touch data-experiment-commit-k75.txt

echo "k L iter filesize runtime" > data-experiment-commit-k75.txt
BenchCommit 75 700 500 2>/dev/null 1>>data-experiment-commit-k75.txt
BenchCommit 75 1200 500 2>/dev/null 1>>data-experiment-commit-k75.txt
BenchCommit 75 2500 500 2>/dev/null 1>>data-experiment-commit-k75.txt
BenchCommit 75 4000 500 2>/dev/null 1>>data-experiment-commit-k75.txt
BenchCommit 75 5300 500 2>/dev/null 1>>data-experiment-commit-k75.txt
BenchCommit 75 7000 500 2>/dev/null 1>>data-experiment-commit-k75.txt
BenchCommit 75 8000 500 2>/dev/null 1>>data-experiment-commit-k75.txt
BenchCommit 75 9000 500 2>/dev/null 1>>data-experiment-commit-k75.txt

