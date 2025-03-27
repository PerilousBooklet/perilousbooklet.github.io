# perilousbooklet.github.io

My personal website.

<!-- TODO: Github Actions that automatically create a post on my Linkedin/Reddit profile whenever a new article is pushed in `/posts`. -->

## How the site is structured

The `static` folder contains the source code of the website (HTML/CSS/JS from scratch, no frameworks).

The `public` folder is filled with the generated code from the run script.

To avoid using any server-side templating tools, this website uses custom tags that are matched by the build script and 
replaced with HTML code stored in component files, just as if it was using PHP.

A small script written in Lua is also used to generate properly indented and colored code blocks (WIP).

## How to create a blog post

(I use [emmet](https://emmet.io/) and custom HTML snippets saved in my text editor of choice to save time while writing posts in pure HTML/CSS)

1. Create a new HTML file inside `./static/posts/2025`
2. Generate the base blog post template
3. Write the article (use the element templates to add images/videos/audios/blockquotes/...)
4. Generate the paragraphs treeview with `lua ./tools/generate_treeview.lua` (this script runs ONCE)
5. Re-generate the website with `./build.sh`
6. Go to the website with `./run.sh`
