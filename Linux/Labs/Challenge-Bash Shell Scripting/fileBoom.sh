#!/bin/bash

batch_size=25
while [ -z "$filename" ]; do
    read -rp "Enter base filename (no extension): " filename
done

counter=".${filename}_counter"
# Read counter and remove any carriage returns
start=$(tr -d '\r' < "$counter" 2>/dev/null || echo 1)
end=$((start + batch_size - 1))

for ((i = start; i <= end; i++)); do
    touch "${filename}${i}.txt"
done

# Ensure we write with Unix line endings
printf "%d" $((end + 1)) > "$counter"
echo "Created $batch_size files: ${filename}${start}.txt → ${filename}${end}.txt"

# batch_size=25
# while [ -z "$filename" ]; do
#     read -rp "Enter base filename (no extension): " filename
# done

# counter=".${filename}_counter"
# start=$(<"$counter" 2>/dev/null || echo 1)
# end=$((start + batch_size - 1))

# for ((i = start; i <= end; i++)); do
#     touch "${filename}${i}.txt"
# done

# echo $((end + 1)) > "$counter"
# echo "Created $batch_size files: ${filename}${start}.txt → ${filename}${end}.txt"
# batch_size=25
# while [ -z "$filename" ]; do
#     read -p "Enter base filename (no extension): " filename
# done

# counter=".${filename}_counter"
# start=$(( $(<"$counter" 2>/dev/null || echo 0) + 1 ))
# end=$((start + batch_size - 1))

# for ((i=start; i<=end; i++)); do
#     touch "${filename}${i}.txt"
# done

# echo "$end" > "$counter"
# echo "Created ${batch_size} files: ${filename}${start}.txt → ${filename}${end}.txt"
