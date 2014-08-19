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

 */
- (void)setById:(NSString *)Id withAuth:(QuizletAuth *)auth
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)setTermsById:(NSString *)Id withAuth:(QuizletAuth *)auth
             success:(void (^)(id responseObject))success
             failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)setPasswordById:(NSString *)Id withAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)setsWithAuth:(QuizletAuth *)auth
             success:(void (^)(id responseObject))success
             failure:(void (^)(NSError *error))failure;

@end
