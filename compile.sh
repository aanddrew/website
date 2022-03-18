#!/bin/bash
mkdir -p build

function compile_file() {
    OUT="build/${1##*/}"
    cat template.html <(echo "<article>") $1 <(echo "</article>") > $OUT
}

for FILE in ./{toplevel,projects}/*.html
do
    compile_file $FILE
done

cp styles.css build
cp -r pictures build
cp -r toplevel/*.txt build
