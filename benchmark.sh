#!/bin/bash

source benchmark.env

readonly DATA=$*

./out/cpp/JsonBenchmark $DATA
./out/cppGCGen/JsonBenchmark $DATA
node out/JsonBenchmark.js $DATA
node out/JsonBenchmark.es6.js $DATA
java -jar out/java/JsonBenchmark.jar $DATA
java -jar out/jvm/JsonBenchmark.jar $DATA
hl out/JsonBenchmark.hl $DATA
./out/hl/JsonBenchmark $DATA
mono out/cs/bin/JsonBenchmark.exe $DATA
haxe build/common.hxml --run JsonBenchmark $DATA
php out/php/index.php $DATA
neko out/JsonBenchmark.n $DATA
python3 out/JsonBenchmark.py $DATA
# lua out/JsonBenchmark.lua $DATA
