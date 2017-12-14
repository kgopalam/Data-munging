#!/bin/sh

# As a logic, if field 4,5,7 is match on both file write list.csv(all fields),phone.csv(field1) if field 4,5,7 does not match write list.csv(all fields),N/A
awk '
	BEGIN { OFS = FS = "," }
	NR == FNR {
		voip[$4,$5,$7] = $1;
		next;
	}
	{
		if (! (ip = voip[$4,$5,$7])) ip = "N/A";
		print $0, ip;
	}
' phone.csv list.csv

#another approach
 
awk -F"[, ]" 'NR==FNR{a[$1]=$1","$2; next} ($2 in a){print a[$2]","$1}' file1 file2 
#The -F"[, ]" sets the field separator to either a space or a comma. FNR is the current line number and NR the current line number of the current file. The two will be equal only while the 1st file is being read. Therefore, NR==FNR{a[$1]=$1","$2; next} will be run only on the lines of the first file and will save the 1st and 2nd fields (with a comma in between) as values in the array a whose keys are the 1st fields. Then, when the 2nd file is being read, if the 2nd field is in a, we print the value associated with it (the 1st and 2nd fields of the first file) and the 1st field of the second file.

#using Join
join -t, -1 1 -2 2 <(sort file1) <(sed 's/ /,/g' file2 | sort -t"," -k2) 

#I want to compare the two strings in file1 with each line in file2. If both strings match anywhere on that line, print the line from file2. 
awk -f <(sed 's/^\|$/\//g; s/ /\/ \&\& \//g' file1) file2
