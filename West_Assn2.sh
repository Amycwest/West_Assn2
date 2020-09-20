#! /bin/bash

#create new file to store code for child script
touch child.sh

#for loop echos 8 different commands into the child script see below for list of commands
for snake in '#! /bin/bash' 'cut -f 1-2,4 BTS_data.txt | grep ID > dBTS_heading' 'sort -k1 BTS_data.txt > dBTS_sort' 'sed -n '40,400p' dBTS_sort | sort -k4rg | cut -f 1-2,4 > dBTS_abridged' 'cat dBTS_abridged >> dBTS_heading' 'column -t dBTS_heading > BTS_final' 'rm dBTS*' 'gzip BTS_final'
do
	echo $snake >> child.sh
done

#add shebang so it knows it's a bash script
#extract headings from the BTS_data and output it to a new file
#sort the orginal BTS_data by ID and output it to a new file
#extract the IDnumbers needed (sed command which I googled),sort by trappability (sort), extract necessary columns (cut), and output data to a new file
#combine extracted data from previous command with the headings
#make the headings line up and output everything to our final file 
#remove intermediate files
#zip our final file

#give permission to run the child script
chmod ugo+x child.sh

#run the child script
./child.sh

