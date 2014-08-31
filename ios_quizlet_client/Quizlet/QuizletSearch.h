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
 
 Optional Parameters
 ---------------------
 While all of the parameters below are optional, at least one of q, term or creator must be provided.
 Parameters specified are used as an "AND" operation, e.g. "q=spanish&term=silla" will return spanish sets that contain the term "silla."
 0 or 1. When 1, returns results with partial matching for autocompleting.
 
 Parameter      Type            Description                                                                             Default
 ---------------------------------------------------------------------------------------------------------------------------------
 q              string          Returns sets with titles and/or subjects that match your query.                         -
 term           string          Return sets that have the specified term in them.                                       -
 creator        string          Returns sets created by the specified Quizlet user.                                     -
 images_only	boolean	0 or 1. When 1, limits results to sets with images only.                                        0
 autocomplete	boolean	0
 modified_since	timestamp       Limits results to sets that have been modified since the specified Unix timestamp.      -
 sort           string          Deprecated. The field to sort by. This will cause bad results and should never be used	-
 page           integer         The page of the result set to display.                                                  1
 per_page       integer         The number of sets to display per page (must be between 1 and 50).                      30
 */
- (void)searchSetsWithParameters:(NSDictionary *)dictionary
                        withAuth:(QuizletAuth *)auth
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

/**
 GET: /search/definitions
 Search for definitions.
 
 Required Parameters
 Parameter	Type	Description
 -----------------------------------
 q          string	The search query (case-insensitive).
 
 Optional Parameters
 Parameter	Type	Description                                                                                                                                                                     Default
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 type       string	One of "all", "user", "official" "user".
 limit      integer	Number of definitions to limit of each type. For example, if type is set to "all" and limit is set to 2, you will get 2 user and 2 official definitions (for a total of 4).     10
 */
- (void)searchDefinitionsWithParameters:(NSDictionary *)dictionary
                               withAuth:(QuizletAuth *)auth
                                success:(void (^)(id responseObject))success
                                failure:(void (^)(NSError *error))failure;

/**
 GET: /search/classes
 Search for classes by their title and description.
 
 Required Parameters
 Parameter	Type	Description
 --------------------------------
 q          string	The search query (case-insensitive).
 
 Optional Parameters
 Parameter	Type	Description                                                             Default
 -----------------------------------------------------------------------------------------------------
 page       integer	The page of the result set to display.                                  1
 per_page	integer	The number of classes to display per page (must be between 1 and 50).	30
 */
- (void)searchGroupsWithParameters:(NSDictionary *)dictionary
                          withAuth:(QuizletAuth *)auth
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

/**
 GET: /search/universal
 Search for classes, users, and sets all together
 
 Required Parameters
 Parameter	Type	Description
 --------------------------------
 q          string	The search query (case-insensitive).
 
 Optional Parameters
 Parameter	Type	Description                                                             Default
 -----------------------------------------------------------------------------------------------------
 page       integer	The page of the result set to display.                                  1
 per_page	integer	The number of results to display per page (must be between 1 and 50).	30
 */
- (void)searchUniversalWithParameters:(NSDictionary *)dictionary
                             withAuth:(QuizletAuth *)auth
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

@end
