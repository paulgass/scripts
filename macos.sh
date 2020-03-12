#!/bin/zsh

cd

echo "Enter App Name"
read water

cd
mkdir $water
cd
cd $water

touch apples.txt

pwd

cat > bananas.txt << EOF101
file
with
lines
of
text
EOF101

cd
cd $water
exec zsh
