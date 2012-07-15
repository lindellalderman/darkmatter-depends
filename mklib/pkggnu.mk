ifndef DESTDIRARG
ifndef DESTDIR
DESTDIR = $(if $(shell grep DESTDIR $(MAKEFILE)),DESTDIR,$(if $(shell grep PREFIX $(MAKEFILE)),PREFIX,$(if $(shell grep INSTALL_ROOT $(MAKEFILE)),INSTALL_ROOT,$(error DESTDIR could not be guessed for $(pkg_name)))))
endif
endif

ifndef INSTALL_TARGET
INSTALL_TARGET=install
endif

config_add_opt = $(shell test `./configure --help | /bin/grep -c "\-\-$(1)"` -gt 0 && echo "--$(1)=$(2)" || true)

ifndef pkg_distclean
define pkg_distclean
	#$(QUIET) $(BUILD_FLAGS) $(MAKE) -f $(MAKEFILE)  distclean &> /dev/null || true
endef
endif

ifndef pkg_configure
define pkg_configure 
	if [ -e ./configure ]; then $(BUILD_FLAGS) ./configure $(CONFIG_OPTS) 2>&1 || exit 1 ; fi
endef
endif

ifndef pkg_clean
define pkg_clean
	if [ -r $(MAKEFILE) ]; then $(BUILD_FLAGS) $(MAKE) -f $(MAKEFILE) clean 2>&1 || true ; fi
endef
endif

ifndef BUILD_TARGET
BUILD_TARGET := all
endif

ifndef pkg_build
define pkg_build 
	$(BUILD_FLAGS) $(MAKE) -f $(MAKEFILE) $(BUILD_TARGET)$(BUILD_EXTRA) 2>&1 || exit $?
endef
endif

ifndef pkg_install
define pkg_install
	$(BUILD_FLAGS) $(MAKE) -f $(MAKEFILE) $(INSTALL_TARGET) $(if $(BUILD_ROOT_ONLY),,$(if $(DESTDIRARG),$(DESTDIRARG),$(DESTDIR)=$(BUILD_ROOT))) 2>&1 || exit $? 
endef
endif

ifndef pkg_remove
define pkg_remove
	$(QUIET) echo No remove script defined yet.
endef
endif
