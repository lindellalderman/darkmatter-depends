REMOVE_PATHS += $(PY_LIB_DIR)*/site-packages/$(pkg_name)* $(PY_LIB_DIR)/*/site-packages/_$(pkg_name)* 

ifndef pkg_name
pkg_name := $(shell python setup.py --name)
endif

ifndef pkg_version
pkg_version := $(shell python setup.py --version)
endif

ifndef pkg_description
pkg_description := $(shell python setup.py --description)
endif

define pkg_configure
	$(BUILD_FLAGS) $(PYTHON) setup.py $(PY_SETUP_OPTS) config $(PY_CONFIG_OPTS) || exit $?
endef

define pkg_clean
	if [ -d build ]; then rm -rf build; fi
	$(BUILD_FLAGS) $(PYTHON) setup.py $(PY_SETUP_OPTS) clean $(PY_CONFIG_OPTS) || true
endef

define pkg_build
	$(BUILD_FLAGS) $(PYTHON) setup.py $(PY_SETUP_OPTS) build $(PY_CONFIG_OPTS) -e $(PYTHON) || exit $?
endef

define pkg_install
	rm -rf .build
	$(BUILD_FLAGS) $(PYTHON) setup.py $(PY_SETUP_OPTS) install $(PY_CONFIG_OPTS) --prefix=$(PREFIX_DIR) --root ".build" || exit $?
	cd .build && cp -av * $(BUILD_ROOT)
endef

define pkg_remove
	if [ `find $(PY_SITE_DIR) -name "$(pkg_name)*" | wc -l` -gt 0 ]; then rm -rvf $(PY_SITE_DIR)/$(pkg_name)* || true ; fi
endef
