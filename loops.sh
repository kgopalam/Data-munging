#!/bin/bash


# loops syntax

declare -a Countries  #  Declare array
Countries=(Netherlands Ukraine Zaire Turkey Russia Yemen Syria)
echo "${Countries[*]}"  # List entire array at pass 0.

number_of_elements=${#Countries[@]}
echo $number_of_elements
while (( $number_of_elements > 0 ))
do 
	
	let number_of_elements-=1
	
done


months=(Jan Feb Mar APR)

for mon in $months
do
	echo $mon
done