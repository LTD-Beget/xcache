dnl vim:ts=2:sw=2:expandtab

AC_DEFUN([XCACHE_MODULE], [
  PHP_ARG_ENABLE(xcache-$1, for XCache $1,
  [  --enable-xcache-$2    XCache: $4], no, no)
  if test "$PHP_$3" != "no"; then
    xcache_sources="$xcache_sources submodules/xc_$1.c"
    XCACHE_MODULES="$XCACHE_MODULES $1"
    HAVE_$3=1
    AC_DEFINE([HAVE_$3], 1, [Define for XCache: $4])
  else
    HAVE_$3=
  fi
])dnl

PHP_ARG_ENABLE(xcache, for XCache support,
[  --enable-xcache         Include XCache support.])

if test "$PHP_XCACHE" != "no"; then
  PHP_ARG_ENABLE(xcache-constant, for XCache handle of compile time constant,
  [  --enable-xcache-constant        XCache: Handle new constants made by php compiler (e.g.: for __halt_compiler)], yes, no)
  if test "$PHP_XCACHE_CONSTANT" != "no"; then
    AC_DEFINE([HAVE_XCACHE_CONSTANT], 1, [Define to enable XCache handling of compile time constants])
  fi

  xcache_sources="
                  util/xc_stack.c \
                  xcache.c \
                  xcache/xc_const_string.c \
                  xcache/xc_lock.c \
                  xcache/xc_mem.c \
                  xcache/xc_opcode_spec.c \
                  xcache/xc_processor.c \
                  xcache/xc_sandbox.c \
                  xcache/xc_shm.c \
                  xcache/xc_shm_mmap.c \
                  xcache/xc_utils.c \
                  "
  XCACHE_MODULES="cacher"
  XCACHE_MODULE([optimizer],    [optimizer   ], [XCACHE_OPTIMIZER],    [(N/A)])
  XCACHE_MODULE([coverager],    [coverager   ], [XCACHE_COVERAGER],    [Enable code coverage dumper, useful for testing php scripts])
  XCACHE_MODULE([assembler],    [assembler   ], [XCACHE_ASSEMBLER],    [(N/A)])
  XCACHE_MODULE([disassembler], [disassembler], [XCACHE_DISASSEMBLER], [Enable opcode to php variable dumper, NOT for production server])
  XCACHE_MODULE([encoder],      [encoder     ], [XCACHE_ENCODER],      [(N/A)])
  XCACHE_MODULE([decoder],      [decoder     ], [XCACHE_DECODER],      [(N/A)])
  AC_DEFINE_UNQUOTED([XCACHE_MODULES], "$XCACHE_MODULES", [Define what modules is built with XCache])

  PHP_ARG_ENABLE(xcache-test, for XCache self test,
  [  --enable-xcache-test            XCache: Enable self test - FOR DEVELOPERS ONLY!!], no, no)
  if test "$PHP_XCACHE_TEST" != "no"; then
    XCACHE_ENABLE_TEST=-DXCACHE_ENABLE_TEST
    xcache_sources="$xcache_sources xcache/xc_malloc.c"
    AC_DEFINE([HAVE_XCACHE_TEST], 1, [Define to enable XCache self test])
  else
    XCACHE_ENABLE_TEST=
  fi
  PHP_SUBST([XCACHE_ENABLE_TEST])

  PHP_ARG_ENABLE(xcache-dprint, for XCache self test,
  [  --enable-xcache-dprint          XCache: Enable debug print functions - FOR DEVELOPERS ONLY!!], no, no)
  if test "$PHP_XCACHE_DPRINT" != "no"; then
    AC_DEFINE([HAVE_XCACHE_DPRINT], 1, [Define to enable XCache debug print functions])
  fi

  PHP_NEW_EXTENSION(xcache, $xcache_sources, $ext_shared)
  PHP_ADD_MAKEFILE_FRAGMENT()

  AC_PATH_PROGS([XCACHE_AWK], [gawk awk])
  dnl clean locale for gawk 3.1.5 assertion bug
  if echo | LANG=C "$XCACHE_AWK" -- '' > /dev/null 2>&1 ; then
    XCACHE_AWK="LANG=C $XCACHE_AWK"
  else
    if echo | /usr/bin/env - "$XCACHE_AWK" -- '' > /dev/null 2>&1 ; then
      XCACHE_AWK="/usr/bin/env - $XCACHE_AWK"
    fi
  fi
  PHP_SUBST([XCACHE_AWK])
  AC_PATH_PROGS([M4], [m4])
  if test "$PHP_XCACHE_TEST" != "no"; then
    if echo | "$M4" -E > /dev/null 2>&1 ; then
      M4="$M4 -E"
    fi
  fi
   dnl fix for solaris m4: size of the push-back and argument
  if echo | "$M4" -B 102400 > /dev/null 2>&1 ; then
    M4="$M4 -B 102400"
  fi
  PHP_SUBST([M4])
  XCACHE_BACKTICK="'"'`'"'"
  PHP_SUBST([XCACHE_BACKTICK])
  AC_PATH_PROGS([GREP], [grep])
  PHP_SUBST([GREP])
  AC_PATH_PROGS([SED], [sed])
  PHP_SUBST([SED])

  AC_PATH_PROGS([INDENT], [indent cat])
  XCACHE_INDENT=cat
  case $INDENT in
  */indent[)]
    XCACHE_INDENT="$INDENT"
    opts="-kr --use-tabs --tab-size 4"
    if echo | $INDENT $opts > /dev/null 2>&1 ; then
      XCACHE_INDENT="$XCACHE_INDENT $opts"
    fi
    opts="-sob -nce"
    if echo | $INDENT $opts > /dev/null 2>&1 ; then
      XCACHE_INDENT="$XCACHE_INDENT $opts"
    fi
    opts="-l 160"
    if echo | $INDENT $opts > /dev/null 2>&1 ; then
      XCACHE_INDENT="$XCACHE_INDENT $opts"
    fi
    ;;
  esac
  PHP_SUBST([XCACHE_INDENT])

  dnl $ac_srcdir etc require PHP_NEW_EXTENSION
  XCACHE_PROC_SOURCES=`ls $ac_srcdir/processor/*.m4`
  PHP_SUBST([XCACHE_PROC_SOURCES])
fi
