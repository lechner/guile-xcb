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

%.go : %.xml
	@GUILE_TOOLS@ compile $< --from=xml-xcb --output=$@ -L "@abs_top_srcdir@"

CLEANFILES = *.go

destination = xcb/xml

moduledir=$(GUILE_SITE)/$(destination)
bytecodedir=$(GUILE_SITE_CCACHE)/$(destination)

bytecode_DATA =                    \
  xproto.go                        \
  bigreq.go                        \
  ge.go                            \
  xc_misc.go                       \
  render.go                        \
  randr.go                         \
  dri2.go                          \
  shape.go                         \
  xfixes.go                        \
  composite.go                     \
  damage.go                        \
  dpms.go                          \
  glx.go                           \
  record.go                        \
  res.go                           \
  screensaver.go                   \
  shm.go                           \
  sync.go                          \
  xevie.go                         \
  xf86dri.go                       \
  xf86vidmode.go                   \
  xinerama.go                      \
  xinput.go                        \
  xkb.go                           \
  xselinux.go                      \
  xtest.go                         \
  xv.go                            \
  xvmc.go

module_DATA =                                 \
  $(patsubst(%.go, %.xml, $(bytecode_DATA)))
