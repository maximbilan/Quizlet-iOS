//
//  QZClassesViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/22/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZClassesViewController.h"
#import "QZExamplesViewController.h"

#import "WaitSpinner.h"

#import "Quizlet.h"

@interface QZClassesViewController ()

@property (strong, nonatomic) WaitSpinner *waitSpinner;
@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UITextField *classIdTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation QZClassesViewController

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
	
	__weak QZClassesViewController *weakSelf = self;
	
    switch (self.exampleId) {
        case QZExamplesViewClass:
        case QZExamplesViewClassSets:
        {
            [self.waitSpinner hide];
            self.classIdTextField.hidden = NO;
            self.submitButton.hidden = NO;
        }
        break;
            
        case QZExamplesAddClass:
        {
            NSDictionary *dictionary = @{
                                         @"name": @"Class 1",
                                         @"description" : @"Class 1"
                                        };
            [[Quizlet sharedQuizlet] addClassFromDictionary:dictionary success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesEditClass:
        {
            NSDictionary *dictionary = @{
                                         @"name": @"Class 2",
                                         @"description" : @"Class 2"
                                         };
            [[Quizlet sharedQuizlet] editClassWithDictionary:dictionary byClassId:@"1080268" success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesDeleteClass:
        {
            [[Quizlet sharedQuizlet] deleteClassByClassId:@"1080268" success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesAddSetToClass:
        {
            [[Quizlet sharedQuizlet] addSetBySetId:@"415" forClassId:@"1080268" success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesRemoveSetFromClass:
        {
            [[Quizlet sharedQuizlet] deleteSetBySetId:@"415" fromClassByClassId:@"1080268" success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesJoinClass:
        {
            [[Quizlet sharedQuizlet] joinClassByClassId:@"5" success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesLeaveClass:
        {
            [[Quizlet sharedQuizlet] leaveClassByClassId:@"5" success:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        default:
            break;
    }
}

#pragma mark - Actions

- (IBAction)submitButtonAction:(UIButton *)sender
{
    [self.classIdTextField resignFirstResponder];
    
    if (self.classIdTextField.text.length > 0) {
        
        [self.waitSpinner showInView:self.view];
		
		__weak QZClassesViewController *weakSelf = self;
		
        switch (self.exampleId) {
            case QZExamplesViewClass:
            {
                [[Quizlet sharedQuizlet] viewClassByClassId:self.classIdTextField.text success:^(id responseObject) {
                    weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
					[weakSelf.waitSpinner hide];
                } failure:^(NSError *error) {
                    weakSelf.logTextView.text = [error description];
                    [weakSelf.waitSpinner hide];
                }];
            }
            break;
                
            case QZExamplesViewClassSets:
            {
                [[Quizlet sharedQuizlet] viewClassSetsByClassId:self.classIdTextField.text success:^(id responseObject) {
                    weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                    [weakSelf.waitSpinner hide];
                } failure:^(NSError *error) {
                    weakSelf.logTextView.text = [error description];
                    [weakSelf.waitSpinner hide];
                }];
            }
            break;
                
            default:
                break;
        }
        
        self.classIdTextField.hidden = YES;
        self.submitButton.hidden = YES;
    }
}

@end
