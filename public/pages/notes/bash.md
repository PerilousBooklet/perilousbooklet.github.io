# Bash

TODO: toc

## Loops

### C++-like for loop

```sh
for ((i = 1; i < 11; i++))
do
  echo "Iteration number $i"
done
```

## Files

## Folders

To create multiple directories with one command:

```sh
mkdir -vp dir1/{1,2} dir2/{2,3/{dir3,dir4}}
```

To create numbered directories:

```sh
mkdir -v ch{1..12}
```

## Strings

### Insert a multi-line string into a text file

To overwrite:

```sh
cat << EOL > example.txt
This is line one.
This is line two.
This is line three.
EOL
```

To append:

```sh
cat << EOL >> example.txt
This is line one.
This is line two.
This is line three.
EOL
```

### sed

TODO: sed

### awk

TODO: awk

## JSON

TODO: jq
