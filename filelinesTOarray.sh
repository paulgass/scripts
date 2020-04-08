#!/bin/bash

echo helloworld

x=23

y=(6 345 867 27 9)

echo $x

echo goodbye

echo $y

read -a z < /home/paulgass/bashprobs/foo.txt

echo world

echo $z

echo hola

words=$(cat /home/paulgass/bashprobs/foo.txt)

echo adios

echo $words

echo yoyoyo

echo ${y[3]}

echo yyyyyy

mapfile wednesday < /home/paulgass/bashprobs/foo.txt

echo ${wednesday[@]}

echo okweredonehere

echo ${wednesday[4]}
