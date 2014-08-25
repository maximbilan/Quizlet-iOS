//
//  Quizlet.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/17/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quizlet : NSObject

/**
 Client ID (used for public and user access).
 */
@property (nonatomic, strong, readonly) NSString *clientID;

/**
 Secret Key (used for user authentication only).
 */
@property (nonatomic, strong, readonly) NSString *secretKey;

/**
 The "redirect URI" is where our server will redirect users to after they approve (or deny) your application at the authorize endpoint.
 */
@property (nonatomic, strong, readonly) NSString *redirectURI;

/**
 Shared Quizlet object.
 */
+ (Quizlet *)sharedQuizlet;

/**
 Setup the Quizlet client ID, secret key and redirect URI.
 */
- (void)startWithClientID:(NSString *)clientId withSecretKey:(NSString *)secretKey withRedirectURI:(NSString *)redirectURI;

/**
 Checks if the user is authenticated
 */
- (BOOL)isAuthorized;

/**
 Authorization to Quizlet service. Goes to browser, and after entering login and password calls the redirect URI. Auth 2.0.
 */
- (void)authorize:(void (^)(void))success failure:(void (^)(NSError *error))failure;

/**
 You should use in app delegate after redirecting from authorization. This method request an access token from Quizlet authorization server.
 */
- (void)handleURL:(NSURL *)url;

/**
 
 */
- (void)viewClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)viewClassSetsByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)addClassFromDictionary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)editClassWithDictionary:(NSDictionary *)dictionary byClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)deleteClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)addSetBySetId:(NSString *)setId forClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)deleteSetBySetId:(NSString *)setId fromClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)joinClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)leaveClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)searchSetsWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)searchDefinitionsWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)searchGroupsWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)searchUniversalWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /sets/SET_ID
 View complete details (including all terms) of a single set.
 */
- (void)viewSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /sets/SET_ID/terms
 View just the terms in a single set.
 */
- (void)viewSetTermsBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /sets/SET_ID/password
 Submit a password for a password-protected set.
 */
- (void)submitPassword:(NSString *)password forSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /sets
 View complete details of multiple sets at once.
 */
- (void)viewSetsBySetIds:(NSString *)setIds success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)addSetFromDictionary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)editSetWithDictionary:(NSDictionary *)dictionary bySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)deleteSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)addTermFromDictionary:(NSDictionary *)dictionary toSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)editTermWithDictionary:(NSDictionary *)dictionary fromSetBySetId:(NSString *)setId byTermId:(NSString *)termId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 
 */
- (void)deleteTermFromSetBySetId:(NSString *)setId byTermId:(NSString *)termId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /users/USERNAME
 View basic user information, including their sets, favorites, last 25 sessions, etc.
 */
- (void)userDetails:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /users/USERNAME/sets
 View complete details about all the user's created sets.
 */
- (void)userSets:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /users/USERNAME/favorites
 View complete details about all the user's favorited sets.
 */
- (void)userFavorites:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /users/USERNAME/classes
 View complete details about all the classes that the user is a member of.
 */
- (void)userClasses:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /users/USERNAME/studied
 View the last 100 recently studied sessions for a user.
 */
- (void)userStudied:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 PUT: /users/USERNAME/favorites/SET_ID
 Mark a set as a favorite.
 */
- (void)markUserSetAsFavoriteBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 DELETE: /users/USERNAME/favorites/SET_ID
 Unmark a set as a favorite.
 */
- (void)unmarkUserSetAsFavoriteBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
