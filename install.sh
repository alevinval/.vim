LINE="source ~/.vim/.vimrc"
if ! ag "$LINE" ~/.vimrc; then
    echo $LINE > ~/.vimrc
fi

if ! which flake8; then
    pip install flake8
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
