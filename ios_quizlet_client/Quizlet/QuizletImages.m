//
//  QuizletImages.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/19/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QuizletImages.h"
#import "QuizletConfig.h"
#import "QuizletAuth.h"
#import "QuizletRequest.h"

#import "AFNetworking.h"

@implementation QuizletImages

- (void)uploadImageFromURL:(NSURL *)url
                  withAuth:(QuizletAuth *)auth
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure
{
    NSDictionary *headerFields = [auth headerFieldsWithAccessToken];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    if ([headerFields isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)headerFields;
        [dict enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id key, id object, BOOL *stop) {
            [manager.requestSerializer setValue:object forHTTPHeaderField:key];
        }];
    }
    
    NSArray *formData = @[url, url, url];
    NSString *urlString = [NSString stringWithFormat:@"%@/images", QuizletAPIBaseUrl];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request POSTmultiPart:urlString
                parameters:nil
              headerFields:headerFields
              formDataName:@"imageData[]"
                  formData:formData
                   success:^(id responseObject) {
                       success(responseObject);
                   } failure:^(NSError *error) {
                       failure(error);
                   }];
}

@end
