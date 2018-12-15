include define.mk
-include brew

WD := $(abspath $(shell pwd))
Q := @

define add_target
_$(2)_$(1):
	$(Q) echo "$(2)ing $(1)..."
	$(Q) $(MAKE) -C $(1) $(2)

endef

SUBTARGETS := $(patsubst %/Makefile,%,$(wildcard */Makefile))

.PHONY: install uninstall context brew
all:
	@echo Run \'make install\' to install envirionments

$(foreach TAR,$(SUBTARGETS),$(eval $(call add_target,$(TAR),install)))
$(foreach TAR,$(SUBTARGETS),$(eval $(call add_target,$(TAR),uninstall)))

context: brew

brew:
ifeq (, $(shell which brew))
	$(Q) /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif
	@touch .$@

install: $(addprefix _install_,$(SUBTARGETS))

uninstall: $(addprefix _uninstall_,$(SUBTARGETS))
	$(call DELFILE, .brew)
