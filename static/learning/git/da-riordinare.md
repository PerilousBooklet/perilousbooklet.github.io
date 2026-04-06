# Git

## Quickstart (per nuovo progetto)

Make sure SSH is installed:

`sudo pacman -Syu openssh`

Enable and start the SSH daemon:

`sudo systemctl enable --now sshd`

Create local SSH key for remote repo interactions:
`ssh-keygen -f ~/.ssh/keyname`

Set and save the passphrase in your password manager

Add the SSH key to the SSH agent:
`eval "$(ssh-agent -s)"`
`ssh-add ~/.ssh/keyname`

NOTA
- **RICORDA** di ri-aggiungere la chiave a `ssh-agent` con `ssh-add ~/.ssh/keyname`  subito dopo ogni login!

Add it to Github:
`Personal Profile Page -> Settings -> SSH and GPG Keys -> New SSH Key`

Create a new repo on Github

Clone the repo (select **SSH** link option)
(es. `git clone git@github.com:username/repository.git`)

Set local git user details:
`git config --local user.name "user_name"`
`git config --local user.email "email"`

## I need to revert all current changes to the state of the last commit

`git reset --hard`

## TODO: write title

`git stash -u -m message`

## TODO: write title

`git stash list`

## TODO: write title

`git stash apply stash@{0}`, replace 0 with appropriate number

## I want to see the cumulative changes of a branch's commits

`git diff base_branch_hash::feature_branch_hash`

TODO: I want to test the contents of a certain branch on a local temporary branch: 

## I want to display the history of a repo

`git log --graph --oneline --decorate`

## I staged the wrong code

`git restore --staged whatever_files`

## I modified the wrong branch, but I still need the changes: stash the changes and then reset the branch to the latest commit

`git stash -m "comment"` and `git reset --hard`

## I need to reset the local repo to the latest from the remote repo

`git fetch --all` and `git reset --hard origin/master` (`master` is the name of the desired branch)

## I committed a wrong commit

`git revert commit_hash` and `git push origin branch_name`
FIX: I made a wrong commit: `git reset HEAD~` (?)

## TODO: I need to update a branch: 

1. Merge : `git checkout main`, `git fetch`, `git pull origin main`, `git checkout branch`, `git merge main`, `git push origin branch`
2. Rebase: 
3. Squash: 

## TODO: I need to pick and apply commits from another branch in the same repository

## TODO: I need to pick and apply commits from another branch from another repository

## TODO: I need to setup a remote

## TODO: I need to setup another remote

## I need to list all branches in the current repository

`git branch -a`

## TODO: I need to delete a branch

## TODO: I need to stash some code to return to later

## TODO: I need to create and assign a tag

