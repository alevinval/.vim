echo "Ensuring configuration is sourced from .vimrc"
LINE="source ~/vim/vimrc"
if ! grep "$LINE" ~/.vimrc &> /dev/null ; then
    echo "Adding sourcing of custom vimrc file"
    echo $LINE >> ~/.vimrc
fi

echo "Setting up Plug for Vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Setting up Plug for NeoVim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
