# $Id: Makefile.in,v 1.48 2007/04/28 14:56:11 tom Exp $
##############################################################################
# Copyright (c) 1998-2006,2007 Free Software Foundation, Inc.                #
#                                                                            #
# Permission is hereby granted, free of charge, to any person obtaining a    #
# copy of this software and associated documentation files (the "Software"), #
# to deal in the Software without restriction, including without limitation  #
# the rights to use, copy, modify, merge, publish, distribute, distribute    #
# with modifications, sublicense, and/or sell copies of the Software, and to #
# permit persons to whom the Software is furnished to do so, subject to the  #
# following conditions:                                                      #
#                                                                            #
# The above copyright notice and this permission notice shall be included in #
# all copies or substantial portions of the Software.                        #
#                                                                            #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    #
# THE ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    #
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER        #
# DEALINGS IN THE SOFTWARE.                                                  #
#                                                                            #
# Except as contained in this notice, the name(s) of the above copyright     #
# holders shall not be used in advertising or otherwise to promote the sale, #
# use or other dealings in this Software without prior written               #
# authorization.                                                             #
##############################################################################
#
# Author: Thomas E. Dickey 1996-on
#
# Makefile for menu source code.
#
# This makes the following:
#	libraries (normal/debug/profile/shared)
#
# The variable 'srcdir' refers to the source-distribution, and can be set with
# the configure script by "--srcdir=DIR".
#
# The rules are organized to produce the libraries for the configured models,

# turn off _all_ suffix rules; we'll generate our own
.SUFFIXES:

SHELL		= /bin/sh
THIS		= Makefile

x		= 
o		= .lo

MODEL		= libtool
DESTDIR		= 
srcdir		= .
prefix		= /usr/local/lib64/darkmatter
exec_prefix	= ${prefix}
bindir		= ${exec_prefix}/bin
libdir		= ${exec_prefix}/lib
includedir	= ${prefix}/include/ncurses

LIBTOOL		= /root/darkmatter-depends/.build/usr/local/lib64/darkmatter/bin/libtool --tag=CC
LIBTOOL_CLEAN	= ${LIBTOOL} --mode=clean
LIBTOOL_COMPILE	= ${LIBTOOL} --mode=compile
LIBTOOL_LINK	= ${LIBTOOL} --mode=link ${CC} ${LIBTOOL_OPTS}
LIBTOOL_INSTALL	= ${LIBTOOL} --mode=install
LIBTOOL_UNINSTALL = ${LIBTOOL} --mode=uninstall

INSTALL		= /usr/bin/install -c
INSTALL_LIB	= /usr/bin/install -c -m 644
INSTALL_PROG	= ${INSTALL}
INSTALL_DATA	= ${INSTALL} -m 644

AR		= ar
AR_OPTS		= rv
AWK		= gawk
LD		= ld
LN_S		= ln -s

CC		= cc
CPP		= cc -E
CFLAGS		= -fpic -fPIC -fpic -fPIC  --param max-inline-insns-single=1200

CPPFLAGS	= -I../ncurses -DHAVE_CONFIG_H -I. -I../include -I/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/include -I/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/include/ncurses -I/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/include/libxml2 -D_GNU_SOURCE -DNDEBUG -I${includedir}

CCFLAGS		= $(CPPFLAGS) $(CFLAGS)

CFLAGS_LIBTOOL	= $(CCFLAGS)
CFLAGS_NORMAL	= $(CCFLAGS)
CFLAGS_DEBUG	= $(CCFLAGS) -g -DTRACE
CFLAGS_PROFILE	= $(CCFLAGS) -pg
CFLAGS_SHARED	= $(CCFLAGS) -fPIC

CFLAGS_DEFAULT	= $(CFLAGS_LIBTOOL)

LINK		= $(LIBTOOL_LINK)
LDFLAGS		= -L/lib64 -L/usr/lib64 -L/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/lib  -Wl,-rpath -Wl,/usr/local/lib64/darkmatter/lib -L/lib64 -L/usr/lib64 -L/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/lib  -Wl,-rpath -Wl,/usr/local/lib64/darkmatter/lib -lc -lm  -lc -lm

SHLIB_DIRS	= -L../lib
SHLIB_LIST	= $(SHLIB_DIRS) -lncurses 

MK_SHARED_LIB	= ${CC} ${CFLAGS} -shared -Wl,-soname,`basename $@ .${REL_VERSION}`.${ABI_VERSION},-stats,-lc -o $@

NCURSES_MAJOR	= 5
NCURSES_MINOR	= 7
REL_VERSION	= 5.7
ABI_VERSION	= 5

RANLIB		= :

LIBRARIES	=  ../lib/libmenu.la

LINT		= 
LINT_OPTS	= 
LINT_LIBS	= -lmenu -lncurses -lc -lm

AUTO_SRC	= \
		../include/menu.h \
		../include/eti.h \
		../include/mf_common.h

################################################################################
all \
libs \
install ::	$(AUTO_SRC) $(LIBRARIES)

sources :	$(AUTO_SRC)

$(DESTDIR)$(bindir) \
$(DESTDIR)$(libdir) :
	sh $(srcdir)/../mkdirs.sh $@

# make copies to simplify include-paths while still keeping menu's include
# file in this directory.
../include/menu.h : $(srcdir)/menu.h
	-rm -f $@
	cp $(srcdir)/menu.h $@
../include/eti.h : $(srcdir)/eti.h
	-rm -f $@
	cp $(srcdir)/eti.h $@
../include/mf_common.h : $(srcdir)/mf_common.h
	-rm -f $@
	cp $(srcdir)/mf_common.h $@

MENU_PRIV_H = \
	$(srcdir)/menu.priv.h \
	$(AUTO_SRC) \
	../include/curses.h

tags:
	ctags *.[ch]

#TAGS:
#	etags *.[ch]

mostlyclean ::
	-rm -f core tags TAGS *~ *.bak *.i *.ln *.atac trace

clean :: mostlyclean
	-rm -f $(AUTO_SRC)

distclean :: clean
	-rm -f Makefile

realclean :: distclean

###############################################################################
# The remainder of this file is automatically generated during configuration
###############################################################################

# generated by mk-0th.awk
#   libname:    menu
#   subsets:    ticlib+termlib+ext_tinfo+base+ext_funcs

.SUFFIXES: .c .cc .h .i .ii
.c.i :
	$(CPP) $(CPPFLAGS) $< >$@
.cc.ii :
	$(CPP) $(CPPFLAGS) $< >$@
.h.i :
	$(CPP) $(CPPFLAGS) $< >$@

C_SRC = \
	$(srcdir)/m_attribs.c \
	$(srcdir)/m_cursor.c \
	$(srcdir)/m_driver.c \
	$(srcdir)/m_format.c \
	$(srcdir)/m_global.c \
	$(srcdir)/m_hook.c \
	$(srcdir)/m_item_cur.c \
	$(srcdir)/m_item_nam.c \
	$(srcdir)/m_item_new.c \
	$(srcdir)/m_item_opt.c \
	$(srcdir)/m_item_top.c \
	$(srcdir)/m_item_use.c \
	$(srcdir)/m_item_val.c \
	$(srcdir)/m_item_vis.c \
	$(srcdir)/m_items.c \
	$(srcdir)/m_new.c \
	$(srcdir)/m_opts.c \
	$(srcdir)/m_pad.c \
	$(srcdir)/m_pattern.c \
	$(srcdir)/m_post.c \
	$(srcdir)/m_req_name.c \
	$(srcdir)/m_scale.c \
	$(srcdir)/m_spacing.c \
	$(srcdir)/m_sub.c \
	$(srcdir)/m_trace.c \
	$(srcdir)/m_userptr.c \
	$(srcdir)/m_win.c

# Producing llib-lmenu is time-consuming, so there's no direct-dependency for
# it in the lintlib rule.  We'll only remove in the cleanest setup.
clean ::
	rm -f llib-lmenu.*

realclean ::
	rm -f llib-lmenu

llib-lmenu : $(C_SRC)
	cproto -a -l -DNCURSES_ENABLE_STDBOOL_H=0 -DLINT $(CPPFLAGS) $(C_SRC) >$@

lintlib :
	sh $(srcdir)/../misc/makellib menu $(CPPFLAGS)
lint :
	$(LINT) $(LINT_OPTS) $(CPPFLAGS) $(C_SRC) $(LINT_LIBS)

# generated by mk-1st.awk (subset=ticlib+termlib+ext_tinfo+base+ext_funcs)
#  name:          menu
#  traces:        DEBUG
#  MODEL:         LIBTOOL
#  model:         obj_lo
#  prefix:        lib
#  suffix:        .la
#  subset:        ticlib+termlib+ext_tinfo+base+ext_funcs
#  ShlibVer:      rel
#  ShlibVerInfix: no
#  TermlibRoot:   ncurses
#  TermlibSuffix: .la
#  ReLink:        
#  DoLinks:       yes
#  rmSoLocs:      no
#  ldconfig:      /sbin/ldconfig
#  overwrite:     no
#  depend:        ../include/ncurses_cfg.h ./menu.priv.h
#  host:          x86_64-unknown-linux-gnu

LIBTOOL_OBJS = \
	../obj_lo/m_attribs$o \
	../obj_lo/m_cursor$o \
	../obj_lo/m_driver$o \
	../obj_lo/m_format$o \
	../obj_lo/m_global$o \
	../obj_lo/m_hook$o \
	../obj_lo/m_item_cur$o \
	../obj_lo/m_item_nam$o \
	../obj_lo/m_item_new$o \
	../obj_lo/m_item_opt$o \
	../obj_lo/m_item_top$o \
	../obj_lo/m_item_use$o \
	../obj_lo/m_item_val$o \
	../obj_lo/m_item_vis$o \
	../obj_lo/m_items$o \
	../obj_lo/m_new$o \
	../obj_lo/m_opts$o \
	../obj_lo/m_pad$o \
	../obj_lo/m_pattern$o \
	../obj_lo/m_post$o \
	../obj_lo/m_req_name$o \
	../obj_lo/m_scale$o \
	../obj_lo/m_spacing$o \
	../obj_lo/m_sub$o \
	../obj_lo/m_userptr$o \
	../obj_lo/m_win$o

$(LIBTOOL_OBJS) : ../include/ncurses_cfg.h ./menu.priv.h

../lib/libmenu.la : $(LIBTOOL_OBJS)
	cd ../lib && $(LIBTOOL_LINK) $(CC) -o libmenu.la $(LIBTOOL_OBJS:$o=.lo) -rpath $(DESTDIR)$(libdir) -version-info $(NCURSES_MAJOR):$(NCURSES_MINOR) $(SHLIB_LIST)

install \
install.libs \
install.menu :: $(DESTDIR)$(libdir) ../lib/libmenu.la
	@echo installing ../lib/libmenu.la as $(DESTDIR)$(libdir)/libmenu.la
	cd ../lib; $(LIBTOOL_INSTALL) $(INSTALL) libmenu.la $(DESTDIR)$(libdir)

uninstall \
uninstall.libs \
uninstall.menu ::
	@echo uninstalling $(DESTDIR)$(libdir)/libmenu.la
	-@$(LIBTOOL_UNINSTALL) rm -f $(DESTDIR)$(libdir)/libmenu.la

clean ::
	-rm -f ../lib/libmenu.la
	-rm -f ../lib/
	-rm -f ../lib/libmenu.la

mostlyclean::
	-rm -f $(LIBTOOL_OBJS)
	-$(LIBTOOL_CLEAN) rm -f $(LIBTOOL_OBJS:$o=.lo)

# generated by mk-2nd.awk
#   model:      obj_lo
#   MODEL:      LIBTOOL
#   echo:       yes
#   subset:     ticlib+termlib+ext_tinfo+base+ext_funcs
#   crenames:   yes
#   cxxrenames: yes
#   traces:     DEBUG
#   srcdir:     .

../obj_lo/m_attribs$o :	$(srcdir)/m_attribs.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_attribs.c -o ../obj_lo/m_attribs$o

../obj_lo/m_cursor$o :	$(srcdir)/m_cursor.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_cursor.c -o ../obj_lo/m_cursor$o

../obj_lo/m_driver$o :	$(srcdir)/m_driver.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_driver.c -o ../obj_lo/m_driver$o

../obj_lo/m_format$o :	$(srcdir)/m_format.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_format.c -o ../obj_lo/m_format$o

../obj_lo/m_global$o :	$(srcdir)/m_global.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_global.c -o ../obj_lo/m_global$o

../obj_lo/m_hook$o :	$(srcdir)/m_hook.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_hook.c -o ../obj_lo/m_hook$o

../obj_lo/m_item_cur$o :	$(srcdir)/m_item_cur.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_item_cur.c -o ../obj_lo/m_item_cur$o

../obj_lo/m_item_nam$o :	$(srcdir)/m_item_nam.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_item_nam.c -o ../obj_lo/m_item_nam$o

../obj_lo/m_item_new$o :	$(srcdir)/m_item_new.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_item_new.c -o ../obj_lo/m_item_new$o

../obj_lo/m_item_opt$o :	$(srcdir)/m_item_opt.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_item_opt.c -o ../obj_lo/m_item_opt$o

../obj_lo/m_item_top$o :	$(srcdir)/m_item_top.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_item_top.c -o ../obj_lo/m_item_top$o

../obj_lo/m_item_use$o :	$(srcdir)/m_item_use.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_item_use.c -o ../obj_lo/m_item_use$o

../obj_lo/m_item_val$o :	$(srcdir)/m_item_val.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_item_val.c -o ../obj_lo/m_item_val$o

../obj_lo/m_item_vis$o :	$(srcdir)/m_item_vis.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_item_vis.c -o ../obj_lo/m_item_vis$o

../obj_lo/m_items$o :	$(srcdir)/m_items.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_items.c -o ../obj_lo/m_items$o

../obj_lo/m_new$o :	$(srcdir)/m_new.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_new.c -o ../obj_lo/m_new$o

../obj_lo/m_opts$o :	$(srcdir)/m_opts.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_opts.c -o ../obj_lo/m_opts$o

../obj_lo/m_pad$o :	$(srcdir)/m_pad.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_pad.c -o ../obj_lo/m_pad$o

../obj_lo/m_pattern$o :	$(srcdir)/m_pattern.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_pattern.c -o ../obj_lo/m_pattern$o

../obj_lo/m_post$o :	$(srcdir)/m_post.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_post.c -o ../obj_lo/m_post$o

../obj_lo/m_req_name$o :	$(srcdir)/m_req_name.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_req_name.c -o ../obj_lo/m_req_name$o

../obj_lo/m_scale$o :	$(srcdir)/m_scale.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_scale.c -o ../obj_lo/m_scale$o

../obj_lo/m_spacing$o :	$(srcdir)/m_spacing.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_spacing.c -o ../obj_lo/m_spacing$o

../obj_lo/m_sub$o :	$(srcdir)/m_sub.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_sub.c -o ../obj_lo/m_sub$o

../obj_lo/m_userptr$o :	$(srcdir)/m_userptr.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_userptr.c -o ../obj_lo/m_userptr$o

../obj_lo/m_win$o :	$(srcdir)/m_win.c \
			$(MENU_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../menu/m_win.c -o ../obj_lo/m_win$o


# generated by mk-hdr.awk
#  subset:     ticlib+termlib+ext_tinfo+base+ext_funcs
#  compat:     yes

${DESTDIR}${includedir} :
	sh ${srcdir}/../mkdirs.sh $@

install \
install.libs \
install.includes :: ${AUTO_SRC} ${DESTDIR}${includedir} \
		$(srcdir)/eti.h \
		$(srcdir)/menu.h
	@ (cd ${DESTDIR}${includedir} && rm -f eti.h) ; ../headers.sh ${INSTALL_DATA} ${DESTDIR}${includedir} ${srcdir} $(srcdir)/eti.h
	@ (cd ${DESTDIR}${includedir} && rm -f menu.h) ; ../headers.sh ${INSTALL_DATA} ${DESTDIR}${includedir} ${srcdir} $(srcdir)/menu.h

uninstall \
uninstall.libs \
uninstall.includes ::
	-@ (cd ${DESTDIR}${includedir} && rm -f eti.h)
	-@ (cd ${DESTDIR}${includedir} && rm -f menu.h)
depend : ${AUTO_SRC}
	makedepend -- ${CPPFLAGS} -- ${C_SRC}

# DO NOT DELETE THIS LINE -- make depend depends on it.
