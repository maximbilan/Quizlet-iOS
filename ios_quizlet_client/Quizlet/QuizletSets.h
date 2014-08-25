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

- (void)addSetFromDictionary:(NSDictionary *)dictionary
                    withAuth:(QuizletAuth *)auth
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

- (void)editSetFromDictionary:(NSDictionary *)dictionary
                      bySetId:(NSString *)setId
                     withAuth:(QuizletAuth *)auth
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

- (void)deleteSetBySetId:(NSString *)setId
                withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;

- (void)addTermFromDictionary:(NSDictionary *)dictionary
                 toSetBySetId:(NSString *)setId
                     withAuth:(QuizletAuth *)auth
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

- (void)editTermFromDictionary:(NSDictionary *)dictionary
                fromSetBySetId:(NSString *)setId
                      byTermId:(NSString *)termId
                      withAuth:(QuizletAuth *)auth
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

- (void)deleteTermFromSetBySetId:(NSString *)setId
                        byTermId:(NSString *)termId
                        withAuth:(QuizletAuth *)auth
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

@end
