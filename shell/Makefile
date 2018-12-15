include ../define.mk

WD := $(abspath $(shell pwd))
Q ?= @

DEPENDS := gettext openssl bash-completion

.PHONY: install uninstall context
all:
	@echo Run \'make install\' to install shell config

context:
	$(call check_context,$(DEPENDS))

.bash_profile: .config
	$(call COPY, $<, $@)
	$(call COPY, $@, $$HOME)

install: context .bash_profile

uninstall:
	$(call DELFILE,.bash_profile)
