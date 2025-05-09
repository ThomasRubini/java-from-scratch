#!/bin/bash
set -e

# Create the build directory if it doesn't exist
mkdir -p build

find src -name "*.java" > build/sources.txt

# Loop through all .java files in the src directory
for dir in $(find src -type d); do
    # Check if the directory contains at least one .java file
    if find "$dir" -maxdepth 1 -name "*.java" | grep -q .; then
        javac -d build/classes "$dir"/*.java @build/sources.txt
    fi
done

# Create a JAR file from the compiled classes with a Main-Class attribute
echo "Main-Class: $(cat mainclass.txt)" > build/manifest.txt
jar cfm build/app.jar build/manifest.txt -C build/classes .

echo "Build complete. JAR file created at build/app.jar"
