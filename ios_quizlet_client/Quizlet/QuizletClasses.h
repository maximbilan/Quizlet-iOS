//
//  QuizletClasses.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/19/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizletAuth;

@interface QuizletClasses : NSObject

- (void)viewClassById:(NSString *)classId
             withAuth:(QuizletAuth *)auth
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;

- (void)viewClassSetsById:(NSString *)classId
                 withAuth:(QuizletAuth *)auth
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure;

@end
