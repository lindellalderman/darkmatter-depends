export LD_RUN_PATH
export LIBRARY_PATH
export PATH
export PERL5LIB

############################################################
# PACKAGES
############################################################

# COMMON PACKAGE FUNCTIONS

ifndef pkg_help
define pkg_help
	$(QUIET) echo
	$(QUIET) echo Dark Matter Stack: $(pkg_name)-$(pkg_version)
	$(QUIET) if [ -n "$(pkg_description)" ]; then echo "\n$(pkg_description)" ; fi
	$(QUIET) echo
	$(QUIET) echo QUICK INSTALL 
	$(QUIET) echo
	$(QUIET)  printf "  make -f Makefile.dark pkg-clean  - "  ; echo "Clean package" 
	$(QUIET)  printf "  make -f Makefile.dark pkg-add    - "  ; echo "Install package" 
	$(QUIET)  printf "  make -f Makefile.dark pkg-remove - "  ; echo "Uninstall package" 
	$(QUIET) echo
endef
endif

ifndef pkg_name
$(error pkg_name must be defined in Makefile.dark)
endif

ifndef pkg_version
$(error pkg_version must be defined in Makefile.dark)
endif

ifndef pkg_release
$(error pkg_release must be defined in Makefile.dark)
endif

# TARGETS

pkg-help:
	$(call pkg_help)

pkg-name:
	$(QUIET) echo $(pkg_name)

pkg-version:
	$(QUIET) echo $(pkg_version)

pkg-configure:
	$(QUIET) echo
	$(QUIET) echo Configuring package 
	$(QUIET) echo
	$(call pkg_predistclean)
	$(call pkg_distclean)
	# Make sure these files never exist before build
	@if [ -e configure ]; then rm -rf Makefile config.log autom4te.cache; fi
	$(call pkg_clean)
	@find . -name "*.[oa]" -exec rm -vf "{}" \;
	@find . -name "*.so" -exec rm -vf "{}" \;
	@find . -name "*.so.*" -exec rm -vf "{}" \;
	$(call pkg_preconfigure)
	$(call pkg_configure)
	$(call pkg_postconfigure)
	$(QUIET) echo
	$(QUIET) echo Configuration complete 
	$(QUIET) echo

pkg-build:
	$(QUIET) echo
	$(QUIET) echo Building package 
	$(QUIET) echo
	$(call pkg_prebuild)
	$(call pkg_build)
	$(call pkg_postbuild)
	$(QUIET) echo
	$(QUIET) echo Build complete 
	$(QUIET) echo

pkg-install:
	$(QUIET) mkdir -p $(BUILD_ROOT)$(PREFIX_DIR) 
	$(QUIET) mkdir -p $(BUILD_ROOT)$(LIB_DIR)
	$(QUIET) mkdir -p $(BUILD_ROOT)$(BIN_DIR)
	$(QUIET) mkdir -p $(BUILD_ROOT)$(SHARE_DIR)
	$(QUIET) mkdir -p $(BUILD_ROOT)$(INCLUDE_DIR)
	$(QUIET) mkdir -p $(BUILD_ROOT)$(DOC_DIR)
	$(QUIET) echo
	$(QUIET) echo Installing package 
	$(QUIET) echo
	$(call pkg_preinstall)
	$(call pkg_install)
	$(call pkg_postinstall)
	$(QUIET) echo
	$(QUIET) echo Installation of $(pkg_name)-$(pkg_version) complete
	$(QUIET) echo

pkg-clean:
	$(QUIET) echo
	$(QUIET) echo Cleaning package 
	$(QUIET) echo
	$(call pkg_preclean)
	$(call pkg_clean)
	$(call pkg_postclean)
	$(QUIET) find . -name "*.[oa]" -delete || true
	$(QUIET) find . -name "*.l[oa]" -delete || true
	$(QUIET) find . -name "*.so" -delete || true
	$(QUIET) find . -name "*.py[co]" -delete || true
	$(QUIET) find . -name "*.dylib" -delete || true
	$(QUIET) echo
	$(QUIET) echo Cleaning complete 
	$(QUIET) echo

pkg-remove:
	$(QUIET) printf "%70s\n" "" 
	$(QUIET) echo
	$(QUIET) echo Removing $(pkg_name)-$(pkg_version)
	$(QUIET) printf "%70s\n" "" 
	$(QUIET) echo
	$(QUIET) echo
	$(QUIET) echo Removing installed files 
	$(QUIET) echo
	$(call pkg_preremove)
	$(call pkg_remove)
	$(call pkg_postremove)
	$(QUIET) rm -rvf $(addprefix $(BUILD_ROOT),$(REMOVE_PATHS)) || true
	$(QUIET) echo
	$(QUIET) echo Removal complete 

pkg-add: pkg-remove pkg-clean pkg-configure pkg-build pkg-install
