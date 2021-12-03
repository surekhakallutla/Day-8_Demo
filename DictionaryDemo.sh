#!/bin/bash -x

declare -A sounds

sounds[lion]="Roar";
sounds[cow]="Mow";
sounds[dog]="Bark";
sounds[bird]="tweet";
sounds[wolf]="howl";

echo ${sounds[@]};
echo ${!sounds[@]};
echo ${#sounds[@]};


for keys in ${!sounds[@]}
do
	echo "$keys = ${sounds[$keys]}";
done