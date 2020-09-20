#! /bin/bash

touch child.sh

echo 'cut -f 1-2,4 BTS_data.txt | grep ID > BTS_heading' >> child.sh
echo 'sort -k1 BTS_data.txt > BTS_sort' >> child.sh
echo 'sed -n '17,218p' BTS_sort | sort -k4rg | cut -f 1-2,4 > BTS_abridged' >> child.sh
echo 'cat BTS_abridged >> BTS_heading' >> child.sh
echo 'column -t BTS_heading > BTS_final' >> child.sh


chmod u+x child.sh

./child.sh

