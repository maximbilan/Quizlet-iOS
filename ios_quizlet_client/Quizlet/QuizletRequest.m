//
//  QuizletRequest.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QuizletRequest.h"

#import "AFNetworking.h"

@implementation QuizletRequest

- (void)POST:(NSString *)urlString
  parameters:(id)parameters
headerFields:(id)headerFields
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    if ([headerFields isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)headerFields;
        [dict enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id key, id object, BOOL *stop) {
            [manager.requestSerializer setValue:object forHTTPHeaderField:key];
        }];
    }
    
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)GET:(NSString *)urlString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)GET:(NSString *)urlString
 parameters:(id)parameters
headerFields:(id)headerFields
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    if ([headerFields isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)headerFields;
        [dict enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id key, id object, BOOL *stop) {
            [manager.requestSerializer setValue:object forHTTPHeaderField:key];
        }];
    }
    
    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
