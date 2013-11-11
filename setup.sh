########## Variables

CUR_DIR=`pwd`

####################

# init submodules
echo "git init neobundle.vim submodule"
(git submodule init && git submodule update)

# link dotfiles
echo "ln ${HOME}/.vim, ${HOME}/.vimrc"
ln -f -s ${CUR_DIR}/vim ${HOME}/.vim
ln -f -s ${CUR_DIR}/vimrc ${HOME}/.vimrc

echo "ln ${HOME}/.tmux.conf"
ln -f -s ${CUR_DIR}/tmux.conf ${HOME}/.tmux.conf

# install fonts
echo "install fonts in ${HOME}/.fonts"
cp fonts/* ${HOME}/.fonts/
