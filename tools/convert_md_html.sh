#!/bin/bash

# ?
if [ ! -d ./public/pages/notes ]; then
	mkdir -v ./public/pages/notes
fi

# ?
cp -vr ./static/pages/notes/* ./public/pages/notes

# ?
# REDO
readarray -t FILES_ALL < <(find ./public/pages/notes/ -name '*.md' | sed 's|.md||g' | sed 's|./public/pages/notes/||g')
FILES_ALL=("${FILES_ALL[@]/README.md}")

# ?
# REDO
for i in "${FILES_ALL[@]}"; do
  echo "$i"
  pandoc ./public/pages/notes/"$i".md -s -o ./public/pages/notes/html/"$i".html
done
