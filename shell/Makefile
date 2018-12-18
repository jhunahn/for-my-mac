include ../define.mk

WD := $(abspath $(shell pwd))
Q ?= @

MODE ?= zsh

DEPENDS := gettext openssl bash-completion

.PHONY: install uninstall context
all:
	@echo Run \'make install\' to install shell config

context:
	$(call check_context,$(DEPENDS))

.bash_profile: .config
	$(call COPY, $<, $@)
	$(call COPY, $@, $$HOME)

.install.sh:
	$(Q) curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > $@
	$(Q) SHELL=$(SHELL) $(SHELL) -c "$$(sed 's/env zsh.*//g' $@)"

install: context
ifeq (zsh,$(MODE))
	$(MAKE) .install.sh
else
	$(MAKE) .bash_profile
endif

uninstall:
ifeq (zsh,$(MODE))
	$(Q) $(SHELL) $$HOME/.oh-my-zsh/tools/uninstall.sh
	$(call DELFILE,$$HOME/.zsh* .install.sh)
else
	$(call DELFILE,.bash_profile)
endif

