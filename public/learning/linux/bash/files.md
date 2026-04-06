## Check if last line of file is empty

-n checks if given string is not zero;
string is not zero, so expression is true

```sh
if [ -n "$(tail --lines 1 Manifest.txt | grep -E '\w')" ] ; then
  echo -e "" >> Manifest.txt
fi
```


