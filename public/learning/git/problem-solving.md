# Problem Solving

## Tevert all current changes to the state of the last commit

`git reset --hard`

## Stash current changes AND untracked files with custom message

`git stash -u -m message`

## List all stashes

`git stash list`

## Apply last stash

> [!NOTE]
> The stash index sets the last stash as  `stash@{0}`.

`git stash apply stash@{0}`

## Show the cumulative changes of a branch's commits

`git diff base_branch_hash::feature_branch_hash`

## TODO: Test the contents of a certain branch on a local temporary branch: 

## Display the history of a repo

`git log --graph --oneline --decorate`

## Restore from stage a given file

> [!NOTE]
> Useful when you staged the  wrong code.

`git restore --staged whatever_files`

## I modified the wrong branch, but I still need the changes: stash the changes and then reset the branch to the latest commit

`git stash -m "comment"`

`git reset --hard`

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

