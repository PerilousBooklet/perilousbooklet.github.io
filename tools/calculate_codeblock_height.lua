-- Function to count the number of lines in a multi-line string
function countLines(str)
    local count = 0
    for _ in string.gmatch(str, "[^\n]+") do
        count = count + 1
    end
    return count
end
-- Example usage
local multiLineString = [[
This is a multi-line
text string. Each new
line will be counted.
]]
local lineCount = countLines(multiLineString)
print("Number of lines: ", lineCount)
