PACKAGES = scrooloose/nerdtree vim-airline/vim-airline dannykong12/vim-airline-themes juliaeditorsupport/julia-vim mg979/vim-visual-multi plasticboy/vim-markdown dense-analysis/ale lervag/vimtex
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

.PHONY: clean all builds

clean:
	rm -rf bundle/*
	rm -r cookies
