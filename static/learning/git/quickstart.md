# Quickstart (per nuovo progetto)

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

