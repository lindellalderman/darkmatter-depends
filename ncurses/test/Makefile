# $Id: Makefile.in,v 1.102 2008/09/07 13:58:29 tom Exp $
##############################################################################
# Copyright (c) 1998-2007,2008 Free Software Foundation, Inc.                #
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
# Makefile for ncurses tests.

# turn off _all_ suffix rules; we'll generate our own
.SUFFIXES:

SHELL		= /bin/sh



destdir		=
x		= 
o		= .lo

MODEL		= ../obj_lo
srcdir		= .
prefix		= /usr/local/lib64/darkmatter
exec_prefix	= ${prefix}
libdir		= ${exec_prefix}/lib
includedir	= ${prefix}/include/ncurses

LIBTOOL		= /root/darkmatter-depends/.build/usr/local/lib64/darkmatter/bin/libtool --tag=CC
LIBTOOL_CLEAN	= ${LIBTOOL} --mode=clean
LIBTOOL_COMPILE	= ${LIBTOOL} --mode=compile
LIBTOOL_LINK	= ${LIBTOOL} --mode=link ${CC} ${LIBTOOL_OPTS}

CC		= cc
CPP		= cc -E

CFLAGS		= -fpic -fPIC -fpic -fPIC  --param max-inline-insns-single=1200 
CPPFLAGS	=  -I../test -I$(srcdir) -DHAVE_CONFIG_H -I. -I../include -I/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/include -I/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/include/ncurses -I/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/include/libxml2 -D_GNU_SOURCE -DNDEBUG -I${includedir}

CCFLAGS		= $(CPPFLAGS) $(CFLAGS)

CFLAGS_LIBTOOL	= $(CCFLAGS)
CFLAGS_NORMAL	= $(CCFLAGS)
CFLAGS_DEBUG	= $(CCFLAGS) -g -DTRACE
CFLAGS_PROFILE	= $(CCFLAGS) -pg
CFLAGS_SHARED	= $(CCFLAGS) -fPIC

CFLAGS_DEFAULT	= $(CFLAGS_LIBTOOL)

REL_VERSION	= 5.7
ABI_VERSION	= 5
LOCAL_LIBDIR	= /root/darkmatter-depends/ncurses/lib
LOCAL_LIBS	= ../lib/libform.la ../lib/libmenu.la ../lib/libpanel.la ../lib/libncurses.la 
MATH_LIB	= 
TEST_LIBS	= -lutil 

LD		= ld
LINK		=  $(LIBTOOL_LINK) $(CFLAGS)

LDFLAGS		=   -L/lib64 -L/usr/lib64 -L/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/lib  -Wl,-rpath -Wl,/usr/local/lib64/darkmatter/lib -L/lib64 -L/usr/lib64 -L/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/lib  -Wl,-rpath -Wl,/usr/local/lib64/darkmatter/lib -lc -lm

LDFLAGS_LIBTOOL	= $(LDFLAGS) $(CFLAGS_LIBTOOL)
LDFLAGS_NORMAL	= $(LDFLAGS) $(CFLAGS_NORMAL)
LDFLAGS_DEBUG	= $(LDFLAGS) $(CFLAGS_DEBUG)
LDFLAGS_PROFILE	= $(LDFLAGS) $(CFLAGS_PROFILE)
LDFLAGS_SHARED	= $(LDFLAGS) $(CFLAGS_SHARED) 

TEST_ARGS	=  -L../lib ../lib/libform.la ../lib/libmenu.la ../lib/libpanel.la ../lib/libncurses.la   

# use these for linking with all of the libraries
LIBS_DEFAULT	= $(TEST_ARGS) -lc -lm $(TEST_LIBS) $(MATH_LIB)
LDFLAGS_DEFAULT	= $(LDFLAGS_LIBTOOL) $(LIBS_DEFAULT)

# use these for linking with the (n)curses library and possibly pthreads
LIBS_THREADS	= `echo "$(TEST_ARGS) -lc -lm" | sed -e 's/-lform.*-lpanel[^ ]*//'` $(TEST_LIBS) $(MATH_LIB) 
LDFLAGS_THREADS	= $(LDFLAGS_LIBTOOL) $(LIBS_THREADS)

# use these for linking with the (n)curses library
LIBS_CURSES	= `echo "$(TEST_ARGS) -lc -lm" | sed -e 's/-lform.*-lpanel[^ ]*//'` $(TEST_LIBS) $(MATH_LIB)
LDFLAGS_CURSES	= $(LDFLAGS_LIBTOOL) $(LIBS_CURSES)

# use these for linking with the tinfo library if we have it, or curses library if not
LIBS_TINFO	=  -L../lib -lncurses  -lc -lm $(TEST_LIBS) $(MATH_LIB)
LDFLAGS_TINFO	= $(LDFLAGS_LIBTOOL) $(LIBS_TINFO)

LINT		= 
LINT_OPTS	= 
LINT_LIBS	= -lform -lmenu -lpanel -lncurses -lc -lm

HEADER_DEPS	= \
	../include/curses.h \
	../include/term.h

# The rest is generated from the "programs" and "modules" files...
# generated by mk-test.awk

TESTS	= $(destdir)background$x \
	  $(destdir)blue$x \
	  $(destdir)bs$x \
	  $(destdir)cardfile$x \
	  $(destdir)chgat$x \
	  $(destdir)color_set$x \
	  $(destdir)demo_altkeys$x \
	  $(destdir)demo_defkey$x \
	  $(destdir)demo_forms$x \
	  $(destdir)demo_keyok$x \
	  $(destdir)demo_menus$x \
	  $(destdir)demo_panels$x \
	  $(destdir)demo_termcap$x \
	  $(destdir)ditto$x \
	  $(destdir)dots$x \
	  $(destdir)dots_mvcur$x \
	  $(destdir)echochar$x \
	  $(destdir)filter$x \
	  $(destdir)firework$x \
	  $(destdir)firstlast$x \
	  $(destdir)foldkeys$x \
	  $(destdir)gdc$x \
	  $(destdir)hanoi$x \
	  $(destdir)hashtest$x \
	  $(destdir)inch_wide$x \
	  $(destdir)inchs$x \
	  $(destdir)ins_wide$x \
	  $(destdir)inserts$x \
	  $(destdir)key_names$x \
	  $(destdir)keynames$x \
	  $(destdir)knight$x \
	  $(destdir)lrtest$x \
	  $(destdir)movewindow$x \
	  $(destdir)ncurses$x \
	  $(destdir)newdemo$x \
	  $(destdir)railroad$x \
	  $(destdir)rain$x \
	  $(destdir)redraw$x \
	  $(destdir)savescreen$x \
	  $(destdir)tclock$x \
	  $(destdir)test_arrays$x \
	  $(destdir)test_get_wstr$x \
	  $(destdir)test_getstr$x \
	  $(destdir)test_instr$x \
	  $(destdir)test_inwstr$x \
	  $(destdir)test_opaque$x \
	  $(destdir)testaddch$x \
	  $(destdir)testcurs$x \
	  $(destdir)testscanw$x \
	  $(destdir)view$x \
	  $(destdir)worm$x \
	  $(destdir)xmas$x

all: $(TESTS)

sources:

tags:
	ctags *.[ch]

libs \
install \
install.libs \
install.test:

uninstall:
uninstall.libs:
uninstall.test:

mostlyclean ::
	-rm -f core tags TAGS *~ *.bak *.i *.ln *.atac trace

clean :: mostlyclean
	-sh -c "if test -n '$x' ; then $(MAKE) clean x=''; fi"
	-rm -rf *$o screendump *.lis $(TESTS) .libs

distclean :: clean
	-rm -f Makefile ncurses_cfg.h config.*

realclean :: distclean

lint:
	sh -c 'for N in $(TESTS); do echo LINT:$$N; $(LINT) $(LINT_OPTS) $(CPPFLAGS) $(srcdir)/$$N.c $(LINT_LIBS); done'

$(destdir)background$x: $(MODEL)/background$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/background$o $(LDFLAGS_CURSES)

$(destdir)blue$x: $(MODEL)/blue$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/blue$o $(LDFLAGS_CURSES)

$(destdir)bs$x: $(MODEL)/bs$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/bs$o $(LDFLAGS_CURSES)

$(destdir)cardfile$x: $(MODEL)/cardfile$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/cardfile$o $(LDFLAGS_DEFAULT)

$(destdir)chgat$x: $(MODEL)/chgat$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/chgat$o $(LDFLAGS_CURSES)

$(destdir)color_set$x: $(MODEL)/color_set$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/color_set$o $(LDFLAGS_CURSES)

$(destdir)demo_altkeys$x: $(MODEL)/demo_altkeys$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/demo_altkeys$o $(LDFLAGS_CURSES)

$(destdir)demo_defkey$x: $(MODEL)/demo_defkey$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/demo_defkey$o $(LDFLAGS_CURSES)

$(destdir)demo_forms$x: $(MODEL)/demo_forms$o $(MODEL)/edit_field$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/demo_forms$o $(MODEL)/edit_field$o $(LDFLAGS_DEFAULT)

$(destdir)demo_keyok$x: $(MODEL)/demo_keyok$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/demo_keyok$o $(LDFLAGS_CURSES)

$(destdir)demo_menus$x: $(MODEL)/demo_menus$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/demo_menus$o $(LDFLAGS_DEFAULT)

$(destdir)demo_panels$x: $(MODEL)/demo_panels$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/demo_panels$o $(LDFLAGS_DEFAULT)

$(destdir)demo_termcap$x: $(MODEL)/demo_termcap$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/demo_termcap$o $(LDFLAGS_TINFO)

$(destdir)ditto$x: $(MODEL)/ditto$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/ditto$o $(LDFLAGS_THREADS)

$(destdir)dots$x: $(MODEL)/dots$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/dots$o $(LDFLAGS_TINFO)

$(destdir)dots_mvcur$x: $(MODEL)/dots_mvcur$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/dots_mvcur$o $(LDFLAGS_CURSES)

$(destdir)echochar$x: $(MODEL)/echochar$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/echochar$o $(LDFLAGS_CURSES)

$(destdir)filter$x: $(MODEL)/filter$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/filter$o $(LDFLAGS_CURSES)

$(destdir)firework$x: $(MODEL)/firework$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/firework$o $(LDFLAGS_CURSES)

$(destdir)firstlast$x: $(MODEL)/firstlast$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/firstlast$o $(LDFLAGS_DEFAULT)

$(destdir)foldkeys$x: $(MODEL)/foldkeys$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/foldkeys$o $(LDFLAGS_CURSES)

$(destdir)gdc$x: $(MODEL)/gdc$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/gdc$o $(LDFLAGS_CURSES)

$(destdir)hanoi$x: $(MODEL)/hanoi$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/hanoi$o $(LDFLAGS_CURSES)

$(destdir)hashtest$x: $(MODEL)/hashtest$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/hashtest$o $(LDFLAGS_CURSES)

$(destdir)inch_wide$x: $(MODEL)/inch_wide$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/inch_wide$o $(LDFLAGS_CURSES)

$(destdir)inchs$x: $(MODEL)/inchs$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/inchs$o $(LDFLAGS_CURSES)

$(destdir)ins_wide$x: $(MODEL)/ins_wide$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/ins_wide$o $(LDFLAGS_CURSES)

$(destdir)inserts$x: $(MODEL)/inserts$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/inserts$o $(LDFLAGS_CURSES)

$(destdir)key_names$x: $(MODEL)/key_names$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/key_names$o $(LDFLAGS_CURSES)

$(destdir)keynames$x: $(MODEL)/keynames$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/keynames$o $(LDFLAGS_CURSES)

$(destdir)knight$x: $(MODEL)/knight$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/knight$o $(LDFLAGS_CURSES)

$(destdir)lrtest$x: $(MODEL)/lrtest$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/lrtest$o $(LDFLAGS_CURSES)

$(destdir)movewindow$x: $(MODEL)/movewindow$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/movewindow$o $(LDFLAGS_CURSES)

$(destdir)ncurses$x: $(MODEL)/ncurses$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/ncurses$o $(LDFLAGS_DEFAULT)

$(destdir)newdemo$x: $(MODEL)/newdemo$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/newdemo$o $(LDFLAGS_CURSES)

$(destdir)railroad$x: $(MODEL)/railroad$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/railroad$o $(LDFLAGS_TINFO)

$(destdir)rain$x: $(MODEL)/rain$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/rain$o $(LDFLAGS_THREADS)

$(destdir)redraw$x: $(MODEL)/redraw$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/redraw$o $(LDFLAGS_CURSES)

$(destdir)savescreen$x: $(MODEL)/savescreen$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/savescreen$o $(LDFLAGS_CURSES)

$(destdir)tclock$x: $(MODEL)/tclock$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/tclock$o $(LDFLAGS_CURSES)

$(destdir)test_arrays$x: $(MODEL)/test_arrays$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/test_arrays$o $(LDFLAGS_TINFO)

$(destdir)test_get_wstr$x: $(MODEL)/test_get_wstr$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/test_get_wstr$o $(LDFLAGS_CURSES)

$(destdir)test_getstr$x: $(MODEL)/test_getstr$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/test_getstr$o $(LDFLAGS_CURSES)

$(destdir)test_instr$x: $(MODEL)/test_instr$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/test_instr$o $(LDFLAGS_CURSES)

$(destdir)test_inwstr$x: $(MODEL)/test_inwstr$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/test_inwstr$o $(LDFLAGS_CURSES)

$(destdir)test_opaque$x: $(MODEL)/test_opaque$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/test_opaque$o $(LDFLAGS_CURSES)

$(destdir)testaddch$x: $(MODEL)/testaddch$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/testaddch$o $(LDFLAGS_CURSES)

$(destdir)testcurs$x: $(MODEL)/testcurs$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/testcurs$o $(LDFLAGS_CURSES)

$(destdir)testscanw$x: $(MODEL)/testscanw$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/testscanw$o $(LDFLAGS_CURSES)

$(destdir)view$x: $(MODEL)/view$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/view$o $(LDFLAGS_CURSES)

$(destdir)worm$x: $(MODEL)/worm$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/worm$o $(LDFLAGS_THREADS)

$(destdir)xmas$x: $(MODEL)/xmas$o $(LOCAL_LIBS)
	$(LINK) -o $@ $(MODEL)/xmas$o $(LDFLAGS_CURSES)

# generated by mk-0th.awk
#   libname:    test
#   subsets:    ticlib+termlib+ext_tinfo+base+ext_funcs

.SUFFIXES: .c .cc .h .i .ii
.c.i :
	$(CPP) $(CPPFLAGS) $< >$@
.cc.ii :
	$(CPP) $(CPPFLAGS) $< >$@
.h.i :
	$(CPP) $(CPPFLAGS) $< >$@

C_SRC = \
	$(srcdir)/background.c \
	$(srcdir)/blue.c \
	$(srcdir)/bs.c \
	$(srcdir)/cardfile.c \
	$(srcdir)/chgat.c \
	$(srcdir)/color_set.c \
	$(srcdir)/demo_altkeys.c \
	$(srcdir)/demo_defkey.c \
	$(srcdir)/demo_forms.c \
	$(srcdir)/demo_keyok.c \
	$(srcdir)/demo_menus.c \
	$(srcdir)/demo_panels.c \
	$(srcdir)/demo_termcap.c \
	$(srcdir)/ditto.c \
	$(srcdir)/dots.c \
	$(srcdir)/dots_mvcur.c \
	$(srcdir)/echochar.c \
	$(srcdir)/edit_field.c \
	$(srcdir)/filter.c \
	$(srcdir)/firework.c \
	$(srcdir)/firstlast.c \
	$(srcdir)/foldkeys.c \
	$(srcdir)/gdc.c \
	$(srcdir)/hanoi.c \
	$(srcdir)/hashtest.c \
	$(srcdir)/inch_wide.c \
	$(srcdir)/inchs.c \
	$(srcdir)/ins_wide.c \
	$(srcdir)/inserts.c \
	$(srcdir)/key_names.c \
	$(srcdir)/keynames.c \
	$(srcdir)/knight.c \
	$(srcdir)/lrtest.c \
	$(srcdir)/movewindow.c \
	$(srcdir)/ncurses.c \
	$(srcdir)/newdemo.c \
	$(srcdir)/railroad.c \
	$(srcdir)/rain.c \
	$(srcdir)/redraw.c \
	$(srcdir)/savescreen.c \
	$(srcdir)/tclock.c \
	$(srcdir)/test_arrays.c \
	$(srcdir)/test_get_wstr.c \
	$(srcdir)/test_getstr.c \
	$(srcdir)/test_instr.c \
	$(srcdir)/test_inwstr.c \
	$(srcdir)/test_opaque.c \
	$(srcdir)/testaddch.c \
	$(srcdir)/testcurs.c \
	$(srcdir)/testscanw.c \
	$(srcdir)/view.c \
	$(srcdir)/worm.c \
	$(srcdir)/xmas.c

lintlib :
	@echo no action needed

# generated by mk-1st.awk (subset=ticlib+termlib+ext_tinfo+base+ext_funcs)
#  name:          test
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
#  depend:        ../include/ncurses_cfg.h ./test.priv.h
#  host:          x86_64-unknown-linux-gnu

LIBTOOL_OBJS = \
	../obj_lo/background$o \
	../obj_lo/blue$o \
	../obj_lo/bs$o \
	../obj_lo/cardfile$o \
	../obj_lo/chgat$o \
	../obj_lo/color_set$o \
	../obj_lo/demo_altkeys$o \
	../obj_lo/demo_defkey$o \
	../obj_lo/demo_forms$o \
	../obj_lo/demo_keyok$o \
	../obj_lo/demo_menus$o \
	../obj_lo/demo_panels$o \
	../obj_lo/demo_termcap$o \
	../obj_lo/ditto$o \
	../obj_lo/dots$o \
	../obj_lo/dots_mvcur$o \
	../obj_lo/echochar$o \
	../obj_lo/edit_field$o \
	../obj_lo/filter$o \
	../obj_lo/firework$o \
	../obj_lo/firstlast$o \
	../obj_lo/foldkeys$o \
	../obj_lo/gdc$o \
	../obj_lo/hanoi$o \
	../obj_lo/hashtest$o \
	../obj_lo/inch_wide$o \
	../obj_lo/inchs$o \
	../obj_lo/ins_wide$o \
	../obj_lo/inserts$o \
	../obj_lo/key_names$o \
	../obj_lo/keynames$o \
	../obj_lo/knight$o \
	../obj_lo/lrtest$o \
	../obj_lo/movewindow$o \
	../obj_lo/ncurses$o \
	../obj_lo/newdemo$o \
	../obj_lo/railroad$o \
	../obj_lo/rain$o \
	../obj_lo/redraw$o \
	../obj_lo/savescreen$o \
	../obj_lo/tclock$o \
	../obj_lo/test_arrays$o \
	../obj_lo/test_get_wstr$o \
	../obj_lo/test_getstr$o \
	../obj_lo/test_instr$o \
	../obj_lo/test_inwstr$o \
	../obj_lo/test_opaque$o \
	../obj_lo/testaddch$o \
	../obj_lo/testcurs$o \
	../obj_lo/testscanw$o \
	../obj_lo/view$o \
	../obj_lo/worm$o \
	../obj_lo/xmas$o

$(LIBTOOL_OBJS) : ../include/ncurses_cfg.h ./test.priv.h

mostlyclean::
	-rm -f $(LIBTOOL_OBJS)
	-$(LIBTOOL_CLEAN) rm -f $(LIBTOOL_OBJS:$o=.lo)

clean ::
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

../obj_lo/background$o :	$(srcdir)/background.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/background.c -o ../obj_lo/background$o

../obj_lo/blue$o :	$(srcdir)/blue.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/blue.c -o ../obj_lo/blue$o

../obj_lo/bs$o :	$(srcdir)/bs.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/bs.c -o ../obj_lo/bs$o

../obj_lo/cardfile$o :	$(srcdir)/cardfile.c \
			$(HEADER_DEPS) \
			../include/panel.h \
			../include/form.h
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/cardfile.c -o ../obj_lo/cardfile$o

../obj_lo/chgat$o :	$(srcdir)/chgat.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/chgat.c -o ../obj_lo/chgat$o

../obj_lo/color_set$o :	$(srcdir)/color_set.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/color_set.c -o ../obj_lo/color_set$o

../obj_lo/demo_altkeys$o :	$(srcdir)/demo_altkeys.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/demo_altkeys.c -o ../obj_lo/demo_altkeys$o

../obj_lo/demo_defkey$o :	$(srcdir)/demo_defkey.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/demo_defkey.c -o ../obj_lo/demo_defkey$o

../obj_lo/demo_forms$o :	$(srcdir)/demo_forms.c \
			$(HEADER_DEPS) \
			../include/form.h \
			$(srcdir)/edit_field.h
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/demo_forms.c -o ../obj_lo/demo_forms$o

../obj_lo/demo_keyok$o :	$(srcdir)/demo_keyok.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/demo_keyok.c -o ../obj_lo/demo_keyok$o

../obj_lo/demo_menus$o :	$(srcdir)/demo_menus.c \
			$(HEADER_DEPS) \
			../include/menu.h
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/demo_menus.c -o ../obj_lo/demo_menus$o

../obj_lo/demo_panels$o :	$(srcdir)/demo_panels.c \
			$(HEADER_DEPS) \
			../include/panel.h
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/demo_panels.c -o ../obj_lo/demo_panels$o

../obj_lo/demo_termcap$o :	$(srcdir)/demo_termcap.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/demo_termcap.c -o ../obj_lo/demo_termcap$o

../obj_lo/ditto$o :	$(srcdir)/ditto.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/ditto.c -o ../obj_lo/ditto$o

../obj_lo/dots$o :	$(srcdir)/dots.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/dots.c -o ../obj_lo/dots$o

../obj_lo/dots_mvcur$o :	$(srcdir)/dots_mvcur.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/dots_mvcur.c -o ../obj_lo/dots_mvcur$o

../obj_lo/echochar$o :	$(srcdir)/echochar.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/echochar.c -o ../obj_lo/echochar$o

../obj_lo/edit_field$o :	$(srcdir)/edit_field.c \
			$(HEADER_DEPS) \
			$(srcdir)/edit_field.h
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/edit_field.c -o ../obj_lo/edit_field$o

../obj_lo/filter$o :	$(srcdir)/filter.c \
			$(HEADER_DEPS) \
			../include/form.h
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/filter.c -o ../obj_lo/filter$o

../obj_lo/firework$o :	$(srcdir)/firework.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/firework.c -o ../obj_lo/firework$o

../obj_lo/firstlast$o :	$(srcdir)/firstlast.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/firstlast.c -o ../obj_lo/firstlast$o

../obj_lo/foldkeys$o :	$(srcdir)/foldkeys.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/foldkeys.c -o ../obj_lo/foldkeys$o

../obj_lo/gdc$o :	$(srcdir)/gdc.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/gdc.c -o ../obj_lo/gdc$o

../obj_lo/hanoi$o :	$(srcdir)/hanoi.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/hanoi.c -o ../obj_lo/hanoi$o

../obj_lo/hashtest$o :	$(srcdir)/hashtest.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/hashtest.c -o ../obj_lo/hashtest$o

../obj_lo/inch_wide$o :	$(srcdir)/inch_wide.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/inch_wide.c -o ../obj_lo/inch_wide$o

../obj_lo/inchs$o :	$(srcdir)/inchs.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/inchs.c -o ../obj_lo/inchs$o

../obj_lo/ins_wide$o :	$(srcdir)/ins_wide.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/ins_wide.c -o ../obj_lo/ins_wide$o

../obj_lo/inserts$o :	$(srcdir)/inserts.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/inserts.c -o ../obj_lo/inserts$o

../obj_lo/key_names$o :	$(srcdir)/key_names.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/key_names.c -o ../obj_lo/key_names$o

../obj_lo/keynames$o :	$(srcdir)/keynames.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/keynames.c -o ../obj_lo/keynames$o

../obj_lo/knight$o :	$(srcdir)/knight.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/knight.c -o ../obj_lo/knight$o

../obj_lo/lrtest$o :	$(srcdir)/lrtest.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/lrtest.c -o ../obj_lo/lrtest$o

../obj_lo/movewindow$o :	$(srcdir)/movewindow.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/movewindow.c -o ../obj_lo/movewindow$o

../obj_lo/ncurses$o :	$(srcdir)/ncurses.c \
			$(HEADER_DEPS) \
			../include/panel.h \
			../include/menu.h \
			../include/form.h
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/ncurses.c -o ../obj_lo/ncurses$o

../obj_lo/newdemo$o :	$(srcdir)/newdemo.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/newdemo.c -o ../obj_lo/newdemo$o

../obj_lo/railroad$o :	$(srcdir)/railroad.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/railroad.c -o ../obj_lo/railroad$o

../obj_lo/rain$o :	$(srcdir)/rain.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/rain.c -o ../obj_lo/rain$o

../obj_lo/redraw$o :	$(srcdir)/redraw.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/redraw.c -o ../obj_lo/redraw$o

../obj_lo/savescreen$o :	$(srcdir)/savescreen.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/savescreen.c -o ../obj_lo/savescreen$o

../obj_lo/tclock$o :	$(srcdir)/tclock.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/tclock.c -o ../obj_lo/tclock$o

../obj_lo/test_arrays$o :	$(srcdir)/test_arrays.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/test_arrays.c -o ../obj_lo/test_arrays$o

../obj_lo/test_get_wstr$o :	$(srcdir)/test_get_wstr.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/test_get_wstr.c -o ../obj_lo/test_get_wstr$o

../obj_lo/test_getstr$o :	$(srcdir)/test_getstr.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/test_getstr.c -o ../obj_lo/test_getstr$o

../obj_lo/test_instr$o :	$(srcdir)/test_instr.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/test_instr.c -o ../obj_lo/test_instr$o

../obj_lo/test_inwstr$o :	$(srcdir)/test_inwstr.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/test_inwstr.c -o ../obj_lo/test_inwstr$o

../obj_lo/test_opaque$o :	$(srcdir)/test_opaque.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/test_opaque.c -o ../obj_lo/test_opaque$o

../obj_lo/testaddch$o :	$(srcdir)/testaddch.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/testaddch.c -o ../obj_lo/testaddch$o

../obj_lo/testcurs$o :	$(srcdir)/testcurs.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/testcurs.c -o ../obj_lo/testcurs$o

../obj_lo/testscanw$o :	$(srcdir)/testscanw.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/testscanw.c -o ../obj_lo/testscanw$o

../obj_lo/view$o :	$(srcdir)/view.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/view.c -o ../obj_lo/view$o

../obj_lo/worm$o :	$(srcdir)/worm.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/worm.c -o ../obj_lo/worm$o

../obj_lo/xmas$o :	$(srcdir)/xmas.c \
			$(HEADER_DEPS)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../test/xmas.c -o ../obj_lo/xmas$o

depend : ${AUTO_SRC}
	makedepend -- ${CPPFLAGS} -- ${C_SRC}

# DO NOT DELETE THIS LINE -- make depend depends on it.
