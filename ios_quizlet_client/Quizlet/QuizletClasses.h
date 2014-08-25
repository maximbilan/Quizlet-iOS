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

- (void)viewClassByClassId:(NSString *)classId
                  withAuth:(QuizletAuth *)auth
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure;

- (void)viewClassSetsByClassId:(NSString *)classId
                      withAuth:(QuizletAuth *)auth
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

- (void)addClassFromDictionary:(NSDictionary *)dictionary
                      withAuth:(QuizletAuth *)auth
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

- (void)editClassWithDictionary:(NSDictionary *)dictionary
                      byClassId:(NSString *)classId
                       withAuth:(QuizletAuth *)auth
                        success:(void (^)(id responseObject))success
                        failure:(void (^)(NSError *error))failure;

- (void)deleteClassByClassId:(NSString *)classId
                    withAuth:(QuizletAuth *)auth
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

- (void)addSetBySetId:(NSString *)setId
           forClassId:(NSString *)classId
             withAuth:(QuizletAuth *)auth
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;

- (void)deleteSetBySetId:(NSString *)setId
      fromClassByClassId:(NSString *)classId
                withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;

- (void)joinClassByClassId:(NSString *)classId
                  withAuth:(QuizletAuth *)auth
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure;

- (void)leaveClassByClassId:(NSString *)classId
                   withAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;

@end
