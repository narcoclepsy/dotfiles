#!/bin/bash
# backup files
echo "copying existing files to .old"
cp ~/.my.cnf ~/.my.cnf.old 
cp ~/.profile ~/.profile.old 
cp -R ~/.vim ~/.vim.old
cp ~/.vimdbext ~/.vimdbext.old 
cp ~/.vimrc ~/.vimrc.old 
# rm files
echo "removing files"

rm -rf ~/.my.cnf
rm -rf ~/.profile
rm -rf ~/.vim
rm -rf ~/.vimdbext
rm -rf ~/.vimrc
# ln files
echo "symlinking"
ln -s ~/dotfiles/.my.cnf ~/.my.cnf 
ln -s ~/dotfiles/.profile ~/.profile 
ln -s ~/dotfiles/.vim ~/.vim 
ln -s ~/dotfiles/.vimdbext ~/.vimdbext 
ln -s ~/dotfiles/.vimrc ~/.vimrc 

echo "done"
