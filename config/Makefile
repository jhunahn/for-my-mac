include ../define.mk

WD := $(abspath $(shell pwd))
Q := @

NAME ?= Jihun Ahn
EMAIL ?= jhun.ahnn@gmail.com

DEPENDS := wget less tig

CONFIGS := .gitconfig .tigrc

define getconfig
$1:
	$(Q) wget -O $1 \
		https://raw.githubusercontent.com/jhunahn/docker/master/$1
endef

all:
	@echo Run \'make install\' to install configs

.PHONY: install uninstall context git tig

context:
	$(call check_context,$(DEPENDS))
	$(Q) brew tap homebrew/cask
	$(Q) brew cask install meld

$(foreach FILE,$(CONFIGS),$(eval $(call getconfig,$(FILE))))

install: context $(CONFIGS)
	$(call COPY,$(filter-out context, $?),$$HOME)
	$(Q) git config --global user.name $(NAME)
	$(Q) git config --global user.email $(EMAIL)
	$(Q) git config --global merge.tool meld

uninstall:
	$(call DELFILE,$(CONFIGS))

