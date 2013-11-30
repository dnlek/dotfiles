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

echo "ln ${HOME}/{.gitconfig,.gitignore}"
ln -f -s ${CUR_DIR}/gitconfig ${HOME}/.gitconfig
ln -f -s ${CUR_DIR}/gitignore ${HOME}/.gitignore

echo "ln ${HOME}/.bashrc,.bash_config"
ln -f -s ${CUR_DIR}/bashrc ${HOME}/.bashrc
ln -f -s ${CUR_DIR}/bash ${HOME}/.bash

echo "ln ${HOME}/.config/flake8"
ln -f -s ${CUR_DIR}/config/flake8 ${HOME}/.config/flake8

# install fonts
echo "install fonts in ${HOME}/.fonts"
cp fonts/* ${HOME}/.fonts/
