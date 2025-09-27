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
	cp -v ./feed.xml ./public/feed.xml
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
	# HEAD1
	if grep "__HEAD1__" "$i"; then
		replace "__HEAD1__" "./public/components/head1.html" "$i"
	fi
	# HEAD2
	if grep "__HEAD2__" "$i"; then
		replace "__HEAD2__" "./public/components/head2.html" "$i"
	fi
	# HEAD3
	if grep "__HEAD3__" "$i"; then
		replace "__HEAD3__" "./public/components/head3.html" "$i"
	fi
	# NAVBAR_POST
	if grep "__NAVBAR_POST__" "$i"; then
		replace "__NAVBAR_POST__" "./public/components/navbar_post.html" "$i"
	fi
	# STYLE_POST
	# if grep "__STYLE_POST__" "$i"; then
	# 	replace "__STYLE_POST__" "./public/components/style_post.html" "$i"
	# fi
	# FOOTER1
	if grep "_FOOTER1__" "$i"; then
		replace "__FOOTER1__" "./public/components/footer1.html" "$i"
	fi
	# FOOTER2
	if grep "_FOOTER2__" "$i"; then
		replace "__FOOTER2__" "./public/components/footer2.html" "$i"
	fi
done

# Generate table of contents for each blog post
readarray -t POSTS_ALL < <(find ./public/posts -name '*.html')
for i in "${POSTS_ALL[@]}"; do
	lua tools/generate_toc.lua "$i"
	echo -e "\e[32m[INFO]\e[0m: generated TOC for $i"
done

# Update RSS Feed
lua ./tools/generate_feed.lua ./public/posts
echo -e "\e[32m[INFO]\e[0m: generated RSS feed"
