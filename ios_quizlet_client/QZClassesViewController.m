//
//  QZClassesViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/22/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZClassesViewController.h"
#import "QZExamplesViewController.h"

#import "Quizlet.h"

@interface QZClassesViewController ()

@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UITextField *classIdTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation QZClassesViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    switch (self.exampleId) {
        case QZExamplesViewClass:
        case QZExamplesViewClassSets:
        {
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
            [[Quizlet sharedQuizlet] addClass:dictionary success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesEditClass:
        {
            NSDictionary *dictionary = @{
                                         @"name": @"Class 2",
                                         @"description" : @"Class 2"
                                         };
            [[Quizlet sharedQuizlet] editClass:dictionary byClassId:@"1080268" success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesDeleteClass:
        {
            [[Quizlet sharedQuizlet] deleteClassById:@"1080268" success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesAddSetToClass:
        {
            [[Quizlet sharedQuizlet] addSetBySetId:@"415" forClassId:@"1080268" success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesRemoveSetFromClass:
        {
            [[Quizlet sharedQuizlet] deleteSetBySetId:@"415" fromClassByClassId:@"1080268" success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesJoinClass:
        {
            [[Quizlet sharedQuizlet] joinClassByClassId:@"5" success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesLeaveClass:
        {
            [[Quizlet sharedQuizlet] leaveClassByClassId:@"5" success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        default:
            break;
    }
}

- (IBAction)submitButtonAction:(UIButton *)sender
{
    [self.classIdTextField resignFirstResponder];
    
    if (self.classIdTextField.text.length > 0) {
        switch (self.exampleId) {
            case QZExamplesViewClass:
            {
                [[Quizlet sharedQuizlet] viewClassById:self.classIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
                }];
            }
            break;
                
            case QZExamplesViewClassSets:
            {
                [[Quizlet sharedQuizlet] viewClassSetsById:self.classIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
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
