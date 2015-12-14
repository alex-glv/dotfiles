.PHONY: all default dotfiles install

ll: dotfiles

default: install

install: all

dotfiles: 
	for file in $(shell find $(CURDIR) -name ".*" -not -name "prezto" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done

