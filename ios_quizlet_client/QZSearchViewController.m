//
//  QZSearchViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/22/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZSearchViewController.h"
#import "QZExamplesViewController.h"

#import "WaitSpinner.h"

#import "Quizlet.h"

@interface QZSearchViewController ()
{
    WaitSpinner *waitSpinner;
}

@property (weak, nonatomic) IBOutlet UITextView *logTextView;

@end

@implementation QZSearchViewController

#pragma mark - View Controller Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    waitSpinner = [[WaitSpinner alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    [waitSpinner showInView:self.view];
    
    switch (self.exampleId) {
        case QZExamplesSearchSets:
        {
            NSDictionary *parameters = @{@"creator": @"putinhuylo"};
            
            [[Quizlet sharedQuizlet] searchSetsWithParameters:parameters success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesSearchDefinitions:
        {
            [[Quizlet sharedQuizlet] searchDefinitionsWithParameters:nil success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesSearchClasses:
        {
            [[Quizlet sharedQuizlet] searchGroupsWithParameters:nil success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesSearchUniversal:
        {
            [[Quizlet sharedQuizlet] searchUniversalWithParameters:nil success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [waitSpinner hide];
            }];
        }
        break;
    }
}

@end
