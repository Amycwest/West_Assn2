#! /bin/bash

#create new file to store code for child script
touch child.sh

#add shebang to child script so it knows it's a bash script
echo '#! /bin/bash' >> child.sh

#add command to child script to extract headings from the BTS_data and output it to a new file
echo 'cut -f 1-2,4 BTS_data.txt | grep ID > dBTS_heading' >> child.sh

#add command to child script to sort the orginal BTS_data by ID and output it to a new file
echo 'sort -k1 BTS_data.txt > dBTS_sort' >> child.sh

#add command to child script to extract the snakes needed (sed command which I googled),
#sort by trappability (sort), extract necessary columns (cut), and output data to a new file
echo 'sed -n '40,400p' dBTS_sort | sort -k4rg | cut -f 1-2,4 > dBTS_abridged' >> child.sh

#add command to child script to combine extracted data from previous command with the headings
echo 'cat dBTS_abridged >> dBTS_heading' >> child.sh

#add command to child script to make the headings line up and output everything to our final file 
echo 'column -t dBTS_heading > BTS_final' >> child.sh

#add command to child script to remove intermediate files
echo 'rm dBTS*' >> child.sh

#add command to child script to zip our final file
echo 'gzip BTS_final' >> child.sh

#give permission to run the child script
chmod ugo+x child.sh

#run the child script
./child.sh

