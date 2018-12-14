include ../define.mk

WD := $(abspath $(shell pwd))
Q := @

COMPLETION_DIR := $(shell brew --prefix)/etc/bash_completion.d

DEPENDS := bash-completion wget

define add_completion
	$(MAKE) $(notdir $(1))
	$(call MOV,$(1),$(COMPLETION_DIR))
endef

.PHONY: install uninstall context git
all:
	@echo Run \'make install\' to install completions

$(COMPLETION_DIR):
	$(call check_context,$(DEPENDS))

git-completion.bash:
	$(Q) wget https://raw.githubusercontent.com/git/git/v$$(git version | awk '{print $$3}')/contrib/completion/$@

$(COMPLETION_DIR)/git-completion.bash: $(COMPLETION_DIR) 
	$(call add_completion, $(notdir $@))

install: $(COMPLETION_DIR)/git-completion.bash

uninstall:
	$(call DELFILE, $(COMPLETION_DIR)/git-completion.bash)

