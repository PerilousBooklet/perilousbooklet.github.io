# Folders

To create multiple nested directories with one command:

```sh
mkdir -vp dir1/{1,2} dir2/{2,3/{dir3,dir4}}
```

To create numbered directories:

```sh
mkdir -v chapter{1..12}
```

Check that a folder already exists: 

```sh
if [ -d ./java ]; then
  echo "Folder java exists!"
fi
```

Check that a folder doesn't already exist: 

```sh
if [ ! -d ./java ]; then
  echo "Folder java doesn't exist yet!"
fi
```

