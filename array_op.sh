#!/bin/bash

array_test=( one two three four five five )

#prints all elements
echo ${array_test[@]:0}

#prints two elements after first element
echo ${array_test[@]:1:2}

#applied to all elements and matches "four" and removes it
echo ${array_test[@]#f*r}

#Delete all occurrences of substring.
# Not specifing a replacement defaults to 'delete' ...
echo ${array_test[@]//fi/}    

# Replace back-end occurrences of substring.
echo ${array_test[@]/%ve/ZZ} 

#to copy an array
echo ${array_copy[@]}
     