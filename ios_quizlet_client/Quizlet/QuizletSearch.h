//
//  QuizletSearch.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/19/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizletAuth;

/**
 Quizlet Searching API
 */
@interface QuizletSearch : NSObject

/**
 GET: /search/sets
 Search for sets by title, description or term. Returns limited information.
 
 Parameters:
 q
 term
 creator
 images_only
 autocomplete
 modified_since
 sort
 page
 per_page
 */
- (void)searchSetsWithParameters:(NSDictionary *)dictionary
                        withAuth:(QuizletAuth *)auth
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

/**
 GET: /search/definitions
 Search for definitions.
 
 Parameters:
 q
 type
 limit
 */
- (void)searchDefinitionsWithParameters:(NSDictionary *)dictionary
                               withAuth:(QuizletAuth *)auth
                                success:(void (^)(id responseObject))success
                                failure:(void (^)(NSError *error))failure;

/**
 GET: /search/classes
 Search for classes by their title and description.
 
 Parameters:
 q
 page
 per_page
 */
- (void)searchGroupsWithParameters:(NSDictionary *)dictionary
                          withAuth:(QuizletAuth *)auth
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

/**
 GET: /search/universal
 Search for classes, users, and sets all together
 
 Parameters:
 q
 page
 per_page
 */
- (void)searchUniversalWithParameters:(NSDictionary *)dictionary
                             withAuth:(QuizletAuth *)auth
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

@end
