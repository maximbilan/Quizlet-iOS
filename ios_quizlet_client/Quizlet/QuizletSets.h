//
//  QuizletSets.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
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
 
 Parameters:
 password
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
 
 Parameters:
 title
 terms (array)
 definitions (array)
 images(array)
 lang_terms
 lang_definitions
 description
 subjects (array)
 allow_discussion
 visibility
 editable
 groups (array)
 password
 */
- (void)addSetFromDictionary:(NSDictionary *)dictionary
                    withAuth:(QuizletAuth *)auth
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/**
 PUT: /sets/SET_ID
 Edit an existing set
 
 Parameters:
 title
 terms (array)
 definitions (array)
 images[+]
 lang_terms
 lang_definitions
 description
 subjects (array)
 allow_discussion
 visibility
 editable
 groups (array)
 password
 term_ids (array)
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
 
 Parameters:
 term
 definition
 position
 */
- (void)addTermFromDictionary:(NSDictionary *)dictionary
                 toSetBySetId:(NSString *)setId
                     withAuth:(QuizletAuth *)auth
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

/**
 PUT: /sets/SET_ID/terms/TERM_ID
 Edit a single term within a set
 
 Parameters:
 term
 definition
 image
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
