# Logs

## Pretty Logs

You can use ANSI escape codes to add color to specific parts of your output in the terminal:

```bash
echo -e "\e[32m[INFO]\e[0m: generated TOC for $i"
```

`\e[32m`: sets the text color to green.
`[INFO]`: the part that gets colored.
`\e[0m`:  resets the color back to default so the rest of the line isn't affected.
`-e`: enables interpretation of escape sequences in `echo`.

Other color codes:

| Color      | Code  |
|------------|-------|
| Black      | `\e[30m` |
| Red        | `\e[31m` |
| Green      | `\e[32m` |
| Yellow     | `\e[33m` |
| Blue       | `\e[34m` |
| Magenta    | `\e[35m` |
| Cyan       | `\e[36m` |
| White      | `\e[37m` |

You can also make it **bold** by adding `\e[1m` before the color code:

```bash
echo -e "\e[1;32m[INFO]\e[0m: generated TOC for $i"
```

