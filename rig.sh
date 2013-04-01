#!/bin/bash
# backup files
echo "copying existing files to .old"
cp ~/.my.cnf my.cnf.old 
cp ~/.profile .profile.old 
cp -R ~/.vim .vim.old
cp ~/.vimdbext .vimdbext.old 
cp ~/.vimrc .vimrc.old 
# rm files
echo "removing files"

rm -rf .my.cnf
rm -rf .profile
rm -rf .vim
rm -rf .vimdbext
rm -rf .vimrc
# ln files
echo "symlinking"
ln -s ~/.my.cnf ~/dotfiles/.my.cnf
ln -s ~/.profile ~/dotfiles/.profile
ln -s ~/.vim ~/dotfiles/.vim
ln -s ~/.vimdbext ~/dotfiles/.vimdbext
ln -s ~/.vimrc ~/dotfiles/.vimrc

echo "done"
