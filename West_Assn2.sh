#! /bin/bash

touch child.sh

echo '#! /bin/bash' >> child.sh
echo 'cut -f 1-2,4 BTS_data.txt | grep ID > dBTS_heading' >> child.sh
echo 'sort -k1 BTS_data.txt > dBTS_sort' >> child.sh
echo 'sed -n '40,400p' dBTS_sort | sort -k4rg | cut -f 1-2,4 > dBTS_abridged' >> child.sh
echo 'cat dBTS_abridged >> dBTS_heading' >> child.sh
echo 'column -t dBTS_heading > BTS_final' >> child.sh
echo 'rm dBTS*' >> child.sh
echo 'gzip BTS_final' >> child.sh

chmod u+x child.sh

./child.sh

