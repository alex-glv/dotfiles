.PHONY: all default dotfiles install

ll: dotfiles

default: install

install: all

dotfiles: 
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done
	rm -rf $$HOME/.zprezto && git clone --recursive https://github.com/sorin-ionescu/prezto.git "$$HOME/.zprezto"
	ln -fs $$HOME/.zprezto/runcoms/zshrc $$HOME/.zshrc
	ln -fs $$HOME/.zprezto/runcoms/zshenv $$HOME/.zshenv
	ln -fs $$HOME/.zprezto/runcoms/zprofile $$HOME/.zprofile
	ln -fs $$HOME/.zprezto/runcoms/zlogin $$HOME/.zlogin
	ln -fs $$HOME/.zprezto/runcoms/zlogout $$HOME/.zlogout
