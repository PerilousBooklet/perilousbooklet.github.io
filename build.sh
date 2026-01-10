#!/bin/bash

###################################
## Tiny Static Templating Script ##
###################################

# Copy `static` source code into `public` folder
if [ ! -d ./public ]; then
	echo -e "\e[32m[INFO]\e[0m Creating ./public/"
	mkdir ./public
	echo -e "\e[32m[INFO]\e[0m Copying source files into ./public"
	cp -r ./static/* ./public/
else
	echo -e "\e[32m[INFO]\e[0m Cleaning ./public/"
	rm -r ./public/*
	echo -e "\e[32m[INFO]\e[0m Copying source files into ./public"
	cp -r ./static/* ./public/
fi

# Convert .md posts to .html files
echo -e "\e[32m[INFO]\e[0m Converting posts"
YEARS=$(find ./public/posts -type d | awk -F '/' '{print $4}' | tail -n 2)
for i in $YEARS; do
	POSTS=$(find ./public/posts/"$i" -name '*.md' | awk -F '/' '{print $5}' | sed 's|.md||g' | head -n 2)
	for j in $POSTS; do
		echo -e "\e[32m[INFO]\e[0m --> Converting post: $i/$j"
		pandoc \
			--wrap=none \
			--template "./static/templates/template_post.html" \
			-f gfm \
			"./static/posts/$i/$j.md" \
			-o "./public/posts/$i/$j.html"
	done
done

# Iterate tag replacement
FILES_ALL=$(find ./public ./public/posts ./public/pages -name '*.html')
replace() {
	CONTENT=$(<"$2")
	CONTENT_ESCAPED=$(printf '%s\n' "$CONTENT" | sed 's/[&/\]/\\&/g;:a;N;$!ba;s/\n/\\n/g')
	sed -i "s|$1|$CONTENT_ESCAPED|g" "$3"
}
for i in $FILES_ALL; do
	# HEAD1
	if grep "__HEAD1__" "$i"; then
		echo -e "\e[32m[INFO]\e[0m Replacing __HEAD1__"
		replace "__HEAD1__" "./public/components/head1.html" "$i"
	fi
	# HEAD2
	if grep "__HEAD2__" "$i"; then
		echo -e "\e[32m[INFO]\e[0m Replacing __HEAD2__"
		replace "__HEAD2__" "./public/components/head2.html" "$i"
	fi
	# HEAD3
	if grep "__HEAD3__" "$i"; then
		echo -e "\e[32m[INFO]\e[0m Replacing __HEAD3__"
		replace "__HEAD3__" "./public/components/head3.html" "$i"
	fi
	# NAVBAR_POST
	if grep "__NAVBAR_POST__" "$i"; then
		echo -e "\e[32m[INFO]\e[0m Replacing __NAVBAR_POST__"
		replace "__NAVBAR_POST__" "./public/components/navbar_post.html" "$i"
	fi
	# FOOTER1
	if grep "_FOOTER1__" "$i"; then
		echo -e "\e[32m[INFO]\e[0m Replacing _FOOTER1__"
		replace "__FOOTER1__" "./public/components/footer1.html" "$i"
	fi
	# FOOTER2
	if grep "_FOOTER2__" "$i"; then
		echo -e "\e[32m[INFO]\e[0m Replacing _FOOTER2__"
		replace "__FOOTER2__" "./public/components/footer2.html" "$i"
	fi
done

# Generate table of contents for each blog post
POSTS_ALL=$(find ./public/posts -name '*.html')
for i in $POSTS_ALL; do
	lua tools/generate_toc.lua "$i"
	echo -e "\e[32m[INFO]\e[0m generated TOC for $i"
done

# WIP: Generate blog post list
# lua ./tools/generate_blogpost_list.lua ./public/posts

# Update RSS Feed
lua ./tools/generate_feed.lua ./public/posts
echo -e "\e[32m[INFO]\e[0m generated RSS feed"
