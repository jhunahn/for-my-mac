
define DELFILE
	$(Q) rm -rf $1
endef

define MOV
	$(Q) mv -f $1 $2
endef

define COPY
	$(Q) cp -R $1 $2
endef

define MKDIR
	$(Q) mkdir -p $(1)
endef

define submodules
	$(Q) git submodule init
	$(Q) git submodule update
endef

define check_context
	$(Q) for p in $1; do \
		test -e $(shell brew --cellar)/$$p || brew install $$p; \
	done
endef

