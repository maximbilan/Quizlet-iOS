//
//  QuizletUsers.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizletAuth;

/**
 Quizlet Users API
 Viewing users, their sets, classes, favorites and study sessions
 */
@interface QuizletUsers : NSObject

/**
 GET: /users/USERNAME
 View basic user information, including their sets, favorites, last 25 sessions, etc.
 */
- (void)userDetailsWithAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;

/**
 GET: /users/USERNAME/sets
 View complete details about all the user's created sets.
 */
- (void)setsWithAuth:(QuizletAuth *)auth
             success:(void (^)(id responseObject))success
             failure:(void (^)(NSError *error))failure;

/**
 GET: /users/USERNAME/favorites
 View complete details about all the user's favorited sets.
 */
- (void)favoritesWithAuth:(QuizletAuth *)auth
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure;

/**
 GET: /users/USERNAME/classes
 View complete details about all the classes that the user is a member of.
 */
- (void)classesWithAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure;

/**
 GET: /users/USERNAME/studied
 View the last 100 recently studied sessions for a user.
 */
- (void)studiedWithAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure;

/**
 PUT: /users/USERNAME/favorites/SET_ID
 Mark a set as a favorite.
 */
- (void)markUserSetAsFavoriteById:(NSString *)setId withAuth:(QuizletAuth *)auth
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

/**
 DELETE: /users/USERNAME/favorites/SET_ID
 Unmark a set as a favorite.
 */
- (void)unmarkUserSetAsFavoriteById:(NSString *)setId withAuth:(QuizletAuth *)auth
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;

@end
