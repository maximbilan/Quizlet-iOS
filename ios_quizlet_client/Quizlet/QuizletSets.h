//
//  QuizletSets.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

#import <Foundation/Foundation.h>

@class QuizletAuth;

/**
 Quizlet Sets API
 */
@interface QuizletSets : NSObject

/**
 GET: /sets/SET_ID
 View complete details (including all terms) of a single set.
 */
- (void)viewSetBySetId:(NSString *)setId
              withAuth:(QuizletAuth *)auth
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;

/**
 GET: /sets/SET_ID/terms
 View just the terms in a single set.
 */
- (void)viewSetTermsBySetId:(NSString *)setId
                   withAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;

/**
 GET: /sets/SET_ID/password
 Submit a password for a password-protected set.
 
 Required Parameters
 Parameter	Type	Description
 --------------------------------
 password	string	The password for the set
 */
- (void)submitPassword:(NSString *)password
         forSetBySetId:(NSString *)setId
              withAuth:(QuizletAuth *)auth
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;

/**
 GET: /sets
 View complete details of multiple sets at once.
 */
- (void)viewSetsBySetIds:(NSString *)setIds
                withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;

/**
 POST: /sets
 Add a new set
 
 Required Parameters
 Parameter          Type	Description
 -----------------------------------
 title              string	The title of the set
 terms[]            array	The text of a new term. Specify as many terms[] parameters as needed.
 definitions[]      array	The text of a new definition. The number of definitions[] must match that of terms[].
 lang_terms         string	Language of the terms. See the list of possible languages.
 lang_definitions	string	Language of the definitions. See the list of possible languages.
 
 Optional Parameters
 Parameter          Type            Description                                                                                                 Default
 -----------------------------------------------------------------------------------------------------------------------------------------------------------
 images[]           array           The identifier of the image for a term. If present, the number of images[] must match that of terms[].      -
 Specify empty identifiers for terms that have no image. You get image identifiers when you upload images.
 description        string          A text description of the set.                                                                              -
 subjects[]         array           Deprecated. An array which will be ignored.                                                                 -
 allow_discussion	boolean	0 or 1. Flag of whether users are allowed to use the discussion box on this set	1
 visibility         "public",       Define who is allowed to view/use this set.                                                                 "public"
 "only_me",      If set to classes, the parameter classes becomes mandatory.
 "classes",      If set to password, the parameter password becomes mandatory.
 "password"
 editable           "only_me",      Define who is allowed to edit this set.                                                                     "only_me"
 "classes",      If set to classes, the parameter classes becomes mandatory.
 "password"      If set to password, the parameter password becomes mandatory.
 classes[]          array           Only required when visibility="classes" or editable="classes".                                              -
 An array of class IDs (integers) that this set is visible and/or editable for.
 password           string          Only required when visibility="password" or editable="password".                                            -
 The password required to view and/or edit this set.
 */
- (void)addSetFromDictionary:(NSDictionary *)dictionary
                    withAuth:(QuizletAuth *)auth
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/**
 PUT: /sets/SET_ID
 Edit an existing set
 
 Required Parameters
 ----------------------
 There are no specific required parameters - but if you do not send any parameters at all, the response will be 400-level error (as there is nothing to update).
 
 Optional Parameters
 Parameter          Type            Description
 --------------------------------------------------
 title              string          The title of the set.
 description        string          A text description of the set.
 term_ids[]         array           The array of term ids. For new terms, use a zero value (e.g. "term_ids[]=0").
 For already-existing terms, use the term id from the term you're editing (e.g. "term_ids[]=818192").
 If you don't want to replace all the terms at once, then use editing terms instead.
 terms[]            array           A replacement array of terms. If you don't want to replace all the terms at once, then use editing terms instead.
 definitions[]      array           A replacement array of definitions.
 If present, the length of this array must match the terms array.
 If you don't want to replace all the definitions at once, then use editing terms instead.
 images[]           array           A replacement array of image identifiers.
 If present, the length of this array must match the terms array.
 See the notes above for details about replacing images. If you don't want to replace all the images at once, then use editing terms instead.
 subjects[]         array           Deprecated. An array which will be ignored.
 allow_discussion	boolean	0 or 1. Flag of whether users are allowed to use the discussion box on this set.
 visibility         "public",       Define who is allowed to view/use this set.
 "only_me",      If set to classes, the parameter classes becomes mandatory.
 "classes",      If set to password, the parameter password becomes mandatory.
 "password"
 editable           "only_me",      Define who is allowed to edit this set.
 "classes",      If set to classes, the parameter classes becomes mandatory.
 "password"      If set to password, the parameter password becomes mandatory.
 classes[]          array           Only required when visibility="classes" or editable="classes".
 An array of class IDs (integers) that this set is visible and/or editable for.
 password           string          Only required when visibility="password" or editable="password".
 The password required to view and/or edit this set.
 lang_terms         string          Language of the terms. See the list of possible languages.
 lang_definitions	string          Language of the definitions. See the list of possible languages.
 */
- (void)editSetFromDictionary:(NSDictionary *)dictionary
                      bySetId:(NSString *)setId
                     withAuth:(QuizletAuth *)auth
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

/**
 DELETE: /sets/SET_ID
 Delete an existing set
 */
- (void)deleteSetBySetId:(NSString *)setId
                withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;

/**
 POST: /sets/SET_ID/terms
 Add a single term to a set
 
 Required Parameters
 Parameter	Type	Description
 ---------------------------------
 term       string	The actual term (front side of card).
 definition	string	The definition of the term.
 image      string	The identifier of the image for the term. You get image identifiers when you upload images.
 */
- (void)addTermFromDictionary:(NSDictionary *)dictionary
                 toSetBySetId:(NSString *)setId
                     withAuth:(QuizletAuth *)auth
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

/**
 PUT: /sets/SET_ID/terms/TERM_ID
 Edit a single term within a set
 
 Required Parameters
 Parameter	Type	Description
 ---------------------------------
 term       string	The actual term (front side of card).
 definition	string	The definition of the term.
 image      string	The identifier of the image for the term. You get image identifiers when you upload images.
 */
- (void)editTermFromDictionary:(NSDictionary *)dictionary
                fromSetBySetId:(NSString *)setId
                      byTermId:(NSString *)termId
                      withAuth:(QuizletAuth *)auth
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

/**
 DELETE: /sets/SET_ID/terms/TERM_ID
 Delete a single term within a set
 */
- (void)deleteTermFromSetBySetId:(NSString *)setId
                        byTermId:(NSString *)termId
                        withAuth:(QuizletAuth *)auth
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

@end
