#!/bin/sh

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