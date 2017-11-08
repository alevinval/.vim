LINE="source ~/vim/.vimrc"
if ! ag "$LINE" ~/.vimrc; then
    echo $LINE > ~/.vimrc
fi

if ! which flake8; then
    pip install flake8
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
