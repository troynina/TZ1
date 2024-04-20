#!/bin/bash

recursia() {
    local from_dir="$1"
    local to_dir="$2"
    local file

    for file in "$from_dir"/*; do
        if [ -d "$file" ]; then
            recursia "$file" "$to_dir"
        elif [ -f "$file" ]; then
            cp "$file" "$to_dir"
        fi
    done
}

if [ "$#" -ne 2 ]; then
    echo "Неправильно, введи в таком порядке: $0 <input_directory> <output_directory>"
fi
recursia "$1" "$2"
