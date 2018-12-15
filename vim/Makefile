include ../define.mk

WD := $(abspath $(shell pwd))
Q := @

VUNDLE = .vim/bundle/Vundle.vim/.git

.PHONY: install uninstall vim
all:
	@echo Run \'make install\' to install Vundle.vim

context:
	$(call check_context,wget)

.vimrc:
	$(Q) wget -O $@ \
		https://raw.githubusercontent.com/jhunahn/docker/master/vim/$@
	$(Q) echo  >> $@
	$(Q) echo "\" Turn on color syntax highlighting" >> $@
	$(Q) echo "syntax on" >> $@
	$(call COPY, $@, $$HOME)

.vim/bundle/Vundle.vim/.git:
	$(call submodules)

install: context .vim/bundle/Vundle.vim/.git .vimrc
	$(call COPY, .vim, $$HOME)
	$(Q) vim +PluginInstall +qall

uninstall:
	$(call DELFILE, .vimrc)
	$(call DELFILE, $$HOME/.vim*)

