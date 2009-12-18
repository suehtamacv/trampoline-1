//---------------------------------------------------------------------------*
//                                                                           *
//                         File 'goil_obj_com.cpp'                           *
//                        Generated by version 1.9.7                         *
//                     december 17th, 2009, at 9h55'4"                       *
//                                                                           *
//---------------------------------------------------------------------------*

//--- START OF USER ZONE 1


//--- END OF USER ZONE 1

//---------------------------------------------------------------------------*

#include "version_libpm.h"
#if LIBPM_VERSION != 629
  #error "This file has been compiled with a version of GALGAS different than the version of libpm"
#endif

//---------------------------------------------------------------------------*

#include <typeinfo>
#include "utilities/MF_MemoryControl.h"
#include "files/C_TextFileWrite.h"
#include "galgas/C_galgas_CLI_Options.h"
#include "goil_obj_com.h"

//---------------------------------------------------------------------------*

#ifndef DO_NOT_GENERATE_CHECKINGS
  #define SOURCE_FILE_AT_LINE(line) "goil_obj_com.ggs", line
  #define COMMA_SOURCE_FILE_AT_LINE(line) , SOURCE_FILE_AT_LINE(line)
#else
  #define SOURCE_FILE_AT_LINE(line) 
  #define COMMA_SOURCE_FILE_AT_LINE(line) 
#endif


//--- START OF USER ZONE 2


//--- END OF USER ZONE 2

//---------------------------------------------------------------------------*
//                                                                           *
//                 Implementation of production rule 'com'                   *
//                                                                           *
//---------------------------------------------------------------------------*

void goil_obj_com::
pr_com_goil_obj_com_50_10_ (goil_lexique & inLexique,
                                GGS_com  &var_cas_com) {
  GGS_bool var_cas_usecom = GGS_bool (true) ;
  GGS_basic_type  var_cas_tb = var_cas_com.reader_timebase (inLexique COMMA_SOURCE_FILE_AT_LINE (55)) ;
  GGS_basic_type  var_cas_eh = var_cas_com.reader_errorhook (inLexique COMMA_SOURCE_FILE_AT_LINE (56)) ;
  GGS_basic_type  var_cas_ugsid = var_cas_com.reader_usegetserviceid (inLexique COMMA_SOURCE_FILE_AT_LINE (57)) ;
  GGS_basic_type  var_cas_upa = var_cas_com.reader_useparameteraccess (inLexique COMMA_SOURCE_FILE_AT_LINE (58)) ;
  GGS_basic_type  var_cas_sce = var_cas_com.reader_startcomextension (inLexique COMMA_SOURCE_FILE_AT_LINE (59)) ;
  GGS_lstringlist  var_cas_am = var_cas_com.reader_appmodes (inLexique COMMA_SOURCE_FILE_AT_LINE (60)) ;
  GGS_lstring  var_cas_s = var_cas_com.reader_status (inLexique COMMA_SOURCE_FILE_AT_LINE (61)) ;
  GGS_lstringlist  var_cas_u = var_cas_com.reader_uses (inLexique COMMA_SOURCE_FILE_AT_LINE (62)) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COM) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_idf) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__7B_) COMMA_HERE) ;
  { bool syntaxRepeat_0 = true ;
    while (syntaxRepeat_0) {
      switch (select_goil_obj_com_0 (inLexique)) {
        case 2 : {
          nt_comtimebase_ (inLexique, var_cas_tb) ;
          } break ;
        case 3 : {
          nt_comerrorhook_ (inLexique, var_cas_eh) ;
          } break ;
        case 4 : {
          nt_comusegetserviceid_ (inLexique, var_cas_ugsid) ;
          } break ;
        case 5 : {
          nt_comuseparameteraccess_ (inLexique, var_cas_upa) ;
          } break ;
        case 6 : {
          nt_comstartcomextension_ (inLexique, var_cas_sce) ;
          } break ;
        case 7 : {
          nt_comappmode_ (inLexique, var_cas_am) ;
          } break ;
        case 8 : {
          nt_comstatus_ (inLexique, var_cas_s) ;
          } break ;
        case 9 : {
          nt_use_ (inLexique, var_cas_u) ;
          } break ;
        default :
          syntaxRepeat_0 = false ;
          break ;
      }
    }
  }
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__7D_) COMMA_HERE) ;
  GGS_lstring  automatic_var_0 ;
  nt_description_ (inLexique, automatic_var_0) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3B_) COMMA_HERE) ;
  var_cas_com = GGS_com ::constructor_new (inLexique, GGS_lstring ::constructor_new (inLexique, GGS_string (""), GGS_location (inLexique) COMMA_HERE), var_cas_usecom, var_cas_tb, var_cas_eh, var_cas_ugsid, var_cas_upa, var_cas_sce, var_cas_am, var_cas_s, var_cas_u COMMA_HERE) ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//             Implementation of production rule 'comtimebase'               *
//                                                                           *
//---------------------------------------------------------------------------*

void goil_obj_com::
pr_comtimebase_goil_obj_com_94_18_ (goil_lexique & inLexique,
                                GGS_basic_type  &var_cas_tb) {
  GGS_ldouble  var_cas_f ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COMTIMEBASE) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3D_) COMMA_HERE) ;
  inLexique.assignFromAttribute_floatNumber (var_cas_f) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_float_5F_number) COMMA_HERE) ;
  { const GGS_basic_type _var_2378 = var_cas_tb ; // CAST instruction
    if (_var_2378.getPtr () != NULL) {
      macroValidPointer (_var_2378.getPtr ()) ;
      if (typeid (cPtr_float_class) == typeid (* (_var_2378.getPtr ()))) {
        var_cas_f.reader_location (inLexique COMMA_HERE).signalGGSSemanticError (inLexique, GGS_string ("Redefinition of COMTIMEBASE") COMMA_SOURCE_FILE_AT_LINE (102)) ;
        var_cas_tb.reader_location (inLexique COMMA_SOURCE_FILE_AT_LINE (102)).reader_location (inLexique COMMA_HERE).signalGGSSemanticError (inLexique, GGS_string ("was defined here") COMMA_SOURCE_FILE_AT_LINE (103)) ;
      }else{
        var_cas_tb = GGS_float_class ::constructor_new (inLexique, var_cas_f.reader_location (inLexique COMMA_SOURCE_FILE_AT_LINE (104)), var_cas_f.reader_double (inLexique COMMA_SOURCE_FILE_AT_LINE (104)) COMMA_HERE) ;
      }
    }
  }
  GGS_lstring  automatic_var_1 ;
  nt_description_ (inLexique, automatic_var_1) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3B_) COMMA_HERE) ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//             Implementation of production rule 'comerrorhook'              *
//                                                                           *
//---------------------------------------------------------------------------*

void goil_obj_com::
pr_comerrorhook_goil_obj_com_109_19_ (goil_lexique & inLexique,
                                GGS_basic_type  &var_cas_eh) {
  GGS_lbool  var_cas_b ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COMERRORHOOK) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3D_) COMMA_HERE) ;
  nt_boolean_ (inLexique, var_cas_b) ;
  ::routine_set_bool (inLexique,  var_cas_eh,  var_cas_b,  GGS_string ("COMERRORHOOK") COMMA_SOURCE_FILE_AT_LINE (114)) ;
  GGS_lstring  automatic_var_2 ;
  nt_description_ (inLexique, automatic_var_2) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3B_) COMMA_HERE) ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//          Implementation of production rule 'comusegetserviceid'           *
//                                                                           *
//---------------------------------------------------------------------------*

void goil_obj_com::
pr_comusegetserviceid_goil_obj_com_118_25_ (goil_lexique & inLexique,
                                GGS_basic_type  &var_cas_ugsid) {
  GGS_lbool  var_cas_b ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COMUSEGETSERVICEID) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3D_) COMMA_HERE) ;
  nt_boolean_ (inLexique, var_cas_b) ;
  ::routine_set_bool (inLexique,  var_cas_ugsid,  var_cas_b,  GGS_string ("COMUSEGETSERVICEID") COMMA_SOURCE_FILE_AT_LINE (123)) ;
  GGS_lstring  automatic_var_3 ;
  nt_description_ (inLexique, automatic_var_3) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3B_) COMMA_HERE) ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//        Implementation of production rule 'comuseparameteraccess'          *
//                                                                           *
//---------------------------------------------------------------------------*

void goil_obj_com::
pr_comuseparameteraccess_goil_obj_com_127_28_ (goil_lexique & inLexique,
                                GGS_basic_type  &var_cas_upa) {
  GGS_lbool  var_cas_b ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COMUSEPARAMETERACCESS) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3D_) COMMA_HERE) ;
  nt_boolean_ (inLexique, var_cas_b) ;
  ::routine_set_bool (inLexique,  var_cas_upa,  var_cas_b,  GGS_string ("COMUSEPARAMETERACCESS") COMMA_SOURCE_FILE_AT_LINE (132)) ;
  GGS_lstring  automatic_var_4 ;
  nt_description_ (inLexique, automatic_var_4) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3B_) COMMA_HERE) ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//         Implementation of production rule 'comstartcomextension'          *
//                                                                           *
//---------------------------------------------------------------------------*

void goil_obj_com::
pr_comstartcomextension_goil_obj_com_136_27_ (goil_lexique & inLexique,
                                GGS_basic_type  &var_cas_sce) {
  GGS_lbool  var_cas_b ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COMSTARTCOMEXTENSION) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3D_) COMMA_HERE) ;
  nt_boolean_ (inLexique, var_cas_b) ;
  ::routine_set_bool (inLexique,  var_cas_sce,  var_cas_b,  GGS_string ("COMSTARTCOMEXTENSION") COMMA_SOURCE_FILE_AT_LINE (141)) ;
  GGS_lstring  automatic_var_5 ;
  nt_description_ (inLexique, automatic_var_5) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3B_) COMMA_HERE) ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//              Implementation of production rule 'comappmode'               *
//                                                                           *
//---------------------------------------------------------------------------*

void goil_obj_com::
pr_comappmode_goil_obj_com_145_17_ (goil_lexique & inLexique,
                                GGS_lstringlist  &var_cas_am) {
  GGS_lstring  var_cas_s ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COMAPPMODE) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3D_) COMMA_HERE) ;
  inLexique.assignFromAttribute_a_string (var_cas_s) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_string) COMMA_HERE) ;
  ::routine_add_lstring_unique (inLexique,  var_cas_am,  var_cas_s,  GGS_string ("COMAPPMODE") COMMA_SOURCE_FILE_AT_LINE (150)) ;
  GGS_lstring  automatic_var_6 ;
  nt_description_ (inLexique, automatic_var_6) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3B_) COMMA_HERE) ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//              Implementation of production rule 'comstatus'                *
//                                                                           *
//---------------------------------------------------------------------------*

void goil_obj_com::
pr_comstatus_goil_obj_com_154_16_ (goil_lexique & inLexique,
                                GGS_lstring  &var_cas_s) {
  GGS_lstring  var_cas_ss ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COMSTATUS) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3D_) COMMA_HERE) ;
  switch (select_goil_obj_com_1 (inLexique)) {
    case 1 : {
      inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COMEXTENDED) COMMA_HERE) ;
      var_cas_ss = GGS_lstring ::constructor_new (inLexique, GGS_string ("extended"), GGS_location (inLexique) COMMA_HERE) ;
      } break ;
    case 2 : {
      inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_COMSTANDARD) COMMA_HERE) ;
      var_cas_ss = GGS_lstring ::constructor_new (inLexique, GGS_string ("standard"), GGS_location (inLexique) COMMA_HERE) ;
      } break ;
    default :
      break ;
  }
  ::routine_set_lstring_if_empty (inLexique,  var_cas_s,  var_cas_ss,  GGS_string ("COMSTATUS") COMMA_SOURCE_FILE_AT_LINE (164)) ;
  GGS_lstring  automatic_var_7 ;
  nt_description_ (inLexique, automatic_var_7) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3B_) COMMA_HERE) ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//                 Implementation of production rule 'use'                   *
//                                                                           *
//---------------------------------------------------------------------------*

void goil_obj_com::
pr_use_goil_obj_com_168_10_ (goil_lexique & inLexique,
                                GGS_lstringlist  &var_cas_u) {
  GGS_lstring  var_cas_use ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_USE) COMMA_HERE) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3D_) COMMA_HERE) ;
  inLexique.assignFromAttribute_a_string (var_cas_use) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1_string) COMMA_HERE) ;
  ::routine_add_lstring_unique (inLexique,  var_cas_u,  var_cas_use,  GGS_string ("USE") COMMA_SOURCE_FILE_AT_LINE (173)) ;
  GGS_lstring  automatic_var_8 ;
  nt_description_ (inLexique, automatic_var_8) ;
  inLexique.acceptTerminal (ACCEPT_TERMINAL (goil_lexique::goil_lexique_1__3B_) COMMA_HERE) ;
}

//---------------------------------------------------------------------------*

