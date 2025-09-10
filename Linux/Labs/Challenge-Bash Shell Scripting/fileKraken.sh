#!/bin/bash

# touch fileKraken
# create a single file with extension .txt
# create a base name <yourName>
# and then create multiple files with the same base name
# file format <yourName><number>.txt, <yourName><number+1>.txt, <yourName><number+2>.txt
# each file will be 0kb in size in the same directory
# each time you run the script, 25 files will be created
# batch size is 25
# next batch will create another 25 files starting from the last number of the previous batch
# so if you run the script 3 times, you will have 75 files created
# the number of files should increament by 1 (until you stop the script)

echo "Enter your base file name (without extension):"
read filename
# Check if the filename is empty
if [ -z "$filename" ]; then
  echo "Filename cannot be empty. Exiting."
  exit 1
fi

echo "Hello, this script will create $filename!"
# keeping track of the numbers
LAST_NUMBER_FILE="last_printed_number.txt"
start_number=1
# Check if the last_printed_number.txt file exists
if [ -f "$LAST_NUMBER_FILE" ]; then
    # Read the last printed number from the file
    start_number=$(cat "$LAST_NUMBER_FILE")
    # Increment by 1 to continue the sequence
    start_number=$((start_number + 1))
fi

# Define the ending number for the current batch
end_number=$((start_number + 24))
# Print the numbers in the current batch
for i in $(seq "$start_number" "$end_number"); do
     touch "$filename$i.txt"
done

# Store the last printed number for the next execution
echo "$end_number" > "$LAST_NUMBER_FILE"

# for i in {1..10}
# do
#   touch "$filename$i.txt"
# done
# touch "$filename.txt"
