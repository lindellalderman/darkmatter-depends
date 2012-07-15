# $Id: Makefile.in,v 1.47 2007/04/28 14:56:11 tom Exp $
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
# Makefile for form source code.
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
AWK		= mawk
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
LDFLAGS		= -L/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/lib  -Wl,-rpath -Wl,/usr/local/lib64/darkmatter/lib -L/root/darkmatter-depends/.build/usr/local/lib64/darkmatter/lib  -Wl,-rpath -Wl,/usr/local/lib64/darkmatter/lib -lc -lm  -lc -lm

SHLIB_DIRS	= -L../lib
SHLIB_LIST	= $(SHLIB_DIRS) -lncurses 

MK_SHARED_LIB	= ${CC} ${CFLAGS} -shared -Wl,-soname,`basename $@ .${REL_VERSION}`.${ABI_VERSION},-stats,-lc -o $@

NCURSES_MAJOR	= 5
NCURSES_MINOR	= 7
REL_VERSION	= 5.7
ABI_VERSION	= 5

RANLIB		= :

LIBRARIES	=  ../lib/libform.la

LINT		= 
LINT_OPTS	= 
LINT_LIBS	= -lform -lncurses -lc -lm

AUTO_SRC	= \
		../include/form.h

################################################################################
all \
libs \
install ::	$(AUTO_SRC) $(LIBRARIES)

sources :	$(AUTO_SRC)

$(DESTDIR)$(bindir) \
$(DESTDIR)$(libdir) :
	sh $(srcdir)/../mkdirs.sh $@

# make copies to simplify include-paths while still keeping form's include
# file in this directory.
../include/form.h : $(srcdir)/form.h
	-rm -f $@
	cp $(srcdir)/form.h $@

FORM_PRIV_H = \
	$(srcdir)/form.priv.h \
	$(srcdir)/form.h \
	../include/mf_common.h \
	../include/curses.h \
	../include/eti.h

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

../include/mf_common.h \
../include/eti.h :
	cd ../menu && $(MAKE) $@

###############################################################################
# The remainder of this file is automatically generated during configuration
###############################################################################

# generated by mk-0th.awk
#   libname:    form
#   subsets:    ticlib+termlib+ext_tinfo+base+ext_funcs

.SUFFIXES: .c .cc .h .i .ii
.c.i :
	$(CPP) $(CPPFLAGS) $< >$@
.cc.ii :
	$(CPP) $(CPPFLAGS) $< >$@
.h.i :
	$(CPP) $(CPPFLAGS) $< >$@

C_SRC = \
	$(srcdir)/f_trace.c \
	$(srcdir)/fld_arg.c \
	$(srcdir)/fld_attr.c \
	$(srcdir)/fld_current.c \
	$(srcdir)/fld_def.c \
	$(srcdir)/fld_dup.c \
	$(srcdir)/fld_ftchoice.c \
	$(srcdir)/fld_ftlink.c \
	$(srcdir)/fld_info.c \
	$(srcdir)/fld_just.c \
	$(srcdir)/fld_link.c \
	$(srcdir)/fld_max.c \
	$(srcdir)/fld_move.c \
	$(srcdir)/fld_newftyp.c \
	$(srcdir)/fld_opts.c \
	$(srcdir)/fld_pad.c \
	$(srcdir)/fld_page.c \
	$(srcdir)/fld_stat.c \
	$(srcdir)/fld_type.c \
	$(srcdir)/fld_user.c \
	$(srcdir)/frm_cursor.c \
	$(srcdir)/frm_data.c \
	$(srcdir)/frm_def.c \
	$(srcdir)/frm_driver.c \
	$(srcdir)/frm_hook.c \
	$(srcdir)/frm_opts.c \
	$(srcdir)/frm_page.c \
	$(srcdir)/frm_post.c \
	$(srcdir)/frm_req_name.c \
	$(srcdir)/frm_scale.c \
	$(srcdir)/frm_sub.c \
	$(srcdir)/frm_user.c \
	$(srcdir)/frm_win.c \
	$(srcdir)/fty_alnum.c \
	$(srcdir)/fty_alpha.c \
	$(srcdir)/fty_enum.c \
	$(srcdir)/fty_int.c \
	$(srcdir)/fty_ipv4.c \
	$(srcdir)/fty_num.c \
	$(srcdir)/fty_regex.c

# Producing llib-lform is time-consuming, so there's no direct-dependency for
# it in the lintlib rule.  We'll only remove in the cleanest setup.
clean ::
	rm -f llib-lform.*

realclean ::
	rm -f llib-lform

llib-lform : $(C_SRC)
	cproto -a -l -DNCURSES_ENABLE_STDBOOL_H=0 -DLINT $(CPPFLAGS) $(C_SRC) >$@

lintlib :
	sh $(srcdir)/../misc/makellib form $(CPPFLAGS)
lint :
	$(LINT) $(LINT_OPTS) $(CPPFLAGS) $(C_SRC) $(LINT_LIBS)

# generated by mk-1st.awk (subset=ticlib+termlib+ext_tinfo+base+ext_funcs)
#  name:          form
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
#  depend:        ../include/ncurses_cfg.h ./form.priv.h
#  host:          x86_64-unknown-linux-gnu

LIBTOOL_OBJS = \
	../obj_lo/fld_arg$o \
	../obj_lo/fld_attr$o \
	../obj_lo/fld_current$o \
	../obj_lo/fld_def$o \
	../obj_lo/fld_dup$o \
	../obj_lo/fld_ftchoice$o \
	../obj_lo/fld_ftlink$o \
	../obj_lo/fld_info$o \
	../obj_lo/fld_just$o \
	../obj_lo/fld_link$o \
	../obj_lo/fld_max$o \
	../obj_lo/fld_move$o \
	../obj_lo/fld_newftyp$o \
	../obj_lo/fld_opts$o \
	../obj_lo/fld_pad$o \
	../obj_lo/fld_page$o \
	../obj_lo/fld_stat$o \
	../obj_lo/fld_type$o \
	../obj_lo/fld_user$o \
	../obj_lo/frm_cursor$o \
	../obj_lo/frm_data$o \
	../obj_lo/frm_def$o \
	../obj_lo/frm_driver$o \
	../obj_lo/frm_hook$o \
	../obj_lo/frm_opts$o \
	../obj_lo/frm_page$o \
	../obj_lo/frm_post$o \
	../obj_lo/frm_req_name$o \
	../obj_lo/frm_scale$o \
	../obj_lo/frm_sub$o \
	../obj_lo/frm_user$o \
	../obj_lo/frm_win$o \
	../obj_lo/fty_alnum$o \
	../obj_lo/fty_alpha$o \
	../obj_lo/fty_enum$o \
	../obj_lo/fty_int$o \
	../obj_lo/fty_ipv4$o \
	../obj_lo/fty_num$o \
	../obj_lo/fty_regex$o

$(LIBTOOL_OBJS) : ../include/ncurses_cfg.h ./form.priv.h

../lib/libform.la : $(LIBTOOL_OBJS)
	cd ../lib && $(LIBTOOL_LINK) $(CC) -o libform.la $(LIBTOOL_OBJS:$o=.lo) -rpath $(DESTDIR)$(libdir) -version-info $(NCURSES_MAJOR):$(NCURSES_MINOR) $(SHLIB_LIST)

install \
install.libs \
install.form :: $(DESTDIR)$(libdir) ../lib/libform.la
	@echo installing ../lib/libform.la as $(DESTDIR)$(libdir)/libform.la
	cd ../lib; $(LIBTOOL_INSTALL) $(INSTALL) libform.la $(DESTDIR)$(libdir)

uninstall \
uninstall.libs \
uninstall.form ::
	@echo uninstalling $(DESTDIR)$(libdir)/libform.la
	-@$(LIBTOOL_UNINSTALL) rm -f $(DESTDIR)$(libdir)/libform.la

clean ::
	-rm -f ../lib/libform.la
	-rm -f ../lib/
	-rm -f ../lib/libform.la

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

../obj_lo/fld_arg$o :	$(srcdir)/fld_arg.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_arg.c -o ../obj_lo/fld_arg$o

../obj_lo/fld_attr$o :	$(srcdir)/fld_attr.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_attr.c -o ../obj_lo/fld_attr$o

../obj_lo/fld_current$o :	$(srcdir)/fld_current.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_current.c -o ../obj_lo/fld_current$o

../obj_lo/fld_def$o :	$(srcdir)/fld_def.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_def.c -o ../obj_lo/fld_def$o

../obj_lo/fld_dup$o :	$(srcdir)/fld_dup.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_dup.c -o ../obj_lo/fld_dup$o

../obj_lo/fld_ftchoice$o :	$(srcdir)/fld_ftchoice.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_ftchoice.c -o ../obj_lo/fld_ftchoice$o

../obj_lo/fld_ftlink$o :	$(srcdir)/fld_ftlink.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_ftlink.c -o ../obj_lo/fld_ftlink$o

../obj_lo/fld_info$o :	$(srcdir)/fld_info.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_info.c -o ../obj_lo/fld_info$o

../obj_lo/fld_just$o :	$(srcdir)/fld_just.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_just.c -o ../obj_lo/fld_just$o

../obj_lo/fld_link$o :	$(srcdir)/fld_link.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_link.c -o ../obj_lo/fld_link$o

../obj_lo/fld_max$o :	$(srcdir)/fld_max.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_max.c -o ../obj_lo/fld_max$o

../obj_lo/fld_move$o :	$(srcdir)/fld_move.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_move.c -o ../obj_lo/fld_move$o

../obj_lo/fld_newftyp$o :	$(srcdir)/fld_newftyp.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_newftyp.c -o ../obj_lo/fld_newftyp$o

../obj_lo/fld_opts$o :	$(srcdir)/fld_opts.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_opts.c -o ../obj_lo/fld_opts$o

../obj_lo/fld_pad$o :	$(srcdir)/fld_pad.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_pad.c -o ../obj_lo/fld_pad$o

../obj_lo/fld_page$o :	$(srcdir)/fld_page.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_page.c -o ../obj_lo/fld_page$o

../obj_lo/fld_stat$o :	$(srcdir)/fld_stat.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_stat.c -o ../obj_lo/fld_stat$o

../obj_lo/fld_type$o :	$(srcdir)/fld_type.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_type.c -o ../obj_lo/fld_type$o

../obj_lo/fld_user$o :	$(srcdir)/fld_user.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fld_user.c -o ../obj_lo/fld_user$o

../obj_lo/frm_cursor$o :	$(srcdir)/frm_cursor.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_cursor.c -o ../obj_lo/frm_cursor$o

../obj_lo/frm_data$o :	$(srcdir)/frm_data.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_data.c -o ../obj_lo/frm_data$o

../obj_lo/frm_def$o :	$(srcdir)/frm_def.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_def.c -o ../obj_lo/frm_def$o

../obj_lo/frm_driver$o :	$(srcdir)/frm_driver.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_driver.c -o ../obj_lo/frm_driver$o

../obj_lo/frm_hook$o :	$(srcdir)/frm_hook.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_hook.c -o ../obj_lo/frm_hook$o

../obj_lo/frm_opts$o :	$(srcdir)/frm_opts.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_opts.c -o ../obj_lo/frm_opts$o

../obj_lo/frm_page$o :	$(srcdir)/frm_page.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_page.c -o ../obj_lo/frm_page$o

../obj_lo/frm_post$o :	$(srcdir)/frm_post.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_post.c -o ../obj_lo/frm_post$o

../obj_lo/frm_req_name$o :	$(srcdir)/frm_req_name.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_req_name.c -o ../obj_lo/frm_req_name$o

../obj_lo/frm_scale$o :	$(srcdir)/frm_scale.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_scale.c -o ../obj_lo/frm_scale$o

../obj_lo/frm_sub$o :	$(srcdir)/frm_sub.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_sub.c -o ../obj_lo/frm_sub$o

../obj_lo/frm_user$o :	$(srcdir)/frm_user.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_user.c -o ../obj_lo/frm_user$o

../obj_lo/frm_win$o :	$(srcdir)/frm_win.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/frm_win.c -o ../obj_lo/frm_win$o

../obj_lo/fty_alnum$o :	$(srcdir)/fty_alnum.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fty_alnum.c -o ../obj_lo/fty_alnum$o

../obj_lo/fty_alpha$o :	$(srcdir)/fty_alpha.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fty_alpha.c -o ../obj_lo/fty_alpha$o

../obj_lo/fty_enum$o :	$(srcdir)/fty_enum.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fty_enum.c -o ../obj_lo/fty_enum$o

../obj_lo/fty_int$o :	$(srcdir)/fty_int.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fty_int.c -o ../obj_lo/fty_int$o

../obj_lo/fty_ipv4$o :	$(srcdir)/fty_ipv4.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fty_ipv4.c -o ../obj_lo/fty_ipv4$o

../obj_lo/fty_num$o :	$(srcdir)/fty_num.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fty_num.c -o ../obj_lo/fty_num$o

../obj_lo/fty_regex$o :	$(srcdir)/fty_regex.c \
			$(FORM_PRIV_H)
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS_LIBTOOL) -c ../form/fty_regex.c -o ../obj_lo/fty_regex$o


# generated by mk-hdr.awk
#  subset:     ticlib+termlib+ext_tinfo+base+ext_funcs
#  compat:     yes

${DESTDIR}${includedir} :
	sh ${srcdir}/../mkdirs.sh $@

install \
install.libs \
install.includes :: ${AUTO_SRC} ${DESTDIR}${includedir} \
		$(srcdir)/form.h
	@ (cd ${DESTDIR}${includedir} && rm -f form.h) ; ../headers.sh ${INSTALL_DATA} ${DESTDIR}${includedir} ${srcdir} $(srcdir)/form.h

uninstall \
uninstall.libs \
uninstall.includes ::
	-@ (cd ${DESTDIR}${includedir} && rm -f form.h)
depend : ${AUTO_SRC}
	makedepend -- ${CPPFLAGS} -- ${C_SRC}

# DO NOT DELETE THIS LINE -- make depend depends on it.
