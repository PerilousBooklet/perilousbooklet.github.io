# Lite XL

## Files

## Strings

## Error Messages

### To write the output of a serialized table to a text file

```lua
io.open("/home/raffaele/log.txt", "wb"):write(common.serialize(templates)):close()
```

### To print the content of a serialized table to `stdout`

```lua
print(common.serialize(templates))
```

### To reveal hidden error messages

Wrap the suspected function call with `print(pcall())`

## Data Storage

- look at the `formatter` plugin
- look at the `linter` plugin
- look at the `lsp` plugin
- look at the `snippets` plugin

## LPM

Example of a branch-specific test bottle command:

`lpm --repository https://github.com/lite-xl/lite-xl-plugin-manager.git:3.0 run 3.0-preview`

