-----------------------------------
-- Tiny Static Templating Script --
-----------------------------------


local path_root = arg[1]
local blog_page_path = "./public/pages/blog.html"
posts = {}


local function get_data_from_file(filepath, filename, folder)
  local file = io.open(filepath, "r")
  for line in file:lines() do
    if string.find(line, "<h1 ") then
      local title = string.gsub(string.match(line, "%>[%w+%s?]+%<"), "[<>]", "")
      local template = [[        <a href="../posts/__folder__/__filename__.html">__title__</a>]]
      local br = [[        <br>]]
      local post1 = string.gsub(template, "__folder__", folder)
      local post2 = string.gsub(post1, "__filename__", filename)
      local post3 = string.gsub(post2, "__title__", title)
      table.insert(posts, post3)
      table.insert(posts, br)
    end
  end
  file:close()
end


local function get_files(folder)
	local path = path_root .. "/" .. folder .. "/"
  files = {}
  local p = io.popen('ls -lr "' .. path .. '"')
  for file in p:lines() do
    local file_matched = string.match(file, "[%w%-]+%.html$")
    if file_matched then -- because the returned values from the match could be nil
      table.insert(files, file_matched)
      get_data_from_file(
        path .. file_matched,
        string.gsub(file_matched, ".html", ""),
        folder
      )
    end
  end
  p:close()
end


local function get_folders()
  local folders = {}
  local p = io.popen('ls -l "' .. path_root .. '"')
  for folder in p:lines() do
    local folder_matched = string.match(folder, "%d+$")
    table.insert(folders, folder_matched)
  end
  table.remove(folders, 1) -- Remove 1st line of `ls -l` output
  p:close()
  -- NOTE: I need to show the latest folders first
  for i = #folders, 1, -1 do
    folder = folders[i]
    table.insert(posts, "\n        <h2>" .. folder .. "</h2>")
    get_files(folder)
  end
  -- print(table.concat(posts, "\n"))
end


local function generate_list()
  local lines = {}
  local file = io.open(blog_page_path, "r")
  for line in file:lines() do
    table.insert(lines, line)
  end
  for i, line in ipairs(lines) do
    if string.find(line, "__BLOGPOST_LIST__") then
      lines[i] = string.gsub(line, "__BLOGPOST_LIST__", table.concat(posts, "\n"))
    end
  end
  file:close()
  -- write new content to file
  local output_file = io.open(blog_page_path, "w")
  if output_file then
    output_file:write(table.concat(lines, "\n"))
  end
  output_file:close()
end


get_folders()
generate_list()
