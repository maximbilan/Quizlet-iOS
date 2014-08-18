//
//  Quizlet.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/17/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define QUIZLET_LOG

@class QuizletAuth;
@class QuizletUsers;

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
 User authentication object (OAuth 2.0)
 */
@property (nonatomic, strong, readonly) QuizletAuth *auth;

/**
 Shared Quizlet object.
 */
+ (Quizlet *)sharedQuizlet;

/**
 */
- (void)startWithClientID:(NSString *)clientId withSecretKey:(NSString *)secretKey withRedirectURI:(NSString *)redirectURI;

/**
 */
- (void)authorize;

/**
 */
- (void)handleURL:(NSURL *)url;


- (void)userDetails;

- (void)userSets;

@end
