PACKAGES = scrooloose/nerdtree vim-airline/vim-airline dannykong12/vim-airline-themes eraserhd/parinfer-rust juliaeditorsupport/julia-vim terryma/vim-multiple-cursors
PATHS = ${addprefix bundle/, ${notdir ${PACKAGES}}}

.SECONDEXPANSION:

vimrc: autoload/pathogen.vim ${PACKAGES} builds
	rm -f ~/.vimrc
	ln -s ~/.vim/vimrc ~/.vimrc
	touch vimrc

${PACKAGES}: bundle/$${notdir $$@}
	echo $(notdir ${PACKAGES})
	cd bundle/${notdir $@} && git remote add upstream https://github.com/$@
	cd bundle/${notdir $@} && git pull upstream master
	mkdir -p ${dir $@}
	touch $@

${PATHS}:
	git clone https://github.com/dannykong12/${notdir $@} $@

autoload/pathogen.vim:
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

builds: parinfer-rust-build

parinfer-rust-build:
	cd ~/.vim/bundle/parinfer-rust && cargo build --release
	touch eraserhd/parinfer-rust

.PHONY: clean all builds

clean:
	rm -rf bundle/*
