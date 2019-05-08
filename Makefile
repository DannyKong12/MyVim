PACKAGES = scrooloose/nerdtree vim-airline/vim-airline dannykong12/vim-airline-themes eraserhd/parinfer-rust juliaeditorsupport/julia-vim terryma/vim-multiple-cursors
COOKIES = ${addprefix cookies/, ${PACKAGES}}
PATHS = ${addprefix bundle/, ${notdir ${PACKAGES}}}

.SECONDEXPANSION:

vimrc: autoload/pathogen.vim ${COOKIES} builds
	rm -f ~/.vimrc
	ln -s ~/.vim/vimrc ~/.vimrc
	touch vimrc

${COOKIES}: ${addprefix bundle/, $${notdir $$@}}
	git clone https://github.com/${patsubst cookies/%,%,$@} ${addprefix bundle/, ${notdir $@}}
	mkdir -p ${dir $@}
	touch $@


${PATHS}:

autoload/pathogen.vim:
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

builds: parinfer-rust-build

parinfer-rust-build:
	cd ~/.vim/bundle/parinfer-rust && cargo build --release
	touch cookies/eraserhd/parinfer-rust

.PHONY: clean all builds

clean:
	rm -rf bundle/*
