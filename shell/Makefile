include ../define.mk

WD := $(abspath $(shell pwd))
Q ?= @

MODE ?= zsh

DEPENDS := gettext openssl bash-completion

define neofetch
	$(Q) echo >> $$HOME/$(1)
	$(Q) echo "neofetch # print system information" >> $$HOME/$(1)
endef

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
	$(Q) cp -R $(wildcard .zsh/*) $$HOME/.oh-my-zsh/custom/plugins
	$(Q) sed -i .back -e 's/\(plugins=(\)/ \1 $(notdir $(wildcard .zsh/*))/' \
		$$HOME/.zshrc

/usr/local/bin/neofetch: .neofetch
	$(Q) $(MAKE) -C $< install PREFIX=/usr/local

install: context /usr/local/bin/neofetch
ifeq (zsh,$(MODE))
	$(call submodules)
	$(MAKE) .install.sh
	$(call neofetch,.zshrc)
else
	$(MAKE) .bash_profile
	$(call neofetch,.bash_profile)
endif

uninstall:
ifeq (zsh,$(MODE))
	$(Q) $(SHELL) $$HOME/.oh-my-zsh/tools/uninstall.sh
	$(call DELFILE,$$HOME/.zsh* .install.sh)
else
	$(call DELFILE,.bash_profile)
endif

