-----------------------------------
-- TINY STATIC TEMPLATING ENGINE --
-----------------------------------


local file_path = arg[1]


-- Update a file with a sigle tag
-- NOTE: es. __TABLE_OF_CONTENTS__
local function update_tag(file, tag, new_text)
	-- Read the file
  local input_file = io.open(file, "r")
  local lines = {}
  for line in input_file:lines() do
    table.insert(lines, line)
  end
  input_file:close()
  -- Prepare new file's lines
  for i, line in ipairs(lines) do
    -- nil check
    if line ~= nil then
      -- Check if line contains tag
      if string.match(line, tag) then
        -- Replace tag with HTML code
        lines[i] = string.gsub(line, tag, new_text)
        -- End loop
        break
      end
    end
  end
  -- Rewrite HTML file
  local updated_file = io.open(file_path, "w")
  updated_file:write(table.concat(lines, "\n"))
  updated_file:close()
end


-- Extract headers
local function extract_headers()
  headers_raw = {}
  for line in io.lines(file_path) do
    if string.find(line, "<h2") then
      line = string.gsub(line, "<h2", "_")
      line = string.gsub(line, 'style="color: #5cb3fa;">', "_")
      line = string.gsub(line, "</h2>", "_")
      line = string.gsub(line, "_", "")
      line = string.gsub(line, "         ", "")
      table.insert(headers_raw, line)
    end
  end
end


-- Generate the toc
local function generate_toc()
  local toc = {}
  local indentation = "        "
  table.insert(toc, "<!-- TABLE OF CONTENTS -->")
  table.insert(toc, indentation .. '<div class="toc">')
  table.insert(toc, indentation .. "  <h2>Table of Contents</h2>")
  table.insert(toc, indentation .. "  <ul>")
  for _, header in pairs(headers_raw) do
    -- Generate paragraph reference
    local href = string.lower("#" .. string.gsub(header, " ", "-"))
    -- Generate list item
    table.insert(toc, indentation .. '    ' .. '<li><a href="' .. href .. '">' .. header .. "</a></li>")
  end
  table.insert(toc, indentation .. "  </ul>")
  table.insert(toc, indentation .. "</div>")
  table.insert(toc, indentation .. "<br>")
  -- Generate HTML code
  local html_code = table.concat(toc, "\n")
  -- Update file
  update_tag(file_path, "__TABLE_OF_CONTENTS__", html_code)
end


-- Generate the style code for the toc
local function generate_toc_style_code()
  local toc_style_code = {}
  -- iterate through all headers and assign style_code
  table.insert(toc_style_code, "<style>")
  -- CSS rules
  for _,v in pairs(headers_raw) do
    local line = string.lower("      #" .. string.gsub(v, " ", "-")) .. " {scroll-margin-top: 70px;}"
    table.insert(toc_style_code, line)
  end
  -- Mobile-friendly CSS rules
  table.insert(toc_style_code, "      /* Mobile-friendly style */")
  table.insert(toc_style_code, "      @media (max-width: 768px) {")
  for _,v in pairs(headers_raw) do
    local line = string.lower("        #" .. string.gsub(v, " ", "-")) .. " {scroll-margin-top: 50px;}" -- Because of the reduced font size (mobile friendly)
    table.insert(toc_style_code, line)
  end
  table.insert(toc_style_code, "      }")
  table.insert(toc_style_code, "    </style>")
  -- Generate HTML code
  local html_code = table.concat(toc_style_code, "\n")
  -- Update the file
  update_tag(file_path, "__TABLE_OF_CONTENTS_STYLE__", html_code)
end


-- Generate the <h2> IDs to be pasted into the <h2> headers
local function generate_h2_ids()
  local toc_ids = {}
  local id_start = ' id="'
  local id_end = '"'
  -- Iterate throught headers and generate IDs
  for _,v in pairs(headers_raw) do
    local line = id_start .. string.lower(string.gsub(v, " ", "-")) .. id_end
    table.insert(toc_ids, line)
  end
  -- ?
  local lines = {}
  -- Read file
  local file = io.open(file_path, "r+")
  for line in file:lines() do
    table.insert(lines, line)
  end
  file:close()
  -- Filter lines containing h2 header
  local lines_filtered = {}
  for _, line in ipairs(lines) do
  	if string.match(line, "<h2 ") then
  	  line = string.gsub(line, "^        ", "")
  	  table.insert(lines_filtered, line)
  	end
  end
  -- Prepare new file's lines
  local j = 1
  local new_content = ""
  for i, line in ipairs(lines) do
    -- nil check
    if line ~= nil then
      -- Check if line contains tag
      if string.match(line, "<h2 ") then
        -- Replace tag with HTML code
        lines[i] = string.gsub(line, "<h2 ", "<h2" .. toc_ids[j] .. " ")
        j = j + 1
        -- print(lines[i])
      end
    end
  end
  -- Rewrite HTML file
  local updated_file = io.open(file_path, "w")
  updated_file:write(table.concat(lines, "\n"))
  updated_file:close()
end


-- Main
extract_headers()
generate_toc()
generate_toc_style_code()
generate_h2_ids()
