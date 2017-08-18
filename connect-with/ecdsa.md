# Connect to github with ECDSA

2017/08/09
MacOS

## Check SSH key

```
$ ls -al ~/.ssh
```

ls
- -a : show all file
- -l : show file details

## Generate SSH key

```
$ cd ~/.ssh
$ ssh-keygen -t ecdsa -b 521 -C "your-email@example.com"
```

ssh-keygen
- -t : key type
- -f : file name to store the key
- -b : key bit number
    case ECDSA: 256|384|521
- -N : new pass pharase
- -C : add new comment

## Add to SSH agent

```
$ eval "$(ssh-agent -s)"
$ ssh-add -K ~/.ssh/id_ecdsa
```

ssh-add
- -K : key is registered in the key chain store and it is automatically called when the terminal is activated
- -l : show list of registered keys

## Register SSH Key in GitHub account

```
$ pbcopy < ~/.ssh/id_ecdsa.pub
```

[Paste here](https://github.com/settings/keys)


## Check

```
ssh -T git@github.com
```