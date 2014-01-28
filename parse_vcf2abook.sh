#!/bin/bash
#
# Parse google.vcf to abook contact list

if [ -z "$1" ]; then
echo "Usage: $0 file_name"
exit 1;
fi

awk -F ':' 'BEGIN {
 i=0;
 print "# abook addressbook file\n\n[format]\nprogram=abook\nversion=0.5.6";
}{
 if($1 == "BEGIN"){
  print "\n\n[" i++ "]";
  mailCount=0;
 };
 if($1 == "FN") printf "name=" $2;
 if(index($1, "EMAIL")){ 
  if(mailCount == 0)printf "\nemail=" $2;
  else printf "," $2;mailCount++
 }
} END {
 print "\n\n";
}' $1
