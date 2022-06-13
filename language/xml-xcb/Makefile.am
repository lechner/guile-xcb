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

%.go : %.scm
	@GUILE_TOOLS@ compile $< --output=$@ -L "@abs_top_srcdir@"

CLEANFILES = *.go

destination = language/xml-xcb

moduledir=$(GUILE_SITE)/$(destination)
bytecodedir=$(GUILE_SITE_CCACHE)/$(destination)

bytecode_DATA =                    \
  support.go                       \
  compile-scheme.go                \
  spec.go

module_DATA =                                 \
  $(patsubst(%.go, %.scm, $(bytecode_DATA)))
