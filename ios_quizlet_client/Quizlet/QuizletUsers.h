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

- (void)userDetailsWithAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;

- (void)setsWithAuth:(QuizletAuth *)auth
             success:(void (^)(id responseObject))success
             failure:(void (^)(NSError *error))failure;

@end
