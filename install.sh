#!/bin/bash
############################
# make.sh
# Creates symlinks from the home to any desired dotfiles in ~/dotfiles
# From http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
# old home dotfiles backup
olddir=$(TMPDIR=~ mktemp -d -t .dotfiles_home.XXXXXX)
 # old dotfiles directory backup
olddir2=$(TMPDIR=~ mktemp -d -t .dotfiles.XXXXXX)
mv -f $dir $olddir2
# list of files/folders to symlink in homedir
files="$(ls $PWD|grep -v install.sh| grep -v README.md | grep -v config | grep -v "^.$" | grep -v ".local$")"
##########

# create dotfiles_old in homedir
mkdir -p $olddir && echo "Created $olddir for backup of existing dotfiles in ~."

# change to the dotfiles directory
mkdir -p $dir && echo "Created $dir for for new dotfiles linked from ~."

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    cp -a $file $dir/
    test -f ~/.$file && mv -f ~/.$file $olddir
    echo "Creating symlink to $dir/$file -> ~/.$file."
    ln -s $dir/$file ~/.$file
done
# Special case .config for lazyness preventing touching other apps
mkdir -p ~/.config/awesome
cp -a config/awesome/rc.lua ~/.config/awesome/

echo "Please delete backup $olddir and $olddir2 if everything is fine."
echo "If you installed new fonts please run"
echo "sudo fc-cache -fv"
