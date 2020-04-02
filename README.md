# vimgoenv 

vimgoenv is a container image that contains vim-go.

## Install
1.  Copy vimgoenv to PATH
```
$ curl -LO https://raw.githubusercontent.com/mkimuram/vimgoenv/master/vimgoenv
$ chmod +x ./vimgoenv
$ mv ./vimgoenv /some-dir-in-your-PATH/
```

2. Copy vimgoenvrc to ~/.vimgoenvrc (Optional)
```
$ curl -L https://raw.githubusercontent.com/mkimuram/vimgoenv/master/vimgoenvrc -o ~/.vimgoenvrc
```

## Usage
1. Run vimgoenv
```
$ vimgoenv
```

This command will launch vimgoenv container image, mount your $GOPATH to /go in the container, and run bash to use vim inside the container. You are logined as user named `user` and /go is symlined to /home/user/go.

## Advanced configuration
1. Inherit . files, such as .ssh and .gitconfig, in your homed directory.
   - Edit ~/.vimgoenvrc and modify `MNT_FILES`. `MNT_FILES` expects space separated name of files or directories. This will make bind mount `$HOME/$file` to `/home/tmp`, then copy all files in `/home/tmp` to `/home/user`. (This is needed to access files by the same uid and gid inside the container.)
2. Change container image to use.
   - Edit ~/.vimgoenvrc and modify `IMAGE_NAME`.
