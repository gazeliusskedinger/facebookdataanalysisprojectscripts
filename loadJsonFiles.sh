#!/bin/bash
# Obs change to your directory
filelist=`find "$PWD" -name *.json` ;
multiples="message_1.json"
#multiples=("message_1.json" )
count=1
#count=(1 )
for jsonfile in $filelist ;
do
	name="$(basename $jsonfile)"
	collectionname=${name%%.*}
	cleancollection=${collectionname//[^[:alnum:]]/}
#	bdname="cleancollection$count"
	if [ "$name" == "$multiples" ]
	then
	#	collectionname=${name%%.*}
	#	cleancollection=${collectionname//[^[:alnum:]]/}
		dbname="$cleancollection$count"
		let "count += 1"
		mongoimport -d facebookdata --file "$jsonfile" --type json --collection "$dbname"
		echo "$dbname"
	else
		mongoimport -d facebookdata --file "$jsonfile" --type json --collection "$cleancollection"
		echo "$cleancollection"
	fi
done ;

#TODO generalise it to work with more multiple filenames

#TODO using arguments -f filepath/to/project/root/folder -m multible filenames
