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

- (void)addClass:(NSDictionary *)dictionary
        withAuth:(QuizletAuth *)auth
         success:(void (^)(id responseObject))success
         failure:(void (^)(NSError *error))failure;

- (void)editClass:(NSDictionary *)dictionary
        byClassId:(NSString *)classId
         withAuth:(QuizletAuth *)auth
          success:(void (^)(id responseObject))success
          failure:(void (^)(NSError *error))failure;

- (void)deleteClassById:(NSString *)classId
               withAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure;

- (void)addSetBySetId:(NSString *)setId
           forClassId:(NSString *)classId
             withAuth:(QuizletAuth *)auth
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;

- (void)deleteSetBySetId:(NSString *)setid
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
