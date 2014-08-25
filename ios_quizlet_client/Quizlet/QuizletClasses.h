//
//  QuizletClasses.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/19/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizletAuth;

/**
 Quizlet Classes API
 */
@interface QuizletClasses : NSObject

/**
 GET: /classes/CLASS_ID
 View a single class.
 */
- (void)viewClassByClassId:(NSString *)classId
                  withAuth:(QuizletAuth *)auth
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure;

/**
 GET: /classes/CLASS_ID/sets
 View full details of all sets in a class.
 */
- (void)viewClassSetsByClassId:(NSString *)classId
                      withAuth:(QuizletAuth *)auth
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

/**
 POST: /classes
 Add a new class.
 
 Parameters:
 name
 description
 allow_discussion
 admin_only
 */
- (void)addClassFromDictionary:(NSDictionary *)dictionary
                      withAuth:(QuizletAuth *)auth
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

/**
 PUT: /classes/CLASS_ID
 Edit a class.
 
 Parameters:
 name
 description
 allow_discussion
 admin_only
 */
- (void)editClassWithDictionary:(NSDictionary *)dictionary
                      byClassId:(NSString *)classId
                       withAuth:(QuizletAuth *)auth
                        success:(void (^)(id responseObject))success
                        failure:(void (^)(NSError *error))failure;

/**
 DELETE: /classes/CLASS_ID
 Delete a class.
 */
- (void)deleteClassByClassId:(NSString *)classId
                    withAuth:(QuizletAuth *)auth
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/**
 PUT: /classes/CLASS_ID/sets/SET_ID
 Add a set to a class.
 */
- (void)addSetBySetId:(NSString *)setId
           forClassId:(NSString *)classId
             withAuth:(QuizletAuth *)auth
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;

/**
 DELETE: /classes/CLASS_ID/sets/SET_ID
 Remove a set from a class.
 */
- (void)deleteSetBySetId:(NSString *)setId
      fromClassByClassId:(NSString *)classId
                withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;

/**
 PUT: /classes/CLASS_ID/members/USERNAME
 Join (or apply to join) a class.
 */
- (void)joinClassByClassId:(NSString *)classId
                  withAuth:(QuizletAuth *)auth
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure;

/**
 DELETE: /classes/CLASS_ID/members/USERNAME
 Leave a class.
 */
- (void)leaveClassByClassId:(NSString *)classId
                   withAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;

@end
