static const xc_opcode_spec_t xc_opcode_spec[] = {
	OPSPEC(    UNUSED,     UNUSED,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,     UNUSED,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(      CAST,        STD,     UNUSED,        TMP)
	OPSPEC(    UNUSED,        STD,     UNUSED,        TMP)
#ifdef ZEND_ENGINE_2
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
	OPSPEC(    ASSIGN,        STD,        STD,        VAR)
#else
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
#endif
	OPSPEC(    UNUSED,        VAR,     UNUSED,        VAR)
	OPSPEC(    UNUSED,        VAR,     UNUSED,        VAR)
	OPSPEC(    UNUSED,        VAR,     UNUSED,        TMP)
	OPSPEC(    UNUSED,        VAR,     UNUSED,        TMP)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,        VAR,        VAR,        VAR)
	OPSPEC(    UNUSED,        STD,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        STD,     UNUSED,        TMP)
#ifdef ZEND_ENGINE_2
	OPSPEC(    UNUSED,    JMPADDR,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        STD,    JMPADDR,     UNUSED)
	OPSPEC(    UNUSED,        STD,    JMPADDR,     UNUSED)
#else
	OPSPEC(    UNUSED,     OPLINE,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        STD,     OPLINE,     UNUSED)
	OPSPEC(    UNUSED,        STD,     OPLINE,     UNUSED)
#endif
	OPSPEC(    OPLINE,        STD,     OPLINE,     UNUSED)
#ifdef ZEND_ENGINE_2
	OPSPEC(    UNUSED,        STD,    JMPADDR,        TMP)
	OPSPEC(    UNUSED,        STD,    JMPADDR,        TMP)
#else
	OPSPEC(    UNUSED,        STD,     OPLINE,        TMP)
	OPSPEC(    UNUSED,        STD,     OPLINE,        TMP)
#endif
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(       BIT,        STD,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        BRK,        STD,     UNUSED)
	OPSPEC(    UNUSED,       CONT,        STD,     UNUSED)
	OPSPEC(    UNUSED,        STD,     UNUSED,        TMP)
	OPSPEC(    UNUSED,     UNUSED,     UNUSED,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,     UNUSED,     UNUSED,        TMP)
	OPSPEC(    UNUSED,        TMP,     UNUSED,     UNUSED)
	OPSPEC(INIT_FCALL,        STD,        STD,     UNUSED)
#ifdef ZEND_ENGINE_2
	OPSPEC(     FCALL,        STD,     OPLINE,        VAR)
	OPSPEC(     FCALL,        STD,     OPLINE,        VAR)
#else
	OPSPEC(     FCALL,        STD,     UNUSED,        VAR)
	OPSPEC(     FCALL,        STD,     UNUSED,        VAR)
#endif
	OPSPEC(    UNUSED,        STD,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        ARG,     UNUSED,        VAR)
	OPSPEC(    UNUSED,        ARG,        STD,        VAR)
	OPSPEC(      SEND,        STD,        ARG,     UNUSED)
	OPSPEC(      SEND,        VAR,        ARG,     UNUSED)
	OPSPEC(      SEND,        VAR,        ARG,     UNUSED)
#ifdef ZEND_ENGINE_2
	OPSPEC(    UNUSED,      CLASS,     UNUSED,        VAR)
#else
	OPSPEC(    UNUSED,        STD,     UNUSED,        VAR)
#endif
	OPSPEC(    UNUSED,        STD,     OPLINE,     UNUSED)
	OPSPEC(    UNUSED,        TMP,     UNUSED,     UNUSED)
	OPSPEC(       BIT,        STD,        STD,        TMP)
	OPSPEC(       BIT,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,    INCLUDE,        VAR)
#ifdef ZEND_ENGINE_2_1
  /* php 5.1 and up */
	OPSPEC(    UNUSED,        STD,      FETCH,     UNUSED)
	OPSPEC(       STD,        STD,        STD,     UNUSED)
	OPSPEC(       STD,        STD,        STD,     UNUSED)
	OPSPEC(       BIT,        STD,     OPLINE,        VAR)
#else
  /* <= php 5.0 */
  /* though there is no ISSET_ISEMPTY in php 5.0 it's better to leave it here i guess */
	OPSPEC(    UNUSED,        STD,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        VAR,        STD,     UNUSED)
	OPSPEC(    UNUSED,        VAR,      ISSET,        TMP)
	OPSPEC(       BIT,        STD,     UNUSED,        VAR)
#endif
	OPSPEC(        FE,        STD,     OPLINE,        TMP)
	OPSPEC(    UNUSED,        STD,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        STD,      FETCH,        VAR)
	OPSPEC(     FETCH,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,      VAR_2,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,      FETCH,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,      VAR_2,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,      FETCH,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,      VAR_2,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,      FETCH,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,      VAR_2,        STD,        VAR)
	OPSPEC(       ARG,        STD,      FETCH,        VAR)
	OPSPEC(       ARG,        VAR,        STD,        VAR)
	OPSPEC(       ARG,      VAR_2,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,      FETCH,        VAR)
	OPSPEC(    UNUSED,        VAR,        STD,        VAR)
	OPSPEC(    UNUSED,      VAR_2,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)

#ifdef ZEND_ENGINE_2
	OPSPEC(    UNUSED,     UCLASS,        STD,        TMP)
#else
	OPSPEC(    UNUSED,        STD,     UNUSED,        TMP)
#endif
	OPSPEC(   DECLARE,        STD,        STD,     UNUSED)
	OPSPEC(       STD,        STD,        STD,        STD)
	OPSPEC(       STD,        STD,        STD,        STD)
	OPSPEC(       STD,        STD,        STD,        STD)
	OPSPEC(    UNUSED,     UNUSED,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        STD,     UNUSED,     UNUSED)
	OPSPEC(SEND_NOREF,        VAR,        ARG,     UNUSED)
#ifdef ZEND_ENGINE_2
	OPSPEC(    OPLINE,      CLASS,        STD,     UNUSED)
	OPSPEC(    UNUSED,        STD,     OPLINE,     UNUSED)
	OPSPEC(    FCLASS,        STD,        STD,      CLASS)
	OPSPEC(    UNUSED,        STD,     UNUSED,        VAR)
	OPSPEC(    UNUSED,        STD,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,     UCLASS,        STD,     UNUSED)
	OPSPEC(     ISSET,        STD,      FETCH,        TMP)
	OPSPEC(     ISSET,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,      CLASS,        STD,     UNUSED)
	OPSPEC(    UNUSED,      CLASS,        STD,     UNUSED)
	OPSPEC(    UNUSED,      CLASS,        STD,     UNUSED)
	OPSPEC(       STD,        STD,        STD,        STD)
	OPSPEC(       STD,        STD,        STD,        STD)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(    UNUSED,        STD,        STD,        STD)
	OPSPEC(    UNUSED,        STD,      CLASS,        TMP)
	OPSPEC(    UNUSED,        STD,        STD,      CLASS)
	OPSPEC(     CLASS,        STD,        STD,      CLASS)
	OPSPEC(    UNUSED,        STD,        STD,     UNUSED)
	OPSPEC(    UNUSED,     UNUSED,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        STD,     UNUSED,     UNUSED)
	OPSPEC(     IFACE,      CLASS,      CLASS,     UNUSED)
	OPSPEC(    UNUSED,      CLASS,        STD,     UNUSED)
	OPSPEC(    UNUSED,      CLASS,     UNUSED,     UNUSED)
	OPSPEC(    UNUSED,        STD,        STD,        VAR)
	OPSPEC(     ISSET,        STD,        STD,        TMP)
	OPSPEC(       STD,     UNUSED,     UNUSED,        STD)
# ifdef ZEND_ENGINE_2_1
	OPSPEC(       STD,     UNUSED,     UNUSED,        STD)
# endif    
#endif
};