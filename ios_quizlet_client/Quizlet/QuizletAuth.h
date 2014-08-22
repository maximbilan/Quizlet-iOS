//
//  QuizletAuth.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QuizletScope.h"

typedef void(^QuizletAuthCompletionSuccess)(void);
typedef void(^QuizletAuthCompletionFailure)(NSError *error);

@interface QuizletAuth : NSObject

@property (nonatomic, strong, readonly) NSString *accessToken;
@property (nonatomic, readonly) double expiresIn;
@property (nonatomic, readonly) QuizletScope scope;
@property (nonatomic, strong, readonly) NSString *tokenType;
@property (nonatomic, strong, readonly) NSString *userId;

@property (nonatomic, readwrite) BOOL isAuthorized;
@property (nonatomic, weak, readwrite) QuizletAuthCompletionSuccess authSuccess;
@property (nonatomic, weak, readwrite) QuizletAuthCompletionFailure authFailure;

- (void)redirectToAuthServerWithClientID:(NSString *)clientID;
- (void)requestTokenFromAuthServerWithClientID:(NSString *)clientID withSecretKey:(NSString *)secretKey withCode:(NSString *)code;

- (NSDictionary *)headerFieldsWithAccessToken;

@end
