## Process this file with automake to produce Makefile.in.
##
##  	Copyright © 2013 Mark Witmer
##  	Copyright © 2022 Felix Lechner
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

CLEANFILES = xcb/xml/*.go language/xml-xcb/*.go flow/*.go xcb/*.go

info_TEXINFOS = guile-xcb.texi

guile_install_bytecode_files = install-nobase_bytecodeDATA
$(guile_install_bytecode_files): install-nobase_moduleDATA

moduledir=$(GUILE_SITE)
bytecodedir=$(GUILE_SITE_CCACHE)

nobase_bytecode_DATA =                          \
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
  xcb/xml/bigreq.go                       \
  xcb/xml/ge.go                           \
  xcb/xml/xc_misc.go                      \
  xcb/auth.go                             \
  xcb/xml.go                              \
  xcb/xml/render.go                       \
  xcb/xml/randr.go                        \
  xcb/xml/dri2.go                         \
  xcb/xml/shape.go                        \
  xcb/xml/xfixes.go                       \
  xcb/xml/composite.go                    \
  xcb/xml/damage.go                       \
  xcb/xml/dpms.go                         \
  xcb/xml/glx.go                          \
  xcb/xml/record.go                       \
  xcb/xml/res.go                          \
  xcb/xml/screensaver.go                  \
  xcb/xml/shm.go                          \
  xcb/xml/sync.go                         \
  xcb/xml/xevie.go                        \
  xcb/xml/xf86dri.go                      \
  xcb/xml/xf86vidmode.go                  \
  xcb/xml/xinerama.go                     \
  xcb/xml/xinput.go                       \
  xcb/xml/xkb.go                          \
  xcb/xml/xselinux.go                     \
  xcb/xml/xtest.go                        \
  xcb/xml/xv.go                           \
  xcb/xml/xvmc.go                         \
  xcb/event-loop.go

nobase_module_DATA =                    \
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
  xcb/xml/bigreq.xml                      \
  xcb/xml/ge.xml                          \
  xcb/xml/xc_misc.xml                     \
  xcb/auth.scm                            \
  xcb/xml.scm                             \
  xcb/xml/render.xml                      \
  xcb/xml/randr.xml                       \
  xcb/xml/dri2.xml                        \
  xcb/xml/shape.xml                       \
  xcb/xml/xfixes.xml                      \
  xcb/xml/composite.xml                   \
  xcb/xml/damage.xml                      \
  xcb/xml/dpms.xml                        \
  xcb/xml/glx.xml                         \
  xcb/xml/record.xml                      \
  xcb/xml/res.xml                         \
  xcb/xml/screensaver.xml                 \
  xcb/xml/shm.xml                         \
  xcb/xml/sync.xml                        \
  xcb/xml/xevie.xml                       \
  xcb/xml/xf86dri.xml                     \
  xcb/xml/xf86vidmode.xml                 \
  xcb/xml/xinerama.xml                    \
  xcb/xml/xinput.xml                      \
  xcb/xml/xkb.xml                         \
  xcb/xml/xselinux.xml                    \
  xcb/xml/xtest.xml                       \
  xcb/xml/xv.xml                          \
  xcb/xml/xvmc.xml                        \
  xcb/event-loop.scm
