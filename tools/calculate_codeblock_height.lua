-- Function to count the number of lines in a multi-line string
local function countLines(str)
    local count = 0
    for _ in string.gmatch(str, "[^\n]+") do
        count = count + 1
    end
    return count
end

-- Reading the multi-line string from a text file
local function readFile(fileName)
    local file = io.open(fileName, "r") -- Open the file in read mode
    if not file then
        error("Could not open file: " .. fileName)
    end
    local content = file:read("*a") -- Read the entire file contents
    file:close() -- Close the file
    return content
end

-- Example usage
local fileName = "code.txt" -- Replace this with your text file name
local multiLineString = readFile(fileName)
local lineCount = countLines(multiLineString)
print("Number of lines: ", lineCount)
