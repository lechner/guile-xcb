#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_INIT(guile-xcb, 1.4)
AC_CONFIG_SRCDIR(xcb)

AC_CONFIG_AUX_DIR([build_aux])
AM_INIT_AUTOMAKE([color-tests -Wall -Wno-portability])

AM_SILENT_RULES([yes])

GUILE_PKG([3.0 2.2 2.0])
GUILE_PROGS
GUILE_SITE_DIR

AC_CONFIG_FILES([
        Makefile
])

AC_OUTPUT
