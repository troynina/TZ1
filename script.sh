#!/bin/bash

recursia() {
    local from_dir="$1"
    local to_dir="$2"
    local file
    local to_file

    for file in "$from_dir"/*; do
        if [ -d "$file" ]; then
            recursia "$file" "$to_dir"
        elif [ -f "$file" ]; then
            local filename=$(basename "$file")
            to_file="$to_dir/$filename"
            local index=1
            while [ -e "$to_file" ]; do
                to_file="$to_dir/${filename%.*}_$index.${filename##*.}"
                ((index++))
            done
            cp "$file" "$to_file"
        fi
    done
}

if [ "$#" -ne 2 ]; then
    echo "Неправильно, введи в таком порядке: $0 <input_directory> <output_directory>"
fi
recursia "$1" "$2"
