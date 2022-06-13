## Process this file with automake to produce Makefile.in.
##
##  	Copyright (C) 2013 Mark Witmer
##
##   This file is part of guile-xcb.
##
##   guile-xcb is free software; you can redistribute it and/or modify
##   it under the terms of the GNU Lesser General Public License as
##   published by the Free Software Foundation; either version 3, or
##   (at your option) any later version.
##
##   guile-xcb is distributed in the hope that it will be useful, but
##   WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU Lesser General Public License for more details.
##
##   You should have received a copy of the GNU Lesser General Public
##   License along with guile-xcb; see the file COPYING.LESSER.  If
##   not, write to the Free Software Foundation, Inc., 51 Franklin
##   Street, Fifth Floor, Boston, MA 02110-1301 USA

AUTOMAKE_OPTIONS = -Wno-portability

%.go : %.xml language/xml-xcb/compile-scheme.go language/xml-xcb/spec.go xcb/records.go
	GUILE_FLAGS="-C ${CURDIR}" @GUILE_TOOLS@ compile $< --from=xml-xcb --output=$@

%.go : %.scm
	GUILE_FLAGS="-C ${CURDIR}" @GUILE_TOOLS@ compile $< --output=$@

CLEANFILES = xcb/xml/ext/*.go xcb/xml/*.go language/xml-xcb/*.go flow/*.go xcb/*.go

info_TEXINFOS = guile-xcb.texi

guile_install_go_files = install-nobase_goDATA
$(guile_install_go_files): install-nobase_modDATA

moddir=$(prefix)/share/guile/site/$(GUILE_EFFECTIVE_VERSION)
godir=$(libdir)/guile/$(GUILE_EFFECTIVE_VERSION)/site-ccache

nobase_go_DATA =                          \
  flow/event-loop.go                      \
  xcb/records.go                          \
  xcb/enum.go                             \
  xcb/type.go                             \
  language/xml-xcb/support.go             \
  xcb/union.go                            \
  xcb/struct.go                           \
  xcb/doc.go                              \
  xcb/connection.go                       \
  language/xml-xcb/compile-scheme.go      \
  language/xml-xcb/spec.go                \
  xcb/xml/xproto.go                       \
  xcb/core.go                             \
  xcb/extension-support.go                \
  xcb/xml/ext/bigreq.go                   \
  xcb/xml/ext/ge.go                       \
  xcb/xml/ext/xc_misc.go                  \
  xcb/auth.go                             \
  xcb/xml.go                              \
  xcb/xml/ext/render.go                   \
  xcb/xml/ext/randr.go                    \
  xcb/xml/ext/dri2.go                     \
  xcb/xml/ext/shape.go                    \
  xcb/xml/ext/xfixes.go                   \
  xcb/xml/ext/composite.go                \
  xcb/xml/ext/damage.go                   \
  xcb/xml/ext/dpms.go                     \
  xcb/xml/ext/glx.go                      \
  xcb/xml/ext/record.go                   \
  xcb/xml/ext/res.go                      \
  xcb/xml/ext/screensaver.go              \
  xcb/xml/ext/shm.go                      \
  xcb/xml/ext/sync.go                     \
  xcb/xml/ext/xevie.go                    \
  xcb/xml/ext/xf86dri.go                  \
  xcb/xml/ext/xf86vidmode.go              \
  xcb/xml/ext/xinerama.go                 \
  xcb/xml/ext/xinput.go                   \
  xcb/xml/ext/xkb.go                      \
  xcb/xml/ext/xselinux.go                 \
  xcb/xml/ext/xtest.go                    \
  xcb/xml/ext/xv.go                       \
  xcb/xml/ext/xvmc.go                     \
  xcb/event-loop.go

nobase_mod_DATA =                    \
  flow/event-loop.scm                     \
  xcb/records.scm                         \
  xcb/enum.scm                            \
  xcb/type.scm                            \
  language/xml-xcb/support.scm            \
  xcb/union.scm                           \
  xcb/struct.scm                          \
  xcb/doc.scm                             \
  xcb/test.scm                            \
  xcb/switch-test.scm                     \
  xcb/sample/tinywm.scm                   \
  xcb/sample/randr.scm                    \
  xcb/sample/win.scm                      \
  xcb/connection.scm                      \
  language/xml-xcb/compile-scheme.scm     \
  language/xml-xcb/spec.scm               \
  xcb/xml/xproto.xml                      \
  xcb/core.scm                            \
  xcb/extension-support.scm               \
  xcb/xml/ext/bigreq.xml                  \
  xcb/xml/ext/ge.xml                      \
  xcb/xml/ext/xc_misc.xml                 \
  xcb/auth.scm                            \
  xcb/xml.scm                             \
  xcb/xml/ext/render.xml                  \
  xcb/xml/ext/randr.xml                   \
  xcb/xml/ext/dri2.xml                    \
  xcb/xml/ext/shape.xml                   \
  xcb/xml/ext/xfixes.xml                  \
  xcb/xml/ext/composite.xml               \
  xcb/xml/ext/damage.xml                  \
  xcb/xml/ext/dpms.xml                    \
  xcb/xml/ext/glx.xml                     \
  xcb/xml/ext/record.xml                  \
  xcb/xml/ext/res.xml                     \
  xcb/xml/ext/screensaver.xml             \
  xcb/xml/ext/shm.xml                     \
  xcb/xml/ext/sync.xml                    \
  xcb/xml/ext/xevie.xml                   \
  xcb/xml/ext/xf86dri.xml                 \
  xcb/xml/ext/xf86vidmode.xml             \
  xcb/xml/ext/xinerama.xml                \
  xcb/xml/ext/xinput.xml                  \
  xcb/xml/ext/xkb.xml                     \
  xcb/xml/ext/xselinux.xml                \
  xcb/xml/ext/xtest.xml                   \
  xcb/xml/ext/xv.xml                      \
  xcb/xml/ext/xvmc.xml                    \
  xcb/event-loop.scm
