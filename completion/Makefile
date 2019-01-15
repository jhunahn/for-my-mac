include ../define.mk

WD := $(abspath $(shell pwd))
Q := @

COMPLETION_DIR := $(shell brew --prefix)/etc/bash_completion.d

DEPENDS := bash-completion wget

define docker_templete
$(2):
	@echo $2....
	$(eval baseurl = https://raw.githubusercontent.com/docker/$(firstword $1))
	$(eval _version := `$(patsubst %.bash,%,$2) --version`)
	$(Q) wget $(baseurl)/$3$(shell echo $(_version) | awk '{print $$3}' | sed 's/,//')/contrib/completion/bash/$2
endef

docker-exec := docker docker-compose docker-machine.bash

.PHONY: install uninstall context git
all:
	@echo Run \'make install\' to install completions

$(COMPLETION_DIR):
	$(call check_context,$(DEPENDS))

git-completion.bash:
	$(Q) wget https://raw.githubusercontent.com/git/git/v$$(git version | awk '{print $$3}')/contrib/completion/$@

$(eval $(call docker_templete,cli,docker,v))
$(eval $(call docker_templete,compose,docker-compose))
$(eval $(call docker_templete,machine,docker-machine.bash,v))


install: $(COMPLETION_DIR) git-completion.bash $(docker-exec)
ifneq (zsh,$(SH))
	$(call COPY,$(filter-out $<,$^),$(COMPLETION_DIR))
else
	$(Q) sed -i '' 's/\(plugins=(\)/\1\ docker/' $${HOME}/.zshrc
endif

uninstall:
	$(call DELFILE, git-completion.bash $(docker-exec))
	$(call DELFILE, $(addprefix $(COMPLETION_DIR)/,git-completion.bash $(docker-exec)))

