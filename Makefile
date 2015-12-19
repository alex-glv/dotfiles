.PHONY: all default dotfiles install prezto

ll: dotfiles

all: prezto dotfiles
default: install

install: all

GIT=/usr/bin/git

prezto:
	rm -rf $$HOME/.zprezto && $(GIT) clone --recursive https://github.com/sorin-ionescu/prezto.git "$$HOME/.zprezto"
	ln -fs $$HOME/.zprezto/runcoms/zshrc $$HOME/.zshrc
	ln -fs $$HOME/.zprezto/runcoms/zshenv $$HOME/.zshenv
	ln -fs $$HOME/.zprezto/runcoms/zprofile $$HOME/.zprofile
	ln -fs $$HOME/.zprezto/runcoms/zlogin $$HOME/.zlogin
	ln -fs $$HOME/.zprezto/runcoms/zlogout $$HOME/.zlogout
	
dotfiles: 
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".gitmodules" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done
