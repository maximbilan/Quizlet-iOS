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

@property (nonatomic) WaitSpinner *waitSpinner;
@property (weak, nonatomic) IBOutlet UITextView *logTextView;

@end

@implementation QZSearchViewController

#pragma mark - View Controller Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.waitSpinner = [[WaitSpinner alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    [self.waitSpinner showInView:self.view];
	
	__weak QZSearchViewController *weakSelf = self;
	
    switch (self.exampleId) {
        case QZExamplesSearchSets:
        {
            NSDictionary *parameters = @{@"creator": @"putinhuylo"};
            
            [[Quizlet sharedQuizlet] searchSetsWithParameters:parameters success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesSearchDefinitions:
        {
            [[Quizlet sharedQuizlet] searchDefinitionsWithParameters:nil success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesSearchClasses:
        {
            [[Quizlet sharedQuizlet] searchGroupsWithParameters:nil success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesSearchUniversal:
        {
            [[Quizlet sharedQuizlet] searchUniversalWithParameters:nil success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
    }
}

@end
