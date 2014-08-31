//
//  Quizlet.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/17/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 The Quizlet API lets you create, search, and modify flashcard sets and classes, and much more in your own application.
 */
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
 Checks if the user is authenticated?
 */
- (BOOL)isAuthorized;

/**
 Checks if the user has free account type
 */
- (BOOL)isFreeAccountType;

/**
 Checks if the user has plus account type
 */
- (BOOL)isPlusAccountType;

/**
 Authorization to Quizlet service. Goes to browser, and after entering login and password calls the redirect URI. Auth 2.0.
 */
- (void)authorize:(void (^)(void))success failure:(void (^)(NSError *error))failure;

/**
 You should use in app delegate after redirecting from authorization. This method request an access token from Quizlet authorization server.
 */
- (void)handleURL:(NSURL *)url;

/**
 GET: /classes/CLASS_ID
 View a single class.
 */
- (void)viewClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /classes/CLASS_ID/sets
 View full details of all sets in a class.
 */
- (void)viewClassSetsByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

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
- (void)addClassFromDictionary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

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
- (void)editClassWithDictionary:(NSDictionary *)dictionary byClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 DELETE: /classes/CLASS_ID
 Delete a class.
 */
- (void)deleteClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 PUT: /classes/CLASS_ID/sets/SET_ID
 Add a set to a class.
 */
- (void)addSetBySetId:(NSString *)setId forClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 DELETE: /classes/CLASS_ID/sets/SET_ID
 Remove a set from a class.
 */
- (void)deleteSetBySetId:(NSString *)setId fromClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 PUT: /classes/CLASS_ID/members/USERNAME
 Join (or apply to join) a class.
 */
- (void)joinClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 DELETE: /classes/CLASS_ID/members/USERNAME
 Leave a class.
 */
- (void)leaveClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 POST: /images
 Upload one or more images
 
 Parameter      Type	Description
 imageData[]	array	An array of one or more images.
 */
- (void)uploadImageFromURL:(NSURL *)url success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

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
- (void)searchSetsWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

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
- (void)searchDefinitionsWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

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
- (void)searchGroupsWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

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
 
 Required Parameters
 Parameter	Type	Description
 --------------------------------
 password	string	The password for the set
 */
- (void)submitPassword:(NSString *)password forSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 GET: /sets
 View complete details of multiple sets at once.
 */
- (void)viewSetsBySetIds:(NSString *)setIds success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 POST: /sets
 Add a new set
 
 Parameters:
 title
 terms (array)
 definitions (array)
 images(array)
 lang_terms
 lang_definitions
 description
 subjects (array)
 allow_discussion
 visibility
 editable
 groups (array)
 password
 */
- (void)addSetFromDictionary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 PUT: /sets/SET_ID
 Edit an existing set
 
 Parameters:
 title
 terms (array)
 definitions (array)
 images[+]
 lang_terms
 lang_definitions
 description
 subjects (array)
 allow_discussion
 visibility
 editable
 groups (array)
 password
 term_ids (array)
 */
- (void)editSetWithDictionary:(NSDictionary *)dictionary bySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 DELETE: /sets/SET_ID
 Delete an existing set
 */
- (void)deleteSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 POST: /sets/SET_ID/terms
 Add a single term to a set
 
 Parameters:
 term
 definition
 position
 */
- (void)addTermFromDictionary:(NSDictionary *)dictionary toSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 PUT: /sets/SET_ID/terms/TERM_ID
 Edit a single term within a set
 
 Parameters:
 term
 definition
 image
 */
- (void)editTermWithDictionary:(NSDictionary *)dictionary fromSetBySetId:(NSString *)setId byTermId:(NSString *)termId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 DELETE: /sets/SET_ID/terms/TERM_ID
 Delete a single term within a set
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
