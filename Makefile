.PHONY: all default dotfiles install

ll: dotfiles

default: install

install: all

dotfiles:
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp" -not -name ".config" -not -name "Makefile"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done
	# ... in .config
	for file in $(shell ls -a $(CURDIR)/.config | grep -v -P "\.$$|\.\."); do \
		ln -sfn $(CURDIR)/.config/$$file $(HOME)/.config/$$file; \
	done
	# .emacs.d
	for file in $(shell ls -a $(CURDIR)/.emacs.d| grep -v -P "\.$$|\.\."); do \
		ln -sfn $(CURDIR)/.emacs.d/$$file $(HOME)/.emacs.d/$$file; \
	done
