-----------------------------------
-- TINY STATIC TEMPLATING ENGINE --
-----------------------------------

-- file_path = "./static/posts/2025/current_file"
-- TODO: set file path input from stdin argument
file_path = "temp.html"

-- Extract headers
local function extract_headers()
  headers_raw = {}
  for line in io.lines(file_path) do
    if string.find(line, "<h2") then
      line = string.gsub(line, "<h2", "-")
      line = string.gsub(line, 'style="color: #5cb3fa;">', "-")
      line = string.gsub(line, "</h2>", "-")
      line = string.gsub(line, "-", "")
      line = string.gsub(line, "         ", "")
      table.insert(headers_raw, line)
    end
  end
  -- Debug
  -- print(" ")
  -- for _,v in pairs(headers_raw) do
  --   print(v)
  -- end
  -- print(" ")
end


-- Generate the treeview
local function generate_treeview()
  local treeview = {}
  table.insert(treeview, "<!-- TABLE OF CONTENTS -->")
  table.insert(treeview, '<div class="toc">')
  table.insert(treeview, "  <p><b>Table of Contents</b></p>")
  table.insert(treeview, "  <ul>")
  for _, header in pairs(headers_raw) do
    -- Generate paragraph reference
    local href = string.lower("#" .. string.gsub(header, " ", "-"))
    -- Generate list item
    table.insert(treeview, '    ' .. '<li><a href="' .. href .. '">' .. header .. "</a></li>")
  end
  table.insert(treeview, "  </ul>")
  table.insert(treeview, "</div>")
  table.insert(treeview, "<br>")
  -- Debug
  -- for _,v in pairs(treeview) do
  --   print(v)
  -- end
  -- print(" ")
  -- Generate HTML code
  local html_code = table.concat(treeview, "\n")
  print(html_code)
  print(" ")
  -- Read the file
  local input_file = io.open("temp.html", "r")
  local lines = {}
  for line in input_file:lines() do
    table.insert(lines, line)
    -- print(line)
  end
  input_file:close()
  -- Write into the file
  -- WIP
  for _, line in pairs(lines) do
    if string.match(line, "__TABLE_OF_CONTENTS__") then
      line = string.gsub(line, "__TABLE_OF_CONTENTS__", html_code)
      print(line)
      break
    end
  end
end


-- Generate the style code for the treeview
local function generate_treeview_style_code()
  local treeview_style_code = {}
  -- iterate through all headers and assign style_code
  print("<style>")
  -- CSS rules
  for _,v in pairs(headers_raw) do
    local line = string.lower("#" .. string.gsub(v, " ", "-")) .. " {scroll-margin-top: 70px;}"
    table.insert(treeview_style_code, line)
    print("  " .. line)
  end
  -- Mobile-friendly CSS rules
  print("  /* Mobile-friendly style */")
  print("  @media (max-width: 768px) {")
  for _,v in pairs(headers_raw) do
    local line = string.lower("  #" .. string.gsub(v, " ", "-")) .. " {scroll-margin-top: 120px;}"
    table.insert(treeview_style_code, line)
    print("  " .. line)
  end
  print("  }")
  print("</style>")
  print(" ")
  -- TODO: paste into file
  -- "__TABLE_OF_CONTENTS_STYLE__"
end


-- Generate the h2 IDs to be pasted into the h2 headers
local function generate_h2_ids()
  local treeview_ids = {}
  local id_start = ' id="'
  local id_end = '"'
  -- Iterate throught headers and generate IDs
  for _,v in pairs(headers_raw) do
    local line = id_start .. string.lower(string.gsub(v, " ", "-")) .. id_end
    table.insert(treeview_ids, line)
  end
  -- ?
  local lines = {}
  -- Read file
  local file = io.open(file_path, "r+")
  for line in file:lines() do
    table.insert(lines, line)
  end
  -- Filter lines containing h2 header
  local lines_filtered = {}
  for _, line in ipairs(lines) do
  	if string.match(line, "<h2 ") then
  	  line = string.gsub(line, "^        ", "")
  	  table.insert(lines_filtered, line)
  	end
  end
  -- Add ID to header
  for i, line in ipairs(lines_filtered) do
    if treeview_ids[i] then
      line = string.gsub(line, "<h2 ", "<h2 " .. treeview_ids[i] .. " ")
      print(line)
    end
  end
  print(" ")
  -- TODO: paste into file
end


-- Main
extract_headers()
generate_treeview()
-- generate_treeview_style_code()
-- generate_h2_ids()
