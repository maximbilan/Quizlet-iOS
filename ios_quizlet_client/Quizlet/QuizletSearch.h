//
//  QuizletSearch.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/19/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizletAuth;

@interface QuizletSearch : NSObject

- (void)searchSetsWithParameters:(NSDictionary *)dictionary
                        withAuth:(QuizletAuth *)auth
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

- (void)searchDefinitionsWithParameters:(NSDictionary *)dictionary
                               withAuth:(QuizletAuth *)auth
                                success:(void (^)(id responseObject))success
                                failure:(void (^)(NSError *error))failure;

- (void)searchGroupsWithParameters:(NSDictionary *)dictionary
                          withAuth:(QuizletAuth *)auth
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

- (void)searchUniversalWithParameters:(NSDictionary *)dictionary
                             withAuth:(QuizletAuth *)auth
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

@end
