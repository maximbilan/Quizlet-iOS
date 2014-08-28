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

#import "AFNetworking.h"

@implementation QuizletImages

- (void)uploadImageFromURL:(NSURL *)url
                  withAuth:(QuizletAuth *)auth
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure
{
    NSDictionary *headerFields = nil;
    headerFields = [auth headerFieldsWithAccessToken];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    if ([headerFields isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)headerFields;
        [dict enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id key, id object, BOOL *stop) {
            [manager.requestSerializer setValue:object forHTTPHeaderField:key];
        }];
    }
    
//    UIImage *image = [UIImage imageNamed:@"image1.jpg"];
//    
//    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"image1" withExtension:@"jpg"];
//    
//    NSData *imageData = UIImageJPEGRepresentation(image, 0.9);
//    
//    NSDictionary *parameters = @{ @"imageData": @[[url1 absoluteString]] };
//    
//    [manager POST:[NSString stringWithFormat:@"%@/images", QuizletAPIBaseUrl] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileURL:url1 name:@"imageData" error:nil];
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"Success: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"image1" withExtension:@"jpg"];
    
    //NSDictionary *parameters = @{@"foo": @"bar"};
    //NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image1.jpg"];
    //NSDictionary *parameters = @{ @"imageData": @[@"image1.jpg", @"image1.jpg", @"image1.jpg"] };
    
    //[manager POST:[NSString stringWithFormat:@"%@/images", QuizletAPIBaseUrl] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [manager POST:@"http://wapshop.gameloft.com/_test/alex/hlo.php" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSError *error = nil;
        [formData appendPartWithFileURL:url1 name:@"imageData" error:&error];
        
        int a;
        a = 0;
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
//    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"image1" withExtension:@"jpg"];
//    NSArray *filesToUpload = @[url1, url1, url1];
//    
//    
//    NSMutableArray *mutableOperations = [NSMutableArray array];
//    for (NSURL *fileURL in filesToUpload) {
//        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST"
//                                                                                           URLString:[NSString stringWithFormat:@"%@/images", QuizletAPIBaseUrl]
//                                                                                          parameters:nil
//                                                                           constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//            [formData appendPartWithFileURL:fileURL name:@"imageData" error:nil];
//        }];
//        
//        if ([headerFields isKindOfClass:[NSDictionary class]]) {
//            NSDictionary *dict = (NSDictionary *)headerFields;
//            [dict enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id key, id object, BOOL *stop) {
//                [request setValue:object forHTTPHeaderField:key];
//            }];
//        }
//
//        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//        
//        [mutableOperations addObject:operation];
//    }
//    
//    NSArray *operations = [AFURLConnectionOperation batchOfRequestOperations:mutableOperations progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
//        NSLog(@"%lu of %lu complete", (unsigned long)numberOfFinishedOperations, (unsigned long)totalNumberOfOperations);
//    } completionBlock:^(NSArray *operations) {
//        NSLog(@"All operations in batch complete");
//    }];
//    [[NSOperationQueue mainQueue] addOperations:operations waitUntilFinished:NO];
    
    
//    UIImage *image = [UIImage imageNamed:@"image1.jpg"];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/images", QuizletAPIBaseUrl]]];
//    
//    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
//    
//    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
//    [request setHTTPShouldHandleCookies:NO];
//    [request setTimeoutInterval:60];
//    [request setHTTPMethod:@"POST"];
//    
//    NSString *boundary = @"unique-consistent-string";
//    
//    // set Content-Type in HTTP header
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
//    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
//    
//    // post body
//    NSMutableData *body = [NSMutableData data];
//    
//    // add params (all params are strings)
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@\r\n\r\n", @"imageCaption"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"%@\r\n", @"Some Caption"] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    // add image data
//    if (imageData) {
//        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; imageData[]=%@; filename=image1.jpg\r\n", @"imageFormKey"] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:imageData];
//        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    }
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    // setting the body of the post to the reqeust
//    [request setHTTPBody:body];
//    
//    // set the content-length
//    NSString *postLength = [NSString stringWithFormat:@"%d", [body length]];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    
//    if ([headerFields isKindOfClass:[NSDictionary class]]) {
//        NSDictionary *dict = (NSDictionary *)headerFields;
//        [dict enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id key, id object, BOOL *stop) {
//            [request setValue:object forHTTPHeaderField:key];
//        }];
//    }
//
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//        if(data.length > 0)
//        {
//            //success
//        }
//    }];
}

@end
