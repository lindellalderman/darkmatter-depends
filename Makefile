# Uncomment VERBOSE to see every comand that is executed
# VERBOSE := 1

CURDIR   =$(shell pwd)
SRC_DIR := $(shell pwd)

export CURDIR
export SRC_DIR

include mklib/build.mk

export BUILD_DATE
export LD_LIBRARY_PATH
export LD_RUN_PATH
export LIBRARY_PATH
export PATH
export PERL5LIB
export BUILD_DATE_STR
export BUILD_DATE
export BUILD_TZ
export BUILD_TIMESTAMP
export BUILD_EPOCH
export NOW_STR
export NOW
export CC
export CXX
export CPATH
export CFLAGS
export LDFLAGS

INSTALL_ORDER := automake autoconf libtool zlib ncurses gdbm md5 bzip2 libeio ares openssl libssh2 readline python libxml2 libxslt curl setuptools zeromq hiredis jsonlib epydoc postgresql

.BUILD_TARGETS=$(addsuffix -add,$(INSTALL_ORDER))
.CLEAN_TARGETS=$(addsuffix -clean,$(INSTALL_ORDER))
.PHONY=$(.BUILD_TARGETS) $(.CLEAN_TARGETS) help prep clean build-bin final install all build-info pause deb-info deb env

all: build-bin final env

build-info:
	$(QUIET) echo
	$(QUIET) echo ========================================================
	$(QUIET) printf "%s %s\n" $(NAME) $(VERSION)$(if $(RELEASE),-$(RELEASE),)
	$(QUIET) echo ========================================================
	$(QUIET) echo
	$(QUIET) printf "  %-18s %s\n" "Date:" "$(BUILD_DATE) $(BUILD_TZ)"
	$(QUIET) printf "  %-18s " "Distribution:" && echo "$(DISTRIB_DESCRIPTION) - $(DIST_ARCH)"
	$(QUIET) printf "  %-18s %s\n" "OS:" "$(OS) $(OS_RELEASE) $(ARCH)"
	$(QUIET) echo
	$(QUIET) printf "  %-18s %s\n" "Source Dir:"  "$(SRC_DIR)"
	$(QUIET) printf "  %-18s %s\n" "Prefix Dir:"     "$(PREFIX_DIR)"
	$(QUIET) printf "  %-18s %s\n" "Build Root:" "$(BUILD_ROOT)"
	$(QUIET) printf "  %-18s %s\n" "Dest Dir:" "$(DESTDIR)"
	$(QUIET) echo
	$(QUIET) printf "  %-18s %s\n" "Build Path:"  "$(PATH)"
	$(QUIET) printf "  %-18s %s\n" "Build UID:" "$(BUILD_UID)"
	$(QUIET) echo
pause:
	$(QUIET) sleep 1

help:
	$(QUIET) echo ===============================================================================
	$(QUIET) echo $(NAME) $(VERSION) 
	$(QUIET) echo ===============================================================================
	$(QUIET) echo
	$(QUIET) echo MAKE TARGETS
	$(QUIET) echo
	$(QUIET) printf "  %-50s %s\n" "$(MAKE) prep" "Install required packages to build stack"
	$(QUIET) printf "  %-50s %s\n" "$(MAKE) clean" "Clean source and build root"
	$(QUIET) printf "  %-50s %s\n" "$(MAKE) all [PREFIX_DIR=<dir>] [BUILD_ROOT=<dir>]" "Build stack and install to build root"
	$(QUIET) printf "  %-50s %s\n" "$(MAKE) install [DESTDIR=<dir>]" "Install stack to destination"
	$(QUIET) echo

prep:
	$(BUILD_DEPEND_INSTALL) $(BUILD_DEPENDS)

build-bin-pre: 
	rm -rf $(BUILD_ROOT)
	mkdir -p $(BUILD_ROOT)

build-bin: build-bin-pre $(.BUILD_TARGETS)
	$(QUIET) echo
	$(QUIET) echo Build complete.  Run "make install" to install files to the destination directory.
	$(QUIET) echo

final:
	$(QUIET) echo
	$(QUIET) echo Removing files that will not be packaged
	$(QUIET) rm -vf $(BUILD_ROOT)$(BIN_DIR)/aclocal*  || true
	$(QUIET) rm -vf $(BUILD_ROOT)$(BIN_DIR)/auto* || true
	$(QUIET) rm -vf $(BUILD_ROOT)$(BIN_DIR)/libtool* || true
	$(QUIET) rm -vf $(BUILD_ROOT)$(BIN_DIR)/ecpg || true
	$(QUIET) rm -vf $(BUILD_ROOT)$(BIN_DIR)/bz* || true
	$(QUIET) rm -vf $(BUILD_ROOT)$(BIN_DIR)/bunzip* || true
	$(QUIET) rm -vf $(BUILD_ROOT)$(BIN_DIR)/openssl || true
	$(QUIET) cd $(BUILD_ROOT)$(BIN_DIR) && rm -vf tic toe tset tput reset infocmp infotocap c_rehash clear captoinfo curl || true
	$(QUIET) rm -vf $(BUILD_ROOT)$(BIN_DIR)/ifnames || true
	$(QUIET) rm -rvf $(BUILD_ROOT)$(INFO_DIR) || true
	$(QUIET) rm -rvf $(BUILD_ROOT)$(PREFIX_DIR)/share/info || true
	$(QUIET) rm -rvf $(BUILD_ROOT)$(INCLUDE_DIR)/*ltdl* || true
	$(QUIET) cd $(BUILD_ROOT)$(PREFIX_DIR)/share && rm -rvf aclocal* autoconf* automake* libtool* emacs* gtk-doc* readline* man || true
	$(QUIET) rm -rvf $(BUILD_ROOT)$(MAN_DIR) || true
	$(QUIET) mkdir -p $(BUILD_ROOT)$(PREFIX_DIR)/doc || exit $?
	$(QUIET) chmod 0755 $(BUILD_ROOT)$(PREFIX_DIR)/doc || exit $?
	$(QUIET) if [ -d $(BUILD_ROOT)$(PREFIX_DIR)/share/doc ]; then cp -a $(BUILD_ROOT)$(PREFIX_DIR)/share/doc/* $(BUILD_ROOT)$(PREFIX_DIR)/doc; fi || exit $?
	$(QUIET) rm -rvf $(BUILD_ROOT)$(PREFIX_DIR)/share/doc || exit $?
	$(QUIET) echo
	$(QUIET) echo Cleaning up references to build root and source directories
	$(QUIET) echo
	$(QUIET) printf "[ *.pc "
	$(QUIET) find $(BUILD_ROOT) -type f -name "*.pc" -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR)/libxml2/xml2-config | sed 's/\//\\\//g')/$(shell echo $(BIN_DIR)/xml2-config | sed 's/\//\\\//g')/g' "{}" \; -exec sed -i 's/$(shell echo \-L$(SRC_DIR)/libxml2 | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \; || true
	$(QUIET) printf "| Makefile* "
	$(QUIET) find $(BUILD_ROOT) -type f -name "*Makefile*" -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR)/libxml2/xml2-config | sed 's/\//\\\//g')/$(shell echo $(BIN_DIR)/xml2-config | sed 's/\//\\\//g')/g' "{}" \; -exec sed -i 's/$(shell echo \-L$(SRC_DIR)/libxml2 | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \;  || true
	$(QUIET) printf "| *-config "
	$(QUIET) find $(BUILD_ROOT) -type f -name "*-config"  -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR)/libxml2/xml2-config | sed 's/\//\\\//g')/$(shell echo $(BIN_DIR)/xml2-config | sed 's/\//\\\//g')/g' "{}" \; -exec sed -i 's/$(shell echo \-L$(SRC_DIR)/libxml2 | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \; || true
	$(QUIET) printf "| *.h "
	$(QUIET) find $(BUILD_ROOT) -type f -name "*.h" -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR)/libxml2/xml2-config | sed 's/\//\\\//g')/$(shell echo $(BIN_DIR)/xml2-config | sed 's/\//\\\//g')/g' "{}" \; -exec sed -i 's/$(shell echo \-L$(SRC_DIR)/libxml2 | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \; || true
	$(QUIET) printf "| *.sh "
	$(QUIET) find $(BUILD_ROOT) -type f -name "*.sh" -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR)/libxml2/xml2-config | sed 's/\//\\\//g')/$(shell echo $(BIN_DIR)/xml2-config | sed 's/\//\\\//g')/g' "{}" \; -exec sed -i 's/$(shell echo \-L$(SRC_DIR)/libxml2 | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \; || true
	$(QUIET) printf "| easy* "
	$(QUIET) find $(BUILD_ROOT) -type f -name "easy*" -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR)/libxml2/xml2-config | sed 's/\//\\\//g')/$(shell echo $(BIN_DIR)/xml2-config | sed 's/\//\\\//g')/g' "{}" \; -exec sed -i 's/$(shell echo \-L$(SRC_DIR)/libxml2 | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \; || true
	$(QUIET) printf "| epy* "
	$(QUIET) find $(BUILD_ROOT) -type f -name "epy*" -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR)/libxml2/xml2-config | sed 's/\//\\\//g')/$(shell echo $(BIN_DIR)/xml2-config | sed 's/\//\\\//g')/g' "{}" \; -exec sed -i 's/$(shell echo \-L$(SRC_DIR)/libxml2 | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \; || true
	$(QUIET) printf "| *.la "
	$(QUIET) find $(BUILD_ROOT) -type f -name "*.la" -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR)/libxml2/xml2-config | sed 's/\//\\\//g')/$(shell echo $(BIN_DIR)/xml2-config | sed 's/\//\\\//g')/g' "{}" \; -exec sed -i 's/$(shell echo \-L$(SRC_DIR)/libxml2 | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \; || true
	$(QUIET) printf "| *.py "
	$(QUIET) find $(BUILD_ROOT) -type f -name "*.py" -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \; || true
	$(QUIET) printf "| /etc/* "
	$(QUIET) find $(BUILD_ROOT)/etc -type f -exec sed -i 's/$(shell echo $(BUILD_ROOT) | sed 's/\//\\\//g')//g' "{}" \; -exec sed -i 's/$(shell echo $(SRC_DIR) | sed 's/\//\\\//g')//g' "{}" \; || true
	$(QUIET) echo ]
	$(QUIET) echo Compressing doc files
	$(QUIET) find $(BUILD_ROOT)$(DOC_DIR) -type f ! -name "*.gz" -exec gzip -v9 "{}" \; || true
	$(QUIET) echo
	$(QUIET) echo Removing dot files and directories that should not be packaged
	$(QUIET) find $(BUILD_ROOT) -depth -type d -name ".svn" -exec rm -rf "{}" \; || true
	$(QUIET) find $(BUILD_ROOT) -depth -type d -name ".git" -exec rm -rf "{}" \; || true
	$(QUIET) find $(BUILD_ROOT) -name ".hg*" -delete || true
	$(QUIET) find $(BUILD_ROOT) -name ".bzr*" -delete || true
	$(QUIET) find $(BUILD_ROOT) -name ".cvs*" -delete || true
	$(QUIET) echo
	$(QUIET) echo Setting ownership of all files and directories to root
	$(QUIET) chown -R root:root $(BUILD_ROOT)
	$(QUIET) echo
	$(QUIET) echo Installation of all packages complete 
	$(QUIET) echo

clean-build-root:
	$(QUIET) rm -rf $(BUILD_ROOT) || true
	
clean: clean-build-root $(.CLEAN_TARGETS)
	$(QUIET) echo
	$(QUIET) echo Cleaning of all packages complete 
	$(QUIET) echo

$(.CLEAN_TARGETS):
	$(QUIET) cd $(SRC_DIR)/$(subst -clean,,$@) && $(MAKE) -f Makefile.dark pkg-clean || exit $?

$(.BUILD_TARGETS): 
	$(QUIET) cd $(SRC_DIR)/$(subst -add,,$@) && $(MAKE) -f Makefile.dark pkg-add || exit $?

install:
	$(QUIET) echo
	$(QUIET) echo ========================================================
	$(QUIET) echo INSTALL
	$(QUIET) echo ========================================================
	mkdir -p $(DESTDIR)$(PREFIX_DIR) || exit $?
	chmod 0755 $(DESTDIR)$(PREFIX_DIR) || exit $?
	chown root:root $(DESTDIR)$(PREFIX_DIR) || exit $?
	$(QUIET) echo Installing to $(DESTDIR)...
	@rsync -avcWP $(BUILD_ROOT)/ $(DESTDIR)/
	$(QUIET) echo
	$(QUIET) echo Installation complete
	$(QUIET) echo

deb-info:
	$(QUIET) echo --------------------------------------------------------
	$(QUIET) dpkg --info ../$(FILENAME)
	$(QUIET) echo --------------------------------------------------------
	$(QUIET) echo
	$(QUIET) echo Contents:
	$(QUIET) echo
	$(QUIET) dpkg --contents ../$(FILENAME)
	$(QUIET) echo

deb:
	$(QUIET) echo
	$(QUIET) echo ========================================================
	$(QUIET) echo PACKAGE - DEBIAN
	$(QUIET) echo ========================================================
	$(QUIET) echo
	$(QUIET) $(if $(shell if [ "$(BUILD_UID)" != "0" ]; then echo 1 ; fi),$(error Packages must be built by the root user.  Login or sudo to root and re-run $(MAKE) $$(QUIET) ))
	$(QUIET) echo Removing old files generated by debuild
	$(QUIET) find .. -maxdepth 1 -type f -name "$(NAME)_$(VERSION)*" -exec rm -vf "{}" \;
	$(QUIET) echo
	$(QUIET) rm -rf debian/$(NAME) $(BUILD_ROOT)
	$(QUIET) DEVSCRIPTS_CHECK_DIRNAME_LEVEL=0 debuild -uc -us -r"" || exit 1
	$(QUIET) echo
	$(QUIET) echo --------------------------------------------------------
	$(QUIET) dpkg --info ../$(FILENAME)
	$(QUIET) echo --------------------------------------------------------
	$(QUIET) echo
	$(QUIET) echo Contents:
	$(QUIET) echo
	$(QUIET) dpkg --contents ../$(FILENAME)
	$(QUIET) echo
	$(QUIET) echo Packaging complete. 
	$(QUIET) echo
	$(QUIET) echo Package is located in $(SRC_DIR).
	$(QUIET) echo
	$(QUIET) cd .. && printf "%s %s\n" "`md5sum $(FILENAME) | cut -d' ' -f1`" "`ls -l $(FILENAME)`"
	$(QUIET) echo rm -f .*-stamp
	$(QUIET) echo rm -rf $(BUILD_ROOT)
	$(QUIET) echo

env:
	$(QUIET) mkdir -pv "`dirname $(BUILD_ROOT)$(ENV_FILE)`"
	$(QUIET) mkdir -pv "$(BUILD_ROOT)/etc/profile.d"
	$(QUIET) echo PATH=\"$(BIN_DIR):\$$PATH\" > $(BUILD_ROOT)$(ENV_FILE)
	$(QUIET) echo CPATH=\"$(INCLUDE_DIR):$(INCLUDE_DIR)/ncurses:$(INCLUDE_DIR)/libxml2\" >> $(BUILD_ROOT)$(ENV_FILE)
	$(QUIET) echo LIBRARY_PATH=\"$(LIB_DIR)\" >> $(BUILD_ROOT)$(ENV_FILE)
	$(QUIET) echo LDFLAGS=\"$(RPATH_FLAGS)\" >> $(BUILD_ROOT)$(ENV_FILE)
	$(QUIET) echo --------------------------------------------------------
	$(QUIET) echo $(ENV_FILE)
	$(QUIET) echo --------------------------------------------------------
	$(QUIET) echo LD_RUN_PATH=\"$(LIB_DIR)\" >> $(BUILD_ROOT)$(ENV_FILE)
	$(QUIET) cat $(BUILD_ROOT)$(ENV_FILE)
	$(QUIET) printf "dark-init() {\\n\\n    . $(ENV_FILE)\\n\\n}\\n" > $(BUILD_ROOT)/etc/profile.d/darkmatter.sh
	$(QUIET) printf "\n\n\n"
	$(QUIET) echo --------------------------------------------------------
	$(QUIET) echo /etc/profile.d/darkmatter.sh
	$(QUIET) echo --------------------------------------------------------
	$(QUIET) cat $(BUILD_ROOT)/etc/profile.d/darkmatter.sh
	$(QUIET) echo --------------------------------------------------------
	$(QUIET) echo
	$(QUIET) chmod -v 0644 $(BUILD_ROOT)/etc/profile.d/darkmatter.sh
