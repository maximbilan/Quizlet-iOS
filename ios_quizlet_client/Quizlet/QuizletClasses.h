//
//  QuizletClasses.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/19/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

#import <Foundation/Foundation.h>

@class QuizletAuth;

/**
 Quizlet Classes API
 */
@interface QuizletClasses : NSObject

/**
 GET: /classes/CLASS_ID
 View a single class.
 */
- (void)viewClassByClassId:(NSString *)classId
                  withAuth:(QuizletAuth *)auth
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure;

/**
 GET: /classes/CLASS_ID/sets
 View full details of all sets in a class.
 */
- (void)viewClassSetsByClassId:(NSString *)classId
                      withAuth:(QuizletAuth *)auth
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

/**
 POST: /classes
 Add a new class.
 
 Required Parameters
 Parameter          Type	Description
 ---------------------------------------
 name               string	The name of the class
 description        string	A description of what the class is about and who it's for.
 school_id          integer	The id of the school to which this class belongs. Either this must be specified, or new_school_name, city, state, and country must be specified in the case of a new school
 new_school_name	string	The name of the school to which this class belongs. Either this must be specified, or school_id must be specified if the school already exists
 city               string	The city of the school to which this class belongs. Either this must be specified, or school_id must be specified if the school already exists
 state              string	The 2 digit state code of the school to which this class belongs. This is only required for US schools
 country            string	The country of the school to which this class belongs. Either this must be specified, or school_id must be specified if the school already exists
 
 Optional Parameters
 Parameter              Type            Description                                                                 Default
 ---------------------------------------------------------------------------------------------------------------------------
 allow_discussion       boolean	0 or 1. Flag of whether users are allowed to use the discussion box on this class.	1
 allow_member_add_sets	boolean         Deprecated
 is_public              boolean         Deprecated
 password               boolean         Deprecated
 */
- (void)addClassFromDictionary:(NSDictionary *)dictionary
                      withAuth:(QuizletAuth *)auth
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

/**
 PUT: /classes/CLASS_ID
 Edit a class.
 
 Required Parameters
 ---------------------
 There are no specific required parameters - but if you do not send any parameters at all, the response will be 400-level error (as there is nothing to update).
 
 Optional Parameters
 Parameter              Type            Description
 ---------------------------------------------------
 name                   string          The name of the class.
 description            string          Block of text describing the class.
 allow_discussion       boolean	0 or 1. Flag of whether users are allowed to use the discussion box on this class.
 admin_only             boolean	0 or 1. Flag of whether non-admin users are allowed to invite other members and add sets to this class.
 allow_member_add_sets	boolean         Deprecated
 is_public              boolean         Deprecated
 password               boolean         Deprecated
 */
- (void)editClassWithDictionary:(NSDictionary *)dictionary
                      byClassId:(NSString *)classId
                       withAuth:(QuizletAuth *)auth
                        success:(void (^)(id responseObject))success
                        failure:(void (^)(NSError *error))failure;

/**
 DELETE: /classes/CLASS_ID
 Delete a class.
 */
- (void)deleteClassByClassId:(NSString *)classId
                    withAuth:(QuizletAuth *)auth
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/**
 PUT: /classes/CLASS_ID/sets/SET_ID
 Add a set to a class.
 */
- (void)addSetBySetId:(NSString *)setId
           forClassId:(NSString *)classId
             withAuth:(QuizletAuth *)auth
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;

/**
 DELETE: /classes/CLASS_ID/sets/SET_ID
 Remove a set from a class.
 */
- (void)deleteSetBySetId:(NSString *)setId
      fromClassByClassId:(NSString *)classId
                withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;

/**
 PUT: /classes/CLASS_ID/members/USERNAME
 Join (or apply to join) a class.
 */
- (void)joinClassByClassId:(NSString *)classId
                  withAuth:(QuizletAuth *)auth
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure;

/**
 DELETE: /classes/CLASS_ID/members/USERNAME
 Leave a class.
 */
- (void)leaveClassByClassId:(NSString *)classId
                   withAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;

@end
