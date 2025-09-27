-----------------------------------
-- TINY STATIC TEMPLATING ENGINE --
-----------------------------------


-- Specify the file name
local filename = "code.txt"

-- Open the file in read mode
local file = io.open(filename, "r")
if not file then
    print("Error: Could not open the file '" .. filename .. "'")
    return
end

-- Read the entire file contents into a string
local your_string = file:read("*a")

-- Close the file
file:close()

-- Pattern to match spaces at the start of a line
local pattern = "^%s+"

-- Filler to replace the matched spaces
local filler = "&nbsp;&nbsp;"

-- Table to store the modified lines
local modified_lines = {}

-- Process each line
for line in your_string:gmatch("[^\r\n]+") do
    local match = line:match(pattern)
    if match then
        -- Replace matched spaces with the filler
        line = line:gsub(pattern, string.rep(filler, #match))
    end
    -- Add the modified line to the table
    table.insert(modified_lines, line)
end

-- Combine the modified lines into a new multi-line string
local new_string = table.concat(modified_lines, "\n")

-- Output the result
print(new_string)


-- --- --- ---
-- --- --- ---
-- --- --- ---


-- WIP: color the string
local syntax = {
    ["comment"] =  { '<span style="color: #5f697a;">', "</span>" },
    ["keyword"] =  { '<span style="color: #cd74e8;">', "</span>" },
    ["keyword2"] = { '<span style="color: #eb6772;">', "</span>" },
    ["function"] = { '<span style="color: #5cb3fa;">', "</span>" },
    ["operator"] = { '<span style="color: #56B6C2;">', "</span>" },
    ["literal"] =  { '<span style="color: #e6c07b;">', "</span>" },
    ["number"] =   { '<span style="color: #db9d63;">', "</span>" }
}
-- WIP: java syntax
local symbols = {
    ["class"] = syntax["keyword"],
}

-- TODO: function to generate the colored word

