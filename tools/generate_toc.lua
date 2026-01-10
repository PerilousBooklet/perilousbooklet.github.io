-----------------------------------
-- TINY STATIC TEMPLATING ENGINE --
-----------------------------------


local file_path = arg[1]


-- Update a file with a sigle tag (es. __TABLE_OF_CONTENTS__)
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


-- Get post headers (id and content of each h2 HTML element)
local function read_headers()
  headers = {}
  for line in io.lines(file_path) do
    if string.find(line, "<h2") then
      local line_id = string.gsub(string.match(line, '%".-%"'), '"', "")
      local line_content = string.gsub(line, "%<.-%>", "")
      local line_content_without_empty_space = string.gsub(line_content, "^%s+", "")
      table.insert(
        headers,
        {
          id = line_id,
          content = line_content_without_empty_space
        }
      )
    end
  end
end


-- Generate the toc
local function generate_toc()
  local toc = {}
  local indentation4 = "    "
  local indentation6 = "      "
  local indentation8 = "        "
  table.insert(toc, "<!-- TABLE OF CONTENTS -->")
  table.insert(toc, indentation4 .. '<div class="toc">')
  table.insert(toc, indentation6 .. "<h2>Table of Contents</h2>")
  table.insert(toc, indentation6 .. "<ul>")
  for _, header in pairs(headers) do
    table.insert(toc, indentation8 .. '<li><a href="#' .. header.id .. '">' .. header.content .. "</a></li>")
  end
  table.insert(toc, indentation6 .. "</ul>")
  table.insert(toc, indentation4 .. "</div>")
  table.insert(toc, indentation4 .. "<br>")
  -- Generate HTML code
  local html_code = table.concat(toc, "\n")
  -- Update file
  update_tag(file_path, "__TABLE_OF_CONTENTS__", html_code)
end


-- Generate the style code for the toc
local function generate_toc_style_code()
  local toc_style_code = {}
  table.insert(toc_style_code, "<style>")
  -- CSS rules
  for _,v in pairs(headers) do
    local line = string.lower("      #" .. v.id) .. " {scroll-margin-top: 70px;}"
    table.insert(toc_style_code, line)
  end
  -- Mobile-friendly CSS rules
  table.insert(toc_style_code, "      /* Mobile-friendly style */")
  table.insert(toc_style_code, "      @media (max-width: 768px) {")
  for _,v in pairs(headers) do
    -- NOTE: because of the reduced font size (mobile friendly)
    local line = string.lower("        #" .. v.id) .. " {scroll-margin-top: 50px;}"
    table.insert(toc_style_code, line)
  end
  table.insert(toc_style_code, "      }")
  table.insert(toc_style_code, "    </style>")
  -- Generate HTML code
  local html_code = table.concat(toc_style_code, "\n")
  -- Update the file
  update_tag(file_path, "__TABLE_OF_CONTENTS_STYLE__", html_code)
end


-- Main
read_headers()
generate_toc()
generate_toc_style_code()
