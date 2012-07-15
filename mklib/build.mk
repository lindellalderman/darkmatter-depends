############################################################
# BUILD METADATA
############################################################
NAME            := darkmatter-depends
VERSION         := 0.5.8
RELEASE         := 2

############################################################
# PATHS
############################################################

# Load distrib variables if they exist
ifneq ($(shell test -e /etc/lsb-release && echo 1),)
include /etc/lsb-release
endif

ifdef PACKAGE
ROOT_DIR = /usr
else
ROOT_DIR    = /usr/local
endif

ROOT_BIN_DIR = $(ROOT_DIR)/bin
PREFIX_DIR  = $(ROOT_DIR)/$(LIB_DIR_NAME)/darkmatter
BIN_DIR     = $(PREFIX_DIR)/bin
SBIN_DIR    = $(PREFIX_DIR)/sbin
INCLUDE_DIR = $(PREFIX_DIR)/include
LIB_DIR     = $(PREFIX_DIR)/lib
MAN_DIR     = $(PREFIX_DIR)/man
SHARE_DIR   = $(PREFIX_DIR)/share
INFO_DIR    = $(PREFIX_DIR)/info
VAR_DIR     = $(PREFIX_DIR)/var
PY_LIB_DIR  = $(LIB_DIR)/python$(PY_VERSION)
DOC_DIR     = $(PREFIX_DIR)/doc
LIBEXEC_DIR = $(PREFIX_DIR)/libexec
PKG_CONFIG_PATH = $(LIB_DIR)/pkgconfig

ifdef PACKAGE
ETC_DIR     = /etc/darkmatter
else
ETC_DIR     = $(PREFIX_DIR)/etc
endif

LOG_DIR     = $(VAR_DIR)/log
TMP_DIR     = $(VAR_DIR)/tmp

############################################################
# COMMON BUILD OPTIONS
############################################################
ifeq (Ubuntu,$(shell grep DISTRIB_ID /etc/lsb-release 2> /dev/null | cut -d= -f2 ))
UBUNTU=1
DEBIAN=1
endif

ifeq (CentOS,$(shell cat /etc/redhat-release 2> /dev/null | cut -d' ' -f1 ))
REDHAT=1
endif

ifeq (opensuse,$(shell grep opensuse /etc/os-release | cut -d= -f2))
OPENSUSE=1
SUSE=1
endif

OS_RELEASE := $(shell uname -r)

OS := $(shell uname -s)
ifeq (Linux,$(OS))
LINUX=1
endif

ARCH := $(shell uname -i)
ifeq (x86_64,$(ARCH))
x86_64=1
LIB_DIR_NAME=lib64
else
i386=1
LIB_DIR_NAME=lib
endif

# Build Tools required to build the stack
DIST_ARCH := i386
DIST_EXT := tar
ifdef REDHAT
BUILD_DEPENDS = cmake autoconf imake patch gcc gcc-c++ git psutils texinfo uuid-devel libuuid libuuid-devel pam-devel libaio-devel libaio glibc-devel compat-glibc

BUILD_DEPEND_INSTALL = yum install -y
ifdef x86_64
DIST_ARCH := x86_64
endif
DIST_EXT := rpm
RELEASE  := 1
FILENAME        = $(NAME)-$(VERSION)-$(RELEASE).$(DIST_ARCH).$(DIST_EXT)
else

ifdef DEBIAN
BUILD_DEPENDS = cmake autoconf xutils-dev patch gcc g++ git psutils texinfo uuid-dev uuid-runtime libaio-dev libaio1 ragel
BUILD_DEPEND_INSTALL = apt-get install -y
ifdef x86_64
DIST_ARCH := amd64
endif
DIST_EXT := deb
RELEASE :=
FILENAME = $(NAME)_$(VERSION)_$(DIST_ARCH).$(DIST_EXT)
RELEASE  :=
endif

ifdef SUSE
BUILD_DEPENDS = cmake autoconf xorg-x11-util-devel patch gcc gcc-c++ git psutils texinfo uuid-devel libuuid-devel pam-devel libaio-devel libaio glibc-devel 
BUILD_DEPEND_INSTALL = yast -i
ifdef x86_64
DIST_ARCH := x86_64
endif
DIST_EXT := rpm
RELEASE :=
FILENAME = $(NAME)_$(VERSION)_$(DIST_ARCH).$(DIST_EXT)
RELEASE  :=
endif

endif

ifdef SUNOS
PATH_EXTRA += /usr/sfw/bin:/usr/gnu/bin:/usr/bin/X11
endif

ifndef CC
CC = gcc
endif

ifndef CXX
CXX = g++
endif

ifndef BUILD_ROOT
BUILD_ROOT  := $(SRC_DIR)/.build
endif

BUILD_UID       := $(shell id -u)
BUILD_TZ        := "+0000"
BUILD_DATE_STR  := $(shell date -u)
BUILD_DATE      := $(shell date -d "$(BUILD_DATE_STR)" +"%Y-%m-%d %H:%M:%S")
BUILD_TIMESTAMP := $(shell date -d "$(BUILD_DATE_STR)" +"%Y%m%d-%H%M")
BUILD_EPOCH     := $(shell date -d "$(BUILD_DATE_STR)" +"%s")
NOW_STR         = $(shell date -u)
NOW             = $(shell date -d "$(NOW_STR)" +"%Y-%m-%d %H:%M:%S")
CW_DIR          = $(CURDIR)
PATH            := $(BUILD_ROOT)$(BIN_DIR)$(if $(PATH_EXTRA),:$(PATH_EXTRA)):/sbin:/bin:/usr/sbin:/usr/bin
MAKEFILE        = Makefile
CPPFLAGS        += -I$(BUILD_ROOT)$(INCLUDE_DIR) -I$(BUILD_ROOT)$(INCLUDE_DIR)/ncurses -I$(BUILD_ROOT)$(INCLUDE_DIR)/libxml2
CXXFLAGS        += $(CFLAGS)
CPATH           += $(BUILD_ROOT)$(INCLUDE_DIR):$(BUILD_ROOT)$(INCLUDE_DIR)/ncurses:$(BUILD_ROOT)$(INCLUDE_DIR)/libxml2
ifdef REDHAT
LDFLAGS         += -L/lib64 -L/usr/lib64
endif
ifdef SUSE
LDFLAGS         += -L/lib64 -L/usr/lib64
endif
LDFLAGS         += -L$(BUILD_ROOT)$(LIB_DIR) 
LIBS            += -lc -lm
LD_RUN_PATH     := $(BUILD_ROOT)$(LIB_DIR)
#LIBRARY_PATH    := $(BUILD_ROOT)$(LIB_DIR)
PERL5LIB        := $(BUILD_ROOT)$(SHARE_DIR)/autoconf

COMMON_FLAGS   = CC="$(CC)" CPATH="$(CPATH)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CPPFLAGS="$(CPPFLAGS)" CXXFLAGS="$(CFLAGS)" PATH="$(PATH)" PERL5LIB="$(PERL5LIB)" PKG_CONFIG_PATH="$(BUILD_ROOT)$(PKG_CONFIG_PATH)"
LINK_FLAGS     = LD_RUN_PATH="$(LD_RUN_PATH)" LDFLAGS="$(LDFLAGS) $(LIBS)" LIBS="$(LIBS)" $(LINK_EXTRA_FLAGS) 
BUILD_FLAGS    = $(COMMON_FLAGS) $(COMPILE_EXTRA_FLAGS) $(LINK_FLAGS)
DM_CONFIG      = -D_PYTHON='"$(subst $(BUILD_ROOT),,$(PYTHON))"' -D_PATH='"$(subst $(BUILD_ROOT),,$(PATH))"' -D_CFLAGS='"$(subst $(BUILD_ROOT),,$(CFLAGS))"' -D_CXXFLAGS='"$(subst $(BUILD_ROOT),,$(CXXFLAGS))"' -D_CPPFLAGS='"$(subst $(BUILD_ROOT),,$(CPPFLAGS))"' -D_LDFLAGS='"$(subst $(BUILD_ROOT),,$(LDFLAGS))"' -D_LIBS='"$(subst $(BUILD_ROOT),,$(LIBS))"' -D_BINDIR='"$(subst $(BUILD_ROOT),,$(BIN_DIR))"' -D_LIBDIR='"$(subst $(BUILD_ROOT),,$(LIB_DIR))"' -D_INCDIR='"$(subst $(BUILD_ROOT),,$(INCLUDE_DIR))"'

ENV_FILE =     /etc/darkmatter/env.sh

ifndef VERBOSE
QUIET := @
endif

ifndef LIB_EXT
LIB_EXT = so
endif

REMOVE_PATHS     = $(SBIN_DIR)/$(pkg_name)* $(BIN_DIR)/$(pkg_name)* $(VAR_DIR)/lib/$(pkg_name)* $(LIB_DIR)/$(pkg_name)* $(LIB_DIR)/lib$(pkg_name)* $(INCLUDE_DIR)/$(pkg_name)* $(SHARE_DIR)/$(pkg_name) $(SHARE_DIR)/$(pkg_name)-$(pkg_version) $(MAN_DIR)/*/$(pkg_name).* $(SHARE_DIR)/man/*/$(pkg_name).*  $(DOC_DIR)/$(pkg_name)* $(SHARE_DIR)/doc/$(pkg_name)* $(LIB_DIR)/pkgconfig/$(pkg_name)*.pc 

# Build tools
PYTHON = $(BUILD_ROOT)$(BIN_DIR)/python
PY_VERSION = 2.7
AUTORECONF = $(if $(shell which $(BUILD_ROOT)$(BIN_DIR)/autoreconf 2> /dev/null || true),$(BUILD_ROOT)$(BIN_DIR)/autoreconf,$(shell which autoreconf))

# Configure options
CONFIG_OPTS        = --prefix=$(PREFIX_DIR)
PY_CONFIG_OPTS     =
PY_SETUP_OPTS      =

###########################################################
# LINUX SPECIFIC OPTIONS
###########################################################

ifdef LINUX
RPATH_FLAGS := -Wl,-rpath -Wl,$(LIB_DIR)
LDFLAGS += $(RPATH_FLAGS)
ifdef UBUNTU
ifdef x86_64
LIBRARY_PATH := $(LIBRARY_PATH):/lib64/x86_64-linux-gnu:/usr/lib64/x86_64-linux-gnu
endif
endif
endif

###########################################################
# SOLARIS SPECIFIC OPTIONS
###########################################################

ifdef SUNOS
CPATH := $(CPATH):/usr/sfw/include
LIBS += -lnsl -lsocket -lresolv -lrt
RPATH_FLAGS = -Wl,-rpath -Wl,$(LIB_DIR) -R $(LIB_DIR)
LD_FLAGS += $(RPATH_FLAGS)
LIBRARY_PATH := $(LIBRARY_PATH):/usr/sfw/lib:/usr/lib
LD_RUN_PATH := $(LD_RUN_PATH):/usr/sfw/lib:/usr/lib
endif

###########################################################
# MAC OS X SPECIFIC OPTIONS
###########################################################
ifdef DARWIN
LIB_EXT := dylib
endif

###########################################################
# 64 BIT SPECIFIC OPTIONS
###########################################################
ifdef x86_64
CFLAGS+=-fpic -fPIC
endif

export CC
export CXX
export CFLAGS
export LDFLAGS
export LD_RUN_PATH
export CPATH
export LIBRARY_PATH
export PATH
export PERL5LIB

# Sanity checks

ifeq ($(PREFIX_DIR),)
$(error PREFIX_DIR must be defined to build the stack)
endif

ifeq ($(BUILD_ROOT),)
$(error BUILD_ROOT must be defined to build the stack)
endif

ifeq ($(CC),)
$(error CC must be defined to build the stack)
endif

ifeq ($(CXX),)
$(error CXX must be defined to build the stack)
endif
