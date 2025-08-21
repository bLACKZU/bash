#scores.txt contains two columns: 1: key, 2: value. This script sums up all the numbers as we move down the column 2 and divide it by the respective key in column 1. This script illustrates the different commands for positional arguments and binary calculator in linux.
#The result is set to 2 values after decimal. Adjust it by altering the scale

value=0
while IFS= read -r line; do
        set -- $line
        key=$1
        sum=$(echo $value+$2 | bc)
        value=$sum
        div=$(echo "scale=2; $sum/$1" | bc)
        echo $div
done < scores.txt