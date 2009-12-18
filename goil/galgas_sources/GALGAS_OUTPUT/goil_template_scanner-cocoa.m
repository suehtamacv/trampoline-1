//---------------------------------------------------------------------------*
//                                                                           *
//                   File 'goil_template_scanner-cocoa.m'                    *
//                        Generated by version 1.9.7                         *
//                     december 17th, 2009, at 9h52'3"                       *
//                                                                           *
//---------------------------------------------------------------------------*

//--- START OF USER ZONE 1


//--- END OF USER ZONE 1


//---------------------------------------------------------------------------*

#import "version_libpm.h"
#if LIBPM_VERSION != 629
  #error "This file has been compiled with a version of GALGAS different than the version of libpm"
#endif

//---------------------------------------------------------------------------*

#import "goil_template_scanner-cocoa.h"

//---------------------------------------------------------------------------*

@implementation OC_Lexique_goil_template_scanner

//---------------------------------------------------------------------------*

- (id) init {
  self = [super init] ;
  if (self) {
    mLexicalAttribute_a_string = [[NSMutableString alloc] init] ;
    mLexicalAttribute_floatValue = 0.0 ;
    mLexicalAttribute_identifierString = [[NSMutableString alloc] init] ;
    mLexicalAttribute_tokenString = [[NSMutableString alloc] init] ;
    mLexicalAttribute_uint64value = 0 ;
  }
  return self ;
}

//---------------------------------------------------------------------------*

- (void) dealloc {
  [mLexicalAttribute_a_string release] ;
  [mLexicalAttribute_identifierString release] ;
  [mLexicalAttribute_tokenString release] ;
  [super dealloc] ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//                           Template Delimiters                             *
//                                                                           *
//---------------------------------------------------------------------------*

static const templateDelimiterStructForCocoa kTemplateDefinitionArray_goil_5F_template_5F_scanner [1] = {
  {@"%", @"%", YES}
} ;

//---------------------------------------------------------------------------*
//                                                                           *
//                           Template Replacments                            *
//                                                                           *
//---------------------------------------------------------------------------*

static NSString * kTemplateReplacementArray_goil_5F_template_5F_scanner [4] = {
  @"\\%", @"\\n", @"\\\\", nil
} ;

//---------------------------------------------------------------------------*
//                                                                           *
//            Terminal Symbols as end of script in template mark             *
//                                                                           *
//---------------------------------------------------------------------------*

static const BOOL kEndOfScriptInTemplateArray_goil_5F_template_5F_scanner [67] = {
  NO /* identifier */,
  NO /* literal_double */,
  NO /* unsigned_literal_integer64 */,
  NO /* . */,
  NO /* .= */,
  NO /* ... */,
  NO /* < */,
  NO /* <= */,
  NO /* << */,
  NO /* string */,
  NO /* comment */,
  NO /* after */,
  NO /* before */,
  NO /* between */,
  NO /* block */,
  NO /* do */,
  NO /* else */,
  NO /* elsif */,
  NO /* end */,
  NO /* for */,
  NO /* foreach */,
  NO /* no */,
  NO /* if */,
  NO /* in */,
  NO /* mod */,
  NO /* not */,
  NO /* prefixedby */,
  NO /* template */,
  NO /* then */,
  NO /* yes */,
  NO /* while */,
  NO /* * */,
  NO /* | */,
  NO /* , */,
  NO /* + */,
  NO /* -- */,
  NO /* :: */,
  NO /* > */,
  NO /* ; */,
  NO /* : */,
  NO /* - */,
  NO /* ( */,
  NO /* ) */,
  NO /* -> */,
  NO /* ? */,
  NO /* == */,
  NO /* ?? */,
  NO /* ! */,
  NO /* := */,
  NO /* ++ */,
  NO /* [ */,
  NO /* ] */,
  NO /* += */,
  NO /* ?! */,
  NO /* !? */,
  NO /* / */,
  NO /* != */,
  NO /* >= */,
  NO /* & */,
  NO /* { */,
  NO /* } */,
  NO /* +> */,
  NO /* -= */,
  NO /* ^ */,
  NO /* >> */,
  NO /* ~ */,
  NO /* <- */
} ;


//---------------------------------------------------------------------------*
//                                                                           *
//             Key words table 'goilTemplateKeyWordList'                            *
//                                                                           *
//---------------------------------------------------------------------------*

static const C_cocoa_lexique_table_entry ktable_for_goil_5F_template_5F_scanner_goilTemplateKeyWordList [20] = {
  {@"do", goil_template_scanner_1_do},
  {@"if", goil_template_scanner_1_if},
  {@"in", goil_template_scanner_1_in},
  {@"no", goil_template_scanner_1_no},
  {@"end", goil_template_scanner_1_end},
  {@"for", goil_template_scanner_1_for},
  {@"mod", goil_template_scanner_1_mod},
  {@"not", goil_template_scanner_1_not},
  {@"yes", goil_template_scanner_1_yes},
  {@"else", goil_template_scanner_1_else},
  {@"then", goil_template_scanner_1_then},
  {@"after", goil_template_scanner_1_after},
  {@"block", goil_template_scanner_1_block},
  {@"elsif", goil_template_scanner_1_elsif},
  {@"while", goil_template_scanner_1_while},
  {@"before", goil_template_scanner_1_before},
  {@"between", goil_template_scanner_1_between},
  {@"foreach", goil_template_scanner_1_foreach},
  {@"template", goil_template_scanner_1_template},
  {@"prefixedby", goil_template_scanner_1_prefixedby}
} ;

static SInt32 search_into_goil_5F_template_5F_scanner_goilTemplateKeyWordList (NSString * inSearchedString) {
  return searchStringInTable (inSearchedString, ktable_for_goil_5F_template_5F_scanner_goilTemplateKeyWordList, 20) ;
}


//---------------------------------------------------------------------------*
//                                                                           *
//               P A R S E    L E X I C A L    T O K E N                     *
//                                                                           *
//---------------------------------------------------------------------------*

- (void) parseLexicalTokenForLexicalColoring {
  mLoop = YES ;
  BOOL scanningOk = YES ;
  mTokenCode = 0 ;
  while ((mTokenCode == 0) && (mCurrentChar != '\0')) {
    mTokenFirstLocation = mCurrentLocation ;
    if ((mMatchedTemplateDelimiterIndex >= 0) && ([kTemplateDefinitionArray_goil_5F_template_5F_scanner [mMatchedTemplateDelimiterIndex].mStartString length] > 0)) {
      const BOOL foundEndDelimitor = [self testForInputString:kTemplateDefinitionArray_goil_5F_template_5F_scanner [mMatchedTemplateDelimiterIndex].mEndString advance:YES] ;
      if (foundEndDelimitor) {
        mMatchedTemplateDelimiterIndex = -1 ;
      }
    }
    while ((mMatchedTemplateDelimiterIndex < 0) && (mCurrentChar != '\0')) {
      
      [self searchForReplacementPattern:kTemplateReplacementArray_goil_5F_template_5F_scanner] ;
      
      mMatchedTemplateDelimiterIndex = [self findTemplateDelimiterIndex:kTemplateDefinitionArray_goil_5F_template_5F_scanner listLength:1] ;
      if (mMatchedTemplateDelimiterIndex < 0) {
        [self advance] ;
        mTokenCode = -2 ;
      }
    }
    if ((mMatchedTemplateDelimiterIndex >= 0) && (mTokenCode == 0) && (mCurrentChar != '\0') && scanningOk) {
      [mLexicalAttribute_a_string setString:@""] ;
      mLexicalAttribute_floatValue = 0.0 ;
      [mLexicalAttribute_identifierString setString:@""] ;
      [mLexicalAttribute_tokenString setString:@""] ;
      mLexicalAttribute_uint64value = 0 ;
      mTokenFirstLocation = mCurrentLocation ;
      if (scanningOk && ([self testForInputFromChar:97 toChar:122] || [self testForInputFromChar:65 toChar:90])) {
        do {
          scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_identifierString, scanner_cocoa_function_toLower (mPreviousChar)) ;
          scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_tokenString, mPreviousChar) ;
          if (scanningOk && ([self testForInputFromChar:97 toChar:122] || [self testForInputFromChar:65 toChar:90] || [self testForInputChar:95] || [self testForInputFromChar:48 toChar:57])) {
          }else{
            mLoop = NO ;
          }
        }while (mLoop && scanningOk) ;
        mLoop = YES ;
        if (mTokenCode == 0) {
          mTokenCode = search_into_goil_5F_template_5F_scanner_goilTemplateKeyWordList (mLexicalAttribute_identifierString) ;
        }
        if (mTokenCode == 0) {
          mTokenCode = goil_template_scanner_1_identifier ;
        }
      }else if (scanningOk && ([self testForInputFromChar:48 toChar:57])) {
        scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_tokenString, mPreviousChar) ;
        do {
          if (scanningOk && ([self testForInputFromChar:48 toChar:57])) {
            scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_tokenString, mPreviousChar) ;
          }else if (scanningOk && ([self testForInputChar:95])) {
          }else{
            mLoop = NO ;
          }
        }while (mLoop && scanningOk) ;
        mLoop = YES ;
        if (scanningOk && ([self testForInputChar:46])) {
          scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_tokenString, 46) ;
          do {
            if (scanningOk && ([self testForInputFromChar:48 toChar:57])) {
              scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_tokenString, mPreviousChar) ;
            }else if (scanningOk && ([self testForInputChar:95])) {
            }else{
              mLoop = NO ;
            }
          }while (mLoop && scanningOk) ;
          mLoop = YES ;
          scanner_cocoa_routine_convertStringToDouble (& scanningOk, mLexicalAttribute_tokenString, & mLexicalAttribute_floatValue) ;
          mTokenCode = goil_template_scanner_1_literal_5F_double ;
        }else{
          scanner_cocoa_routine_convertDecimalStringIntoUInt64 (& scanningOk, mLexicalAttribute_tokenString, & mLexicalAttribute_uint64value) ;
          mTokenCode = goil_template_scanner_1_unsigned_5F_literal_5F_integer_36__34_ ;
        }
      }else if (scanningOk && ([self testForInputChar:46])) {
        if (scanningOk && ([self testForInputFromChar:48 toChar:57])) {
          scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_tokenString, 48) ;
          scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_tokenString, 46) ;
          scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_tokenString, mPreviousChar) ;
          do {
            if (scanningOk && ([self testForInputFromChar:48 toChar:57])) {
              scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_tokenString, mPreviousChar) ;
            }else if (scanningOk && ([self testForInputChar:95])) {
            }else{
              mLoop = NO ;
            }
          }while (mLoop && scanningOk) ;
          mLoop = YES ;
          scanner_cocoa_routine_convertStringToDouble (& scanningOk, mLexicalAttribute_tokenString, & mLexicalAttribute_floatValue) ;
          mTokenCode = goil_template_scanner_1_literal_5F_double ;
        }else{
          if (scanningOk && ([self testForInputString:@".." advance:YES])) {
            mTokenCode = goil_template_scanner_1__2E__2E__2E_ ;
          }else if (scanningOk && ([self testForInputString:@"=" advance:YES])) {
            mTokenCode = goil_template_scanner_1__2E__3D_ ;
          }else{
            mTokenCode = goil_template_scanner_1__2E_ ;
          }
        }
      }else if (scanningOk && [self testForInputString:@"\?\?" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3F__3F_ ;
      }else if (scanningOk && [self testForInputString:@"\?!" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3F__21_ ;
      }else if (scanningOk && [self testForInputString:@">>" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3E__3E_ ;
      }else if (scanningOk && [self testForInputString:@">=" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3E__3D_ ;
      }else if (scanningOk && [self testForInputString:@"==" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3D__3D_ ;
      }else if (scanningOk && [self testForInputString:@"<-" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3C__2D_ ;
      }else if (scanningOk && [self testForInputString:@":=" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3A__3D_ ;
      }else if (scanningOk && [self testForInputString:@"::" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3A__3A_ ;
      }else if (scanningOk && [self testForInputString:@"->" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2D__3E_ ;
      }else if (scanningOk && [self testForInputString:@"-=" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2D__3D_ ;
      }else if (scanningOk && [self testForInputString:@"--" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2D__2D_ ;
      }else if (scanningOk && [self testForInputString:@"+>" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2B__3E_ ;
      }else if (scanningOk && [self testForInputString:@"+=" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2B__3D_ ;
      }else if (scanningOk && [self testForInputString:@"++" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2B__2B_ ;
      }else if (scanningOk && [self testForInputString:@"!\?" advance:YES]) {
        mTokenCode = goil_template_scanner_1__21__3F_ ;
      }else if (scanningOk && [self testForInputString:@"!=" advance:YES]) {
        mTokenCode = goil_template_scanner_1__21__3D_ ;
      }else if (scanningOk && [self testForInputString:@"~" advance:YES]) {
        mTokenCode = goil_template_scanner_1__7E_ ;
      }else if (scanningOk && [self testForInputString:@"}" advance:YES]) {
        mTokenCode = goil_template_scanner_1__7D_ ;
      }else if (scanningOk && [self testForInputString:@"|" advance:YES]) {
        mTokenCode = goil_template_scanner_1__7C_ ;
      }else if (scanningOk && [self testForInputString:@"{" advance:YES]) {
        mTokenCode = goil_template_scanner_1__7B_ ;
      }else if (scanningOk && [self testForInputString:@"^" advance:YES]) {
        mTokenCode = goil_template_scanner_1__5E_ ;
      }else if (scanningOk && [self testForInputString:@"]" advance:YES]) {
        mTokenCode = goil_template_scanner_1__5D_ ;
      }else if (scanningOk && [self testForInputString:@"[" advance:YES]) {
        mTokenCode = goil_template_scanner_1__5B_ ;
      }else if (scanningOk && [self testForInputString:@"\?" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3F_ ;
      }else if (scanningOk && [self testForInputString:@">" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3E_ ;
      }else if (scanningOk && [self testForInputString:@";" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3B_ ;
      }else if (scanningOk && [self testForInputString:@":" advance:YES]) {
        mTokenCode = goil_template_scanner_1__3A_ ;
      }else if (scanningOk && [self testForInputString:@"/" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2F_ ;
      }else if (scanningOk && [self testForInputString:@"-" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2D_ ;
      }else if (scanningOk && [self testForInputString:@"," advance:YES]) {
        mTokenCode = goil_template_scanner_1__2C_ ;
      }else if (scanningOk && [self testForInputString:@"+" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2B_ ;
      }else if (scanningOk && [self testForInputString:@"*" advance:YES]) {
        mTokenCode = goil_template_scanner_1__2A_ ;
      }else if (scanningOk && [self testForInputString:@")" advance:YES]) {
        mTokenCode = goil_template_scanner_1__29_ ;
      }else if (scanningOk && [self testForInputString:@"(" advance:YES]) {
        mTokenCode = goil_template_scanner_1__28_ ;
      }else if (scanningOk && [self testForInputString:@"&" advance:YES]) {
        mTokenCode = goil_template_scanner_1__26_ ;
      }else if (scanningOk && [self testForInputString:@"!" advance:YES]) {
        mTokenCode = goil_template_scanner_1__21_ ;
      }else if (scanningOk && ([self testForInputChar:60])) {
        if (scanningOk && ([self testForInputChar:61])) {
          mTokenCode = goil_template_scanner_1__3C__3D_ ;
        }else if (scanningOk && ([self testForInputChar:60])) {
          mTokenCode = goil_template_scanner_1__3C__3C_ ;
        }else{
          mTokenCode = goil_template_scanner_1__3C_ ;
        }
      }else if (scanningOk && ([self testForInputChar:34])) {
        do {
          if (scanningOk && ([self testForInputFromChar:32 toChar:33] || [self testForInputFromChar:35 toChar:65533])) {
            scanner_cocoa_routine_enterCharacterIntoString (& scanningOk, mLexicalAttribute_a_string, mPreviousChar) ;
          }else{
            mLoop = NO ;
          }
        }while (mLoop && scanningOk) ;
        mLoop = YES ;
        if (scanningOk && ([self testForInputChar:34])) {
          mTokenCode = goil_template_scanner_1_string ;
        }else{
          scanningOk = NO ;
        }
      }else if (scanningOk && ([self testForInputChar:35])) {
        do {
          if (scanningOk && ([self testForInputFromChar:1 toChar:9] || [self testForInputChar:11] || [self testForInputChar:12] || [self testForInputFromChar:14 toChar:65533])) {
          }else{
            mLoop = NO ;
          }
        }while (mLoop && scanningOk) ;
        mLoop = YES ;
        mTokenCode = goil_template_scanner_1_comment ;
      }else if (scanningOk && ([self testForInputFromChar:1 toChar:32])) {
      }else if ([self testForInputChar:'\0']) { // End of source text ? 
        mTokenCode = goil_template_scanner_1_ ; // Empty string code
      }else{ // Unknown input character
        scanningOk = NO ;
      }
    }
    if ((mTokenCode > 0) && kEndOfScriptInTemplateArray_goil_5F_template_5F_scanner [mTokenCode - 1]) {
      mMatchedTemplateDelimiterIndex = -1 ;
    }
  //--- Error ?
    if (! scanningOk) {
      mTokenCode = -1 ;
      [self advance] ;
    }
  }
}

//---------------------------------------------------------------------------*
//                                                                           *
//                   T E R M I N A L    C O U N T                            *
//                                                                           *
//---------------------------------------------------------------------------*

- (UInt32) terminalVocabularyCount {
  return 67 ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//                     S T Y L E   C O U N T                                 *
//                                                                           *
//---------------------------------------------------------------------------*

- (UInt32) styleCount {
  return 8 ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//                I S    T E M P L A T E    L E X I Q U E                    *
//                                                                           *
//---------------------------------------------------------------------------*

- (BOOL) isTemplateLexique {
  return YES ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//              S T Y L E   F O R    T E R M I N A L                         *
//                                                                           *
//---------------------------------------------------------------------------*

- (UInt32) styleIndexForTerminal: (SInt32) inTerminal {
  static const UInt32 kTerminalSymbolStyles [68] = {0,
    0 /* goil_template_scanner_1_identifier */,
    5 /* goil_template_scanner_1_literal_5F_double */,
    4 /* goil_template_scanner_1_unsigned_5F_literal_5F_integer_36__34_ */,
    2 /* goil_template_scanner_1__2E_ */,
    2 /* goil_template_scanner_1__2E__3D_ */,
    2 /* goil_template_scanner_1__2E__2E__2E_ */,
    2 /* goil_template_scanner_1__3C_ */,
    2 /* goil_template_scanner_1__3C__3D_ */,
    2 /* goil_template_scanner_1__3C__3C_ */,
    6 /* goil_template_scanner_1_string */,
    7 /* goil_template_scanner_1_comment */,
    1 /* goil_template_scanner_1_after */,
    1 /* goil_template_scanner_1_before */,
    1 /* goil_template_scanner_1_between */,
    1 /* goil_template_scanner_1_block */,
    1 /* goil_template_scanner_1_do */,
    1 /* goil_template_scanner_1_else */,
    1 /* goil_template_scanner_1_elsif */,
    1 /* goil_template_scanner_1_end */,
    1 /* goil_template_scanner_1_for */,
    1 /* goil_template_scanner_1_foreach */,
    1 /* goil_template_scanner_1_no */,
    1 /* goil_template_scanner_1_if */,
    1 /* goil_template_scanner_1_in */,
    1 /* goil_template_scanner_1_mod */,
    1 /* goil_template_scanner_1_not */,
    1 /* goil_template_scanner_1_prefixedby */,
    1 /* goil_template_scanner_1_template */,
    1 /* goil_template_scanner_1_then */,
    1 /* goil_template_scanner_1_yes */,
    1 /* goil_template_scanner_1_while */,
    2 /* goil_template_scanner_1__2A_ */,
    2 /* goil_template_scanner_1__7C_ */,
    2 /* goil_template_scanner_1__2C_ */,
    2 /* goil_template_scanner_1__2B_ */,
    2 /* goil_template_scanner_1__2D__2D_ */,
    2 /* goil_template_scanner_1__3A__3A_ */,
    2 /* goil_template_scanner_1__3E_ */,
    2 /* goil_template_scanner_1__3B_ */,
    2 /* goil_template_scanner_1__3A_ */,
    2 /* goil_template_scanner_1__2D_ */,
    2 /* goil_template_scanner_1__28_ */,
    2 /* goil_template_scanner_1__29_ */,
    2 /* goil_template_scanner_1__2D__3E_ */,
    2 /* goil_template_scanner_1__3F_ */,
    2 /* goil_template_scanner_1__3D__3D_ */,
    2 /* goil_template_scanner_1__3F__3F_ */,
    2 /* goil_template_scanner_1__21_ */,
    2 /* goil_template_scanner_1__3A__3D_ */,
    2 /* goil_template_scanner_1__2B__2B_ */,
    2 /* goil_template_scanner_1__5B_ */,
    2 /* goil_template_scanner_1__5D_ */,
    2 /* goil_template_scanner_1__2B__3D_ */,
    2 /* goil_template_scanner_1__3F__21_ */,
    2 /* goil_template_scanner_1__21__3F_ */,
    2 /* goil_template_scanner_1__2F_ */,
    2 /* goil_template_scanner_1__21__3D_ */,
    2 /* goil_template_scanner_1__3E__3D_ */,
    2 /* goil_template_scanner_1__26_ */,
    2 /* goil_template_scanner_1__7B_ */,
    2 /* goil_template_scanner_1__7D_ */,
    2 /* goil_template_scanner_1__2B__3E_ */,
    2 /* goil_template_scanner_1__2D__3D_ */,
    2 /* goil_template_scanner_1__5E_ */,
    2 /* goil_template_scanner_1__3E__3E_ */,
    2 /* goil_template_scanner_1__7E_ */,
    2 /* goil_template_scanner_1__3C__2D_ */
  } ;
  return kTerminalSymbolStyles [inTerminal] ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//             S T Y L E   N A M E    F O R    I N D E X                     *
//                                                                           *
//---------------------------------------------------------------------------*

- (NSString *) styleNameForStyleIndex: (SInt32) inIndex {
  NSString * kStyleArray [8] = {
    @"Default Style",
    @"Keywords",
    @"Delimiters",
    @"Non Terminal Symbols",
    @"Integer Constants",
    @"Floating Point Constants",
    @"String literals",
    @"Comments"
  } ;
  return kStyleArray [inIndex] ;
}

//---------------------------------------------------------------------------*
//                                                                           *
//         S T Y L E   I D E N T I F I E R    F O R    I N D E X             *
//                                                                           *
//---------------------------------------------------------------------------*

- (NSString *) styleIdentifierForStyleIndex: (SInt32) inIndex {
  NSString * kStyleArray [8] = {
    @"goil_template_scanner",
    @"goil_template_scanner-keywordsStyle",
    @"goil_template_scanner-delimitersStyle",
    @"goil_template_scanner-nonTerminalStyle",
    @"goil_template_scanner-integerStyle",
    @"goil_template_scanner-float_csts",
    @"goil_template_scanner-stringStyle",
    @"goil_template_scanner-commentStyle"
  } ;
  return kStyleArray [inIndex] ;
}

//---------------------------------------------------------------------------*

@end

//--- START OF USER ZONE 2


//--- END OF USER ZONE 2



