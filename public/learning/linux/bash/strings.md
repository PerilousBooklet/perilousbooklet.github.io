# Strings

To overwrite a text file:

```sh
cat << EOL > example.txt
This is line one.
This is line two.
This is line three.
EOL
```

To append to a text file:

```sh
cat << EOL >> example.txt
This is line one.
This is line two.
This is line three.
EOL
```

TODO: explain the use of `*` in the following:

```sh
echo -e "Class-Path: $DEPS ${RESOURCES[*]}\n" >> Manifest.txt
```

