#!/bin/bash

###################################
## Tiny Static Templating Script ##
###################################

# Copy `static` source code into `public` folder
if [ ! -d ./public ]; then
	mkdir -v ./public
else
	rm -vr ./public/*
	cp -vr ./static/* ./public/
fi

# Get list of files (use readarray to rearrange the data from `find` into proper bash array syntax)
readarray -t FILES_ALL < <(find ./public ./public/posts ./public/pages -name '*.html')

# Iterate tag replacement
replace() {
	CONTENT=$(<"$2")
	CONTENT_ESCAPED=$(printf '%s\n' "$CONTENT" | sed 's/[&/\]/\\&/g;:a;N;$!ba;s/\n/\\n/g')
	sed -i "s|$1|$CONTENT_ESCAPED|g" "$3"
}
for i in "${FILES_ALL[@]}"; do
	# HEADER1
	if grep "__HEADER1__" "$i"; then
		replace "__HEADER1__" "./public/components/header1.html" "$i"
	fi
	# HEADER2
	if grep "__HEADER2__" "$i"; then
		replace "__HEADER2__" "./public/components/header2.html" "$i"
	fi
	# HEADER3
	if grep "__HEADER3__" "$i"; then
		replace "__HEADER3__" "./public/components/header3.html" "$i"
	fi
	# HEADER4
	if grep "__HEADER4__" "$i"; then
		replace "__HEADER4__" "./public/components/header4.html" "$i"
	fi
	# NAVBAR_POST
	if grep "__NAVBAR_POST__" "$i"; then
		replace "__NAVBAR_POST__" "./public/components/navbar_post.html" "$i"
	fi
	# NAVBAR_COURSE
	if grep "__NAVBAR_COURSE__" "$i"; then
		replace "__NAVBAR_COURSE__" "./public/components/navbar_course.html" "$i"
	fi
	# NAVBAR_TOPIC
	if grep "__NAVBAR_TOPIC__" "$i"; then
		replace "__NAVBAR_TOPIC__" "./public/components/navbar_topic.html" "$i"
	fi
	# STYLE_TREEVIEW
	if grep "__STYLE_TREEVIEW__" "$i"; then
		replace "__STYLE_TREEVIEW__" "./public/components/style_treeview.html" "$i"
	fi
done

# Generate table of contents for each blog post
readarray -t POSTS_ALL < <(find ./public/posts -name '*.html')
for i in "${POSTS_ALL[@]}"; do
	lua tools/generate_toc.lua "$i"
	echo -e "\e[32m[INFO]\e[0m: generated TOC for $i"
done

# TODO: Update RSS Feed
