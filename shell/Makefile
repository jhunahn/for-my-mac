include ../define.mk

WD := $(abspath $(shell pwd))
Q ?= @

MODE ?= zsh

DEPENDS := gettext openssl bash-completion

define neofetch
	$(Q) echo >> $$HOME/$(1)
	$(Q) echo "neofetch --iterm2 $$HOME/.config/neofetch/$2 # print system information" >> $$HOME/$(1)
endef

.PHONY: install uninstall context .zsh_profile config
all:
	@echo Run \'make install\' to install shell config

context:
	$(call check_context,$(DEPENDS))
	$(Q) brew cask install item2
	$(call submodules)

.bash_profile: .config
	$(call COPY, $<, $@)
	$(call COPY, $@, $$HOME)

.install.sh:
	$(Q) curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > $@

config: .install.sh
	$(Q) sudo chsh -s $(shell which zsh)
	$(Q) SHELL=$(SHELL) $(SHELL) -c "$$(sed 's/env zsh.*//g' $@)"
	$(Q) cp -R $(wildcard .zsh/*) $$HOME/.oh-my-zsh/custom
	$(Q) sed -i '' 's/\(plugins=(\)/ \1 $(notdir $(wildcard .zsh/plugins/*))/' $$HOME/.zshrc
	$(Q) sed -i '' 's/\(^ZSH_THEME=\).*/\1"powerlevel9k\/powerlevel9k"/' $$HOME/.zshrc
	$(Q) sed -i '' '/^ZSH_THEME=/i\POWERLEVEL9K_MODE=\"awesome-fontconfig\"/' $$HOME/.zshrc
	$(Q) wget https://raw.githubusercontent.com/arcticicestudio/nord-iterm2/develop/src/xml/Nord.itermcolors
	@echo "import Nord color preset"
	$(foreach TAR,$(wildcard .font/*/install.sh),$(SHELL) $(TAR))
	$(Q) cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" \
		https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

.zsh_profile: config
	$(Q) cat $@ >> $$HOME/.zshrc
	$(Q) sed -i '1i\export TERM="xterm-256color"' $$HOME/.zshrc

/usr/local/bin/neofetch: .neofetch
	$(Q) sudo $(MAKE) -C $< install PREFIX=/usr/local
	$(call MKDIR, $$HOME/.config/$(notdir $@))
	$(call COPY, $(wildcard .resource/*.jpg), $$HOME/.config/$(notdir $@))

ifeq (zsh,$(MODE))
install: context .zsh_profile /usr/local/bin/neofetch
	$(call neofetch,.zshrc,$(wildcard *.jpg))
else
install: context .bash_profile /usr/local/bin/neofetch
	$(call neofetch,.bash_profile,$(wildcard *.jpg))
endif

uninstall:
ifeq (zsh,$(MODE))
	$(Q) $(SHELL) $$HOME/.oh-my-zsh/tools/uninstall.sh
	$(call DELFILE,$$HOME/.zsh* .install.sh)
else
	$(call DELFILE,.bash_profile)
endif
	$(Q) sudo $(MAKE) -C .neofetch $@ PREFIX=/usr/local
