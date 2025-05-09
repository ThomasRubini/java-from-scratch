#!/bin/bash
set -xe

# Create the build directory if it doesn't exist
mkdir -p build

# Loop through all .java files in the src directory
for file in $(find src -name "*.java"); do
    # Compile each .java file into the build directory
    javac -d build/classes "$file"
done

# Create a JAR file from the compiled classes with a Main-Class attribute
echo "Main-Class: $(cat mainclass.txt)" > build/manifest.txt
jar cfm build/app.jar build/manifest.txt -C build/classes .

echo "Build complete. JAR file created at build/app.jar"
