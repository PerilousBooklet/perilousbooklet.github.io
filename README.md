# perilousbooklet.github.io

My personal website.

<!-- TODO: Github Actions that automatically create a post on my social network profiles whenever a new article is pushed in `/posts`. -->

<!-- TODO: convert the website to a basic java spring webapp to setup proper page routing -->

## How the site is structured

The `static` folder contains the source code of the website (HTML/CSS/touch-of-JS from scratch, no frameworks).

The `public` folder is filled with generated code from a few templating scripts written in Lua.

<!-- TODO: fix RSS support -->

## How to create a blog post

(I use [emmet](https://emmet.io/) and custom HTML snippets saved in my text editor of choice to save time while writing posts in pure HTML/CSS)

1. Create a new HTML file inside `./static/posts/current_year`
2. Generate the base blog post template with `snpt-blog-base-article`
3. Write the article (use the snippets to add images, videos ,audios ,blockquotes, codeblocks, ...)
4. Generate the website with `./build.sh`
6. Open the website with `./run.sh`
