#Split a file in chunks with a specific size
#sample output - data-00.csv, data-01.csv

split -b 1K -d --additional-suffix=.csv data.csv data-