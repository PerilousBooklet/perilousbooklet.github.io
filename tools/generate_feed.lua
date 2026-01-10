-----------------------------------
-- TINY STATIC TEMPLATING ENGINE --
-----------------------------------


-- local logs = require "liblogs"


local feed_path = "./public/feed.xml"
local url_base = "https://perilousbooklet.github.io"
local path_root = arg[1]
local entries = {}


-- test, files
-- THIS GETS ALL FILES IN A GIVEN FOLDER
local function get_files(folder)
	local path = path_root .. "/" .. folder
  files = {}
  local p = io.popen('ls -l "' .. path .. '"')
  for file in p:lines() do
    local file_matched = string.match(file, "[%w%-]+%.html$")
    if file_matched then -- because the returned values from the match could be nil
      table.insert(files, file_matched)
      -- print("-> " .. file_matched)
      -- print(file_matched)
    end
  end
  p:close()
  generate_feed_entries(folder, files)
end


-- test, folders
-- THIS GETS ALL SUB-FOLDERS OF A GIVEN FOLDER
local function get_folders()
  local folders = {}
  local p = io.popen('ls -l "' .. path_root .. '"')
  for folder in p:lines() do
    local folder_matched = string.match(folder, "%d+$")
    table.insert(folders, folder_matched)
  end
  table.remove(folders, 1) -- Remove 1st line of `ls -l` output
  p:close()
  for _,folder in ipairs(folders) do
    -- print(folder)
    get_files(folder)
  end
end


-- Generate entries from existing articles
function generate_feed_entries(folder, files)
  for _,file in ipairs(files) do
    -- Get article title
    local title = ""
    local file_title_lines = {}
    local file_title = io.open(path_root .. "/" .. folder .. "/" .. string.gsub(file, "%-%>%s", ""), "r")
    for line in file_title:lines() do
      table.insert(file_title_lines, line)
      -- print(line)
    end
    file_title:close()
    -- extract title
    for _, line in ipairs(file_title_lines) do
    	if line:find("%<h1%s") then
    	  local title_temp_1 = string.match(line, "%>[%w%s]+%<")
    	  -- FIX: string expected, got nil
    	  local title_temp_2 = string.gsub(title_temp_1, "%>", "")
    	  local title_temp_3 = string.gsub(title_temp_2, "%<", "")
    	  title = title_temp_3
    	end
    end
    
    local url = url_base .. "/" .. "public/posts/" .. folder .. "/" .. file
    
    -- Get publication date
    local pubdate = ""
    local file_pubdate_lines = {}
    local file_pubdate = io.open(path_root .. "/" .. folder .. "/" .. string.gsub(file, "%-%>%s", ""), "r")
    for line in file_pubdate:lines() do
      table.insert(file_pubdate_lines, line)
    end
    file_pubdate:close()
    -- extract title
    for _, line in ipairs(file_pubdate_lines) do
    	if line:find('id="pubdate"') then
    	  local pubdate_temp_1 = string.match(line, "%>%d+%/%d+%/%d+%<")
    	  local pubdate_temp_2 = string.gsub(pubdate_temp_1, "%>", "")
    	  local pubdate_temp_3 = string.gsub(pubdate_temp_2, "%<", "")
    	  pubdate = pubdate_temp_3
    	end
    end
    
    -- Generate RSS feed item entry
    local entry = {}
    
    local entry_title = "<title>" .. title .. "</title>"
    local entry_url = "<link>" .. url .. "</link>"
    local entry_pubdate = "<pubDate>" .. pubdate .. "</pubDate>"
    table.insert(entry, "<item>")
    table.insert(entry, "  " .. entry_title)
    table.insert(entry, "  " .. entry_url)
    table.insert(entry, "  " .. entry_pubdate)
    table.insert(entry, "</item>")
    table.insert(entry, "")
    
    table.insert(entries, entry)
    -- print(table.concat(entry, "\n"))
  end
end


-- Update file with new entries
-- the replacement tag is __ENTRIES__
function update_feed(entries)
  local lines = {}
  local file = io.open(feed_path, "r+")
  if file then
    for line in file:lines() do
      table.insert(lines, line)
    end
    -- print(table.concat(lines, "\n"))
  else
    print(file)
  end
  file:close()
  -- Flatten entries
  local flat_entries = {}
  for _, entry in ipairs(entries) do
    for _, line in ipairs(entry) do
      table.insert(flat_entries, line)
    end
  end
  -- Generate updated lines table
  for i, line in ipairs(lines) do
    if string.match(line, "__ENTRIES__") then
      lines[i] = string.gsub(line, "__ENTRIES__", table.concat(flat_entries, "\n"))
    end
    -- print(table.concat(lines, "\n"))
  end
  -- Overwrite feed file
  local file_final = io.open(feed_path, "w")
  if file_final then
    file_final:write(table.concat(lines, "\n"))
  else
    print(file_final)
  end
end


-- Init
get_folders()
update_feed(entries)
