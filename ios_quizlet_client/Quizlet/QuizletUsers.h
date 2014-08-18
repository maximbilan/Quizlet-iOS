//
//  QuizletUsers.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizletAuth;

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


@end
