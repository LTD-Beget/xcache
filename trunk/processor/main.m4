divert(-1)
dnl ================ start ======================
dnl define(`XCACHE_ENABLE_TEST')
dnl define(`DEBUG_SIZE')
define(`USEMEMCPY')

dnl ================ main

dnl {{{ basic
define(`REDEF', `ifdef(`$1', `undefine(`$1')') define(`$1', `$2')')
define(`MAKE_MACRONAME', `translit(`$1', ` ():
', `_____')')
define(`ONCE', `ifdef(MAKE_MACRONAME(`ONCE $1'), `', `define(MAKE_MACRONAME(`ONCE $1'))$1')')
define(`m4_errprint', `ONCE(`errprint(`$1
')')')
ifdef(`len', `
define(`m4_len', defn(`len'))
undefine(`len')
')
define(`XCACHE_STRS', `($1), (sizeof($1))')
define(`XCACHE_STRL', `($1), (sizeof($1) - 1)')
define(`DST', `dst->$1')
define(`SRC', `src->$1')
dnl ============
define(`INDENT', `xc_dprint_indent(indent);')
dnl }}}
dnl {{{ SRCPTR_EX(1:type, 2:elm)
define(`SRCPTR_EX', `IFRELOCATE(`ptradd($1 *, notnullable($2), ptrdiff)', `$2')')
dnl }}}
dnl {{{ ALLOC(1:dst, 2:type, 3:count=1, 4:clean=false, 5:realtype=$2)
define(`ALLOC', `
	pushdef(`COUNT', `ifelse(`$3', `', `1', `$3')')
	pushdef(`SIZE', `sizeof($2)ifelse(`$3', `', `', ` * $3')')
	pushdef(`REALTYPE', `ifelse(`$5', , `$2', `$5')')
	/* allocate */
	IFCALC(`
		IFAUTOCHECK(`
			xc_stack_push(&processor->allocsizes, (void *) (long) (SIZE));
			xc_stack_push(&processor->allocsizes, (void *) (long) (__LINE__));
		')
		processor->size = (size_t) ALIGN(processor->size);
		processor->size += SIZE;
	')
	IFSTORE(`
		IFAUTOCHECK(`{
			if (!xc_stack_count(&processor->allocsizes)) {
				fprintf(stderr, "mismatch `$@' at line %d\n", __LINE__);
			}
			else {
				unsigned long expect = (unsigned long) xc_stack_pop(&processor->allocsizes);
				unsigned long atline = (unsigned long) xc_stack_pop(&processor->allocsizes);
				unsigned long real = SIZE;
				if (expect != real) {
					fprintf(stderr, "mismatch `$@' at line %d(was %lu): real %lu - expect %lu = %lu\n", __LINE__, atline, real, expect, real - expect);
				}
			}
		}')
		ifdef(`DEBUG_SIZE', ` {
			void *oldp = processor->p;
		')
		$1 = (REALTYPE *) (processor->p = (char *) ALIGN(processor->p));
		ifelse(`$4', `', `
				IFAUTOCHECK(`memsetptr($1, (void *) (unsigned long) __LINE__, SIZE);')
			', `
				memset($1, 0, SIZE);
		')
		processor->p += SIZE;

		ifdef(`DEBUG_SIZE', `
			xc_totalsize += (char *) processor->p - (char *) oldp;
			fprintf(stderr, "%d\t%d\t`'SIZE()\n", (char *) processor->p - (char *) oldp, xc_totalsize);
		}
		')
	')
	IFRESTORE(`ifelse(`$4', `', `
			ifelse(
				REALTYPE*COUNT, `zval*1', `ALLOC_ZVAL($1);',
				REALTYPE*COUNT, `HashTable*1', `ALLOC_HASHTABLE($1);',
				`', `', `$1 = (REALTYPE *) emalloc(SIZE);')
			IFAUTOCHECK(`memsetptr($1, (void *) __LINE__, SIZE);')
		', `
			$1 = (REALTYPE *) ecalloc(COUNT, sizeof($2));
		')
	')
	popdef(`REALTYPE')
	popdef(`COUNT')
	popdef(`SIZE')
')
dnl CALLOC(1:dst, 2:type [, 3:count=1, 4:realtype=$2 ])
define(`CALLOC', `ALLOC(`$1', `$2', `$3', `1', `$4')')
dnl }}}
dnl {{{ PROC_CLASS_ENTRY_P(1:elm)
define(`PROC_CLASS_ENTRY_P', `PROC_CLASS_ENTRY_P_EX(`DST(`$1')', `SRC(`$1')', `$1')`'DONE(`$1')')
dnl PROC_CLASS_ENTRY_P_EX(1:dst, 2:src, 3:elm-name)
define(`PROC_CLASS_ENTRY_P_EX', `
	if ($2) {
		IFSTORE(`$1 = (zend_class_entry *) xc_get_class_num(processor, $2);')
		IFRESTORE(`$1 = xc_get_class(processor, (zend_ulong) $2);')
#ifdef IS_UNICODE
		IFDASM(`add_assoc_unicodel_ex(dst, XCACHE_STRS("$3"), ZSTR_U($2->name), $2->name_length, 1);')
#else
		IFDASM(`add_assoc_stringl_ex(dst, XCACHE_STRS("$3"), (char *) $2->name, $2->name_length, 1);')
#endif
	}
	else {
		COPYNULL_EX(`$1', `$3')
	}
')
dnl }}}
dnl {{{ IFAUTOCHECKEX
define(`IFAUTOCHECKEX', `ifdef(`XCACHE_ENABLE_TEST', `$1', `$2')')
dnl }}}
dnl {{{ IFAUTOCHECK
define(`IFAUTOCHECK', `IFAUTOCHECKEX(`
#ifndef NDEBUG
		$1
#endif
')')
dnl }}}
dnl {{{ DBG
define(`DBG', `ifdef(`XCACHE_ENABLE_TEST', `
	/* `$1' */
')')
dnl }}}
dnl {{{ EXPORT(1:code)
define(`EXPORT', `/* export: $1 :export */')
define(`EXPORTED', `EXPORT(`$1')
$1')
define(`EXPORTED_FUNCTION', `EXPORT(`$1;')
$1')
dnl }}}
dnl {{{ EXPORT_PROCESSOR(1:type, 2:processor)
define(`EXPORT_PROCESSOR', `define(`EXPORT_$1_$2', 1)')
dnl }}}
dnl {{{ FIXPOINTER(1:type, 2:ele)
define(`FIXPOINTER', `FIXPOINTER_EX(`$1', `DST(`$2')')')
dnl }}}
dnl {{{ FIXPOINTER_EX(1:type, 2:dst)
define(`FIXPOINTER_EX', `
	IFSTORE(`$2 = ($1 *) processor->shm->handlers->to_readonly(processor->shm, (void *)$2);')
	IFRELOCATE(`
		pushdef(`relocatee', `patsubst($2, `dst', `src')')
		relocatee = ($1 *) (((char *) relocatee) + relocatediff);
		popdef(`relocatee')
	')
')
dnl }}}
dnl {{{ IFNOTMEMCPY
define(`IFNOTMEMCPY', `ifdef(`USEMEMCPY', `', `$1')')
dnl }}}
dnl {{{ COPY
define(`COPY', `IFNOTMEMCPY(`IFCOPY(`DST(`$1') = SRC(`$1');')')DONE(`$1')')
dnl }}}
dnl {{{ COPY_N_EX(1:count, 2:type, 3:dst)
define(`COPY_N_EX', `
	ALLOC(`DST(`$3')', `$2', `SRC(`$1')')
	IFCOPY(`
		memcpy(DST(`$3'), SRC(`$3'), sizeof(DST(`$3[0]')) * SRC(`$1'));
		')
')
dnl }}}
dnl {{{ COPYPOINTER
define(`COPYPOINTER', `COPY(`$1')')
dnl }}}
dnl {{{ SETNULL_EX
define(`SETNULL_EX', `IFCOPY(`$1 = NULL;')')
define(`SETNULL', `SETNULL_EX(`DST(`$1')')DONE(`$1')')
dnl }}}
dnl {{{ COPYNULL_EX(1:dst, 2:elm-name)
define(`COPYNULL_EX', `
	IFDASM(`add_assoc_null_ex(dst, XCACHE_STRS("$2"));')
	IFNOTMEMCPY(`IFCOPY(`$1 = NULL;')')
	assert(patsubst($1, dst, src) == NULL);
')
dnl }}}
dnl {{{ COPYNULL(1:elm)
define(`COPYNULL', `
	COPYNULL_EX(`DST(`$1')', `$1')DONE(`$1')
')
dnl }}}
dnl {{{ COPYZERO_EX(1:dst, 2:elm-name)
define(`COPYZERO_EX', `
	IFDASM(`add_assoc_long_ex(dst, XCACHE_STRS("$2"), 0);')
	IFNOTMEMCPY(`IFCOPY(`$1 = 0;')')
	assert(patsubst($1, dst, src) == 0);
')
dnl }}}
dnl {{{ COPYZERO(1:elm)
define(`COPYZERO', `
	COPYZERO_EX(`DST(`$1')', `$1')DONE(`$1')
')
dnl }}}
dnl {{{ LIST_DIFF(1:left-list, 2:right-list)
define(`foreach',
       `pushdef(`$1')_foreach(`$1', `$2', `$3')popdef(`$1')')
define(`_arg1', `$1')
define(`_foreach',                             
       `ifelse(`$2', `()', ,                       
       `define(`$1', _arg1$2)$3`'_foreach(`$1',
                                                       (shift$2),
                                                       `$3')')')
define(`LIST_DIFF', `dnl
foreach(`i', `($1)', `pushdef(`item_'defn(`i'))')dnl allocate variable for items in $1 
foreach(`i', `($2)', `pushdef(`item_'defn(`i'))undefine(`item_'defn(`i'))')dnl allocate variable for items in $2, and undefine it 
foreach(`i', `($1)', `ifdef(`item_'defn(`i'), `defn(`i') ')')dnl see what is still defined
foreach(`i', `($2)', `define(`item_'defn(`i'))popdef(`item_'defn(`i'))')dnl
foreach(`i', `($1)', `popdef(`item_'defn(`i'))')dnl
')
dnl }}}
dnl {{{ DONE_*
define(`DONE_SIZE', `IFAUTOCHECK(`dnl
	xc_autocheck_done_size += (int) $1`';
	xc_autocheck_done_count ++;
')')
define(`DONE', `
	define(`ELEMENTS_DONE', defn(`ELEMENTS_DONE')`,"$1"')
	IFAUTOCHECK(`dnl
		if (zend_u_hash_exists(&xc_autocheck_done_names, IS_STRING, "$1", sizeof("$1"))) {
			fprintf(stderr
				, "duplicate field at %s `#'%d FUNC_NAME`' : %s\n"
				, __FILE__, __LINE__
				, "$1"
				);
		}
		else {
			zend_uchar b = 1;
			zend_hash_add(&xc_autocheck_done_names, "$1", sizeof("$1"), (void*)&b, sizeof(b), NULL);
		}
	')
	DONE_SIZE(`sizeof(SRC(`$1'))')
')
define(`DISABLECHECK', `
	pushdef(`DONE_SIZE')
	pushdef(`DONE')
$1
	popdef(`DONE_SIZE')
	popdef(`DONE')
')
dnl }}}
dnl {{{ IF**
define(`IFCALC', `ifelse(PROCESSOR_TYPE, `calc', `$1', `$2')')
define(`IFSTORE', `ifelse(PROCESSOR_TYPE, `store', `$1', `$2')')
define(`IFCALCSTORE', `IFSTORE(`$1', `IFCALC(`$1', `$2')')')
define(`IFRESTORE', `ifelse(PROCESSOR_TYPE, `restore', `$1', `$2')')
define(`IFRELOCATE', `ifelse(PROCESSOR_TYPE, `relocate', `$1', `$2')')
define(`IFCOPY', `IFSTORE(`$1', `IFRESTORE(`$1', `$2')')')
define(`IFCALCCOPY', `IFCALC(`$1', `IFCOPY(`$1', `$2')')')
define(`IFDPRINT', `ifelse(PROCESSOR_TYPE, `dprint', `$1', `$2')')
define(`IFDASM', `ifelse(PROCESSOR_TYPE, `dasm', `$1', `$2')')
dnl }}}

EXPORT_PROCESSOR(`dasm',   `zend_op_array')
EXPORT_PROCESSOR(`dasm',   `zend_function')
EXPORT_PROCESSOR(`dasm',   `zend_class_entry')
EXPORT_PROCESSOR(`dprint', `zval')

include(srcdir`/processor/hashtable.m4')
include(srcdir`/processor/string.m4')
include(srcdir`/processor/struct.m4')
include(srcdir`/processor/process.m4')
include(srcdir`/processor/head.m4')

REDEF(`PROCESSOR_TYPE', `calc') include(srcdir`/processor/processor.m4')
REDEF(`PROCESSOR_TYPE', `store') include(srcdir`/processor/processor.m4')
REDEF(`PROCESSOR_TYPE', `restore') include(srcdir`/processor/processor.m4')
REDEF(`PROCESSOR_TYPE', `relocate') include(srcdir`/processor/processor.m4')

#ifdef HAVE_XCACHE_DPRINT
REDEF(`PROCESSOR_TYPE', `dprint') include(srcdir`/processor/processor.m4')
#endif /* HAVE_XCACHE_DPRINT */
#ifdef HAVE_XCACHE_DISASSEMBLER
REDEF(`PROCESSOR_TYPE', `dasm') include(srcdir`/processor/processor.m4')
#endif /* HAVE_XCACHE_DISASSEMBLER */

include(srcdir`/processor/foot.m4')

ifdef(`EXIT_PENDING', `m4exit(EXIT_PENDING)')
