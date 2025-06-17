#!/bin/bash
mkdir -p docs

function compile_file() {
    OUT="docs/${1##*/}"
    cat template.html <(echo -e "\n\n<article>\n") $1 <(echo -e "\n</article>\n</body>") > $OUT
}

for FILE in ./{toplevel,projects}/*.html
do
    compile_file $FILE
done

cp styles.css docs
cp -r pictures docs
cp -r toplevel/*.txt docs
