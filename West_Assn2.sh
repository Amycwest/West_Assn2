#! /bin/bash

#create new file to store code for child script
touch child.sh

#for loop echos 8 different commands into the child script see below for list of command annotations
for snake in '#! /bin/bash' 'cut -f 1-2,4 BTS_data.txt | grep ID > dBTS_heading' 'sort -k1 BTS_data.txt > dBTS_sort' 'sed -n '40,400p' dBTS_sort | sort -k4rg | cut -f 1-2,4 > dBTS_abridged' 'cat dBTS_abridged >> dBTS_heading' 'column -t dBTS_heading > BTS_final' 'rm dBTS*' 'gzip BTS_final'
do
	echo $snake >> child.sh
done

#Commands in the for loop:
#add shebang so it knows it's a bash script
#cut -f 1-2, 4 BTS_data.txt | grep ID > dBTS_heading: extract necessary columns using cut, grep ID to get just the headings from the BTS_data and output it to a new file called dBTS_heading
#sort -k1 BTS_data.txt > dBTS_sort: sort the orginal BTS_data by ID and output it to a new file called dBTS_sort
#sed -n '40,400p' dBTS_sort | sort -k4rg | cut -f 1-2,4 > dBTS_abridged: extract the IDnumbers needed (sed command), sort by trappability (sort), extract necessary columns (cut), and output data to a new file
#cat dBTS_abridged >> dBTS_heading: combine extracted data from previous command with the headings using cat command
#column -t dBTS_heading > BTS_final: make the headings line up and output everything to our final file using column command
#rm dBTS*: remove intermediate files using remove command, all files that need to be removed start with dBTS so used a wildcard 
#gzip BTS_final: zip our final file using gzip command

#give permission to run the child script
chmod ugo+x child.sh

#run the child script
./child.sh

