-----------------------------------
-- TINY STATIC TEMPLATING ENGINE --
-----------------------------------

file_path = "./static/posts/2025/1-arch-linux-is-great.html"

-- Extract headers
-- TODO: set file path input from stdin argument
local function extract_headers()
  headers_raw = {}
  for line in io.lines(file_path) do
    if string.find(line, "<h2>") then
      line = string.gsub(line, "<h2>", "-")
      line = string.gsub(line, "</h2>", "-")
      line = string.gsub(line, "-", "")
      line = string.gsub(line, "          ", "") -- Remove redundant spaces
      table.insert(headers_raw, line)
    end
  end
  for _,v in pairs(headers_raw) do
    print(v)
  end
  print(" ")
end


-- WIP: Generate the treeview
-- tag: __TOC__
local function generate_treeview()
  local treeview = {}
  table.insert(treeview, "<!-- TABLE OF CONTENTS -->")
  table.insert(treeview, '<div class="toc">')
  table.insert(treeview, "  <p><b>Table of Contents</b></p>")
  table.insert(treeview, "  <ul>")
  for _, header in pairs(headers_raw) do
    -- Generate paragraph reference
    local href = string.lower("#" .. string.gsub(header, " ", ""))
    -- Generate list item
    table.insert(treeview, '    ' .. '<li><a href="' .. href .. '">' .. header .. "</a></li>")
  end
  table.insert(treeview, "  </ul>")
  table.insert(treeview, "</div>")
  table.insert(treeview, "<br>")
  -- log
  for _,v in pairs(treeview) do
    print(v)
  end
  print(" ")
  -- WIP: Paste into HTML file
  local file = io.open(file_path, "r")
  if not file then
    print("Unable to open the file.")
    return
  end
  local content = file:read("*a")
  file:close()
  -- search for tag
  -- get treeview
  file = io.open(file_path, "w")
  -- update content
  -- file:write(content)
  -- file:close()
end


-- WIP: generate the style code for the treeview
-- tag: __TOC_STYLE__
local function generate_treeview_style_code()
  local treeview_style_code = {}
  local style_code = " {scroll-margin-top: 70px;}"
  -- iterate through all headers and assign style_code
  for _,v in pairs(headers_raw) do
    local line = string.lower("#" .. string.gsub(v, " ", "")) .. style_code
    table.insert(treeview_style_code, line)
    print(line)
  end
  print(" ")
  -- TODO: paste into file
end


-- WIP: generate the h2 IDs
local function generate_h2_ids()
  local treeview_ids = {}
  local id_start = ' id="'
  local id_end = '"'
  -- iterate throught headers and generate id
  for _,v in pairs(headers_raw) do
    local line = id_start .. string.lower(string.gsub(v, " ", "")) .. id_end
    table.insert(treeview_ids, line)
    print(line)
  end
  print(" ")
  -- TODO: paste into file
end


-- Main
extract_headers()
generate_treeview()
generate_treeview_style_code()
generate_h2_ids()
