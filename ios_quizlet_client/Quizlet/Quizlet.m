//
//  Quizlet.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/17/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "Quizlet.h"
#import "QuizletConfig.h"
#import "QuizletAuth.h"
#import "QuizletUsers.h"
#import "QuizletSets.h"
#import "QuizletSearch.h"
#import "QuizletClasses.h"

@interface Quizlet ()

@property (nonatomic, strong, readwrite) NSString *clientID;
@property (nonatomic, strong, readwrite) NSString *secretKey;
@property (nonatomic, strong, readwrite) NSString *redirectURI;
@property (nonatomic, strong, readwrite) QuizletAuth *auth;
@property (nonatomic, strong, readwrite) QuizletUsers *users;
@property (nonatomic, strong, readwrite) QuizletSets *sets;
@property (nonatomic, strong, readwrite) QuizletSearch *search;
@property (nonatomic, strong, readwrite) QuizletClasses *classes;

@end

@implementation Quizlet

#pragma mark - Common

+ (Quizlet *)sharedQuizlet
{
    static dispatch_once_t once_token;
    static Quizlet *quizlet = nil;
    dispatch_once(&once_token, ^{
        quizlet = [[self alloc] init];
    });
    
    return quizlet;
}

- (void)dealloc
{
    self.clientID = nil;
    self.secretKey = nil;
    self.redirectURI = nil;
    self.auth = nil;
    self.users = nil;
    self.sets = nil;
    self.search = nil;
    self.classes = nil;
}

#pragma mark - Setup

- (void)startWithClientID:(NSString *)clientId withSecretKey:(NSString *)secretKey withRedirectURI:(NSString *)redirectURI
{
    self.clientID = clientId;
    self.secretKey = secretKey;
    self.redirectURI = redirectURI;
    self.auth = [[QuizletAuth alloc] init];
    self.users = [[QuizletUsers alloc] init];
    self.sets = [[QuizletSets alloc] init];
    self.search = [[QuizletSearch alloc] init];
    self.classes = [[QuizletClasses alloc] init];
}

#pragma mark - Authorization

- (BOOL)isAuthorized
{
    return self.auth.isAuthorized;
}

- (void)authorize:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    self.auth.authSuccess = success;
    self.auth.authFailure = failure;
    
    if (self.auth.accessToken && self.auth.userId) {
        [[Quizlet sharedQuizlet] userDetails:^(id responseObject) {
#ifdef QUIZLET_LOG
            NSLog(@"%@", responseObject);
#endif
            NSDictionary *responseDictionary = (NSDictionary *)responseObject;
            if (responseDictionary) {
                [self.auth determineAccoutTypeFromString:responseDictionary[@"account_type"]];
            }
            self.auth.isAuthorized = YES;
            success();
        } failure:^(NSError *error) {
#ifdef QUIZLET_LOG
            NSLog(@"%@", error);
#endif
            self.auth.isAuthorized = NO;
            [self.auth redirectToAuthServerWithClientID:self.clientID];
        }];
    }
    else {
        self.auth.isAuthorized = NO;
        [self.auth redirectToAuthServerWithClientID:self.clientID];
    }
}

- (BOOL)isFreeAccountType
{
    return (self.auth.accountType == QuizletAccountFree);
}

- (BOOL)isPlusAccountType
{
    return (self.auth.accountType == QuizletAccountPlus);
}

- (void)handleURL:(NSURL *)url
{
    NSString *res = [url resourceSpecifier];
    
    NSRange r = [res rangeOfString:@"?"];
    NSString *action = r.length ? [res substringToIndex:r.location] : res;
    NSString *paramsQuery = r.length ? [res substringFromIndex:r.location + 1] : nil;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSArray *keyVars = [paramsQuery componentsSeparatedByString:@"&"];
    for (NSString *keyVar in keyVars) {
        NSArray *a = [keyVar componentsSeparatedByString:@"="];
        if ([a count] == 2) {
            params[[a[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] =
            [a[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
    }
    
#ifdef QUIZLET_LOG
    NSLog(@"URL detected:");
    NSLog(@"  action: %@", action);
    NSLog(@"  params: %@", params);
#endif
    
    if (params[@"code"]) {
        NSString *code = params[@"code"];
        if (code.length > 0) {
            [self.auth requestTokenFromAuthServerWithClientID:self.clientID
                                                withSecretKey:self.secretKey
                                                     withCode:code];
        }
    }
}

#pragma mark - Classes API

- (void)viewClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.classes viewClassByClassId:classId withAuth:self.auth success:success failure:failure];
}

- (void)viewClassSetsByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.classes viewClassSetsByClassId:classId withAuth:self.auth success:success failure:failure];
}

- (void)addClassFromDictionary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.classes addClassFromDictionary:dictionary withAuth:self.auth success:success failure:failure];
}

- (void)editClassWithDictionary:(NSDictionary *)dictionary byClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.classes editClassWithDictionary:dictionary byClassId:classId withAuth:self.auth success:success failure:failure];
}

- (void)deleteClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.classes deleteClassByClassId:classId withAuth:self.auth success:success failure:failure];
}

- (void)addSetBySetId:(NSString *)setId forClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.classes addSetBySetId:setId forClassId:classId withAuth:self.auth success:success failure:failure];
}

- (void)deleteSetBySetId:(NSString *)setId fromClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.classes deleteSetBySetId:setId fromClassByClassId:classId withAuth:self.auth success:success failure:failure];
}

- (void)joinClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.classes joinClassByClassId:classId withAuth:self.auth success:success failure:failure];
}

- (void)leaveClassByClassId:(NSString *)classId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.classes leaveClassByClassId:classId withAuth:self.auth success:success failure:failure];
}

#pragma mark - Search API

- (void)searchSetsWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.search searchSetsWithParameters:dictionary withAuth:self.auth success:success failure:failure];
}

- (void)searchDefinitionsWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.search searchDefinitionsWithParameters:dictionary withAuth:self.auth success:success failure:failure];
}

- (void)searchGroupsWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.search searchGroupsWithParameters:dictionary withAuth:self.auth success:success failure:failure];
}

- (void)searchUniversalWithParameters:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.search searchUniversalWithParameters:dictionary withAuth:self.auth success:success failure:failure];
}

#pragma mark - Sets API

- (void)viewSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets viewSetBySetId:setId withAuth:self.auth success:success failure:failure];
}

- (void)viewSetTermsBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets viewSetTermsBySetId:setId withAuth:self.auth success:success failure:failure];
}

- (void)submitPassword:(NSString *)password forSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets submitPassword:setId forSetBySetId:password withAuth:self.auth success:success failure:failure];
}

- (void)viewSetsBySetIds:(NSString *)setIds success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets viewSetsBySetIds:setIds withAuth:self.auth success:success failure:failure];
}

- (void)addSetFromDictionary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets addSetFromDictionary:dictionary withAuth:self.auth success:success failure:failure];
}

- (void)editSetWithDictionary:(NSDictionary *)dictionary bySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets editSetFromDictionary:dictionary bySetId:setId withAuth:self.auth success:success failure:failure];
}

- (void)deleteSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets deleteSetBySetId:setId withAuth:self.auth success:success failure:failure];
}

- (void)addTermFromDictionary:(NSDictionary *)dictionary toSetBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets addTermFromDictionary:dictionary toSetBySetId:setId withAuth:self.auth success:success failure:failure];
}

- (void)editTermWithDictionary:(NSDictionary *)dictionary fromSetBySetId:(NSString *)setId byTermId:(NSString *)termId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets editTermFromDictionary:dictionary fromSetBySetId:setId byTermId:termId withAuth:self.auth success:success failure:failure];
}

- (void)deleteTermFromSetBySetId:(NSString *)setId byTermId:(NSString *)termId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets deleteTermFromSetBySetId:setId byTermId:termId withAuth:self.auth success:success failure:failure];
}

#pragma mark - Users API

- (void)userDetails:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users userDetailsWithAuth:self.auth success:success failure:failure];
}

- (void)userSets:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users setsWithAuth:self.auth success:success failure:failure];
}

- (void)userFavorites:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users favoritesWithAuth:self.auth success:success failure:failure];
}

- (void)userClasses:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users classesWithAuth:self.auth success:success failure:failure];
}

- (void)userStudied:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users studiedWithAuth:self.auth success:success failure:failure];
}

- (void)markUserSetAsFavoriteBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users markUserSetAsFavoriteBySetId:setId withAuth:self.auth success:success failure:failure];
}

- (void)unmarkUserSetAsFavoriteBySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users unmarkUserSetAsFavoriteBySetId:setId withAuth:self.auth success:success failure:failure];
}

@end
