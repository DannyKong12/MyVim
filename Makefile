all:
	rm ~/.vim/autoload/pathogen.vim
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	git clone https://github.com/scrooloose/nerdtree.git bundle/nerdtree
	git clone https://github.com/vim-airline/vim-airline.git bundle/vim-airline
	git clone https://github.com/DannyKong12/vim-airline-themes bundle/vim-airline-themes
	git clone https://github.com/wakatime/vim-wakatime.git
	rm -f ~/.vimrc
	ln -s ~/.vim/vimrc ~/.vimrc
