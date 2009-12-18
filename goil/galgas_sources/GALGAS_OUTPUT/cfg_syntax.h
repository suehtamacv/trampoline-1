//---------------------------------------------------------------------------*
//                                                                           *
//                           File 'cfg_syntax.h'                             *
//                        Generated by version 1.9.7                         *
//                     december 17th, 2009, at 9h55'52"                      *
//                                                                           *
//---------------------------------------------------------------------------*

//--- START OF USER ZONE 1


//--- END OF USER ZONE 1

#ifndef cfg_syntax_DEFINED
#define cfg_syntax_DEFINED

#include <string.h>

//---------------------------------------------------------------------------*

#include "galgas/GGS__header.h"
#include "cfg_lexique.h"

//---------------------------------------------------------------------------*

// Include imported semantics
#include "cfg_types.h"

//--- START OF USER ZONE 2


//--- END OF USER ZONE 2

//---------------------------------------------------------------------------*
//                                                                           *
//                          Class Predeclarations                            *
//                                                                           *
//---------------------------------------------------------------------------*


//---------------------------------------------------------------------------*
//                                                                           *
//                   Parser class cfg_syntax declaration                     *
//                                                                           *
//---------------------------------------------------------------------------*

class cfg_syntax {
  public : virtual ~cfg_syntax (void) {}

  protected : virtual void nt_cfg_start_ (cfg_lexique &,
                                GGS_config  &) = 0 ;

  protected : virtual void nt_cfg_attrs_ (cfg_lexique &,
                                GGS_cfg_attrs  &) = 0 ;

  protected : virtual void nt_interrupts_ (cfg_lexique &,
                                GGS_basic_type  &) = 0 ;

  protected : void pr_cfg_start_cfg_syntax_37_16_ (cfg_lexique &,
                                GGS_config  &) ;

  protected : virtual PMSInt16 select_cfg_syntax_0 (cfg_lexique &) = 0 ;

  protected : void pr_cfg_attrs_cfg_syntax_111_16_ (cfg_lexique &,
                                GGS_cfg_attrs  &) ;

  protected : virtual PMSInt16 select_cfg_syntax_1 (cfg_lexique &) = 0 ;

  protected : void pr_interrupts_cfg_syntax_123_17_ (cfg_lexique &,
                                GGS_basic_type  &) ;

  protected : virtual PMSInt16 select_cfg_syntax_2 (cfg_lexique &) = 0 ;

} ;

//---------------------------------------------------------------------------*

#endif
