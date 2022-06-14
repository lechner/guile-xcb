#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_INIT(guile-xcb, 1.4)
AC_CONFIG_SRCDIR(xcb)

AC_CONFIG_AUX_DIR([build_aux])
AM_INIT_AUTOMAKE([color-tests -Wall -Wno-portability])

AM_SILENT_RULES([yes])

GUILE_PKG([3.0 2.2 2.0])
GUILE_PROGS

# until GUILE_SITE_DIR is fixed
AC_SUBST([GUILE_SITE], [${prefix}/share/guile/site/${GUILE_EFFECTIVE_VERSION}])
AC_SUBST([GUILE_SITE_CCACHE], [${libdir}/guile/${GUILE_EFFECTIVE_VERSION}/site-ccache])

AC_CONFIG_FILES([
        Makefile
        flow/Makefile
        language/Makefile
        language/xml-xcb/Makefile
        xcb/Makefile
        xcb/sample/Makefile
        xcb/xml/Makefile
])

AC_OUTPUT
