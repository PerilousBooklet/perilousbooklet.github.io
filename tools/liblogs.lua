-- lib, logs


-- 1. Define ANSI codes
local ANSI = {
  reset   = "\27[0m",
  black   = "\27[30m",
  red     = "\27[31m",
  green   = "\27[32m",
  yellow  = "\27[33m",
  blue    = "\27[34m",
  magenta = "\27[35m",
  cyan    = "\27[36m",
  white   = "\27[37m",
}


-- 2. Helper to wrap text in a color
local function colored(color, text)
  return color .. tostring(text) .. ANSI.reset
end


-- 3. Logging functions
local log = {}

function log.info(...)
  print(colored(ANSI.green, "[INFO]"),  ...)
end

function log.warn(...)
  print(colored(ANSI.yellow, "[WARN]"),  ...)
end

function log.error(...)
  print(colored(ANSI.red, "[ERROR]"), ...)
end

function log.debug(...)
  print(colored(ANSI.cyan, "[DEBUG]"), ...)
end

return log
