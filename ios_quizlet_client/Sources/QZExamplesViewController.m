//
//  QZExamplesViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/20/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZExamplesViewController.h"
#import "QZExamplesTableViewCell.h"
#import "QZUsersViewController.h"
#import "QZSetsViewController.h"
#import "QZSearchViewController.h"
#import "QZClassesViewController.h"
#import "QZImagesViewController.h"

#import "Quizlet.h"

static NSString * const QZExamplesTitles[] = {
    @"GET /classes/CLASS_ID",
    @"GET /classes/CLASS_ID/sets",
    @"POST /classes",
    @"PUT /classes/CLASS_ID",
    @"DELETE /classes/CLASS_ID",
    @"PUT /classes/CLASS_ID/sets/SET_ID",
    @"DELETE /classes/CLASS_ID/sets/SET_ID",
    @"PUT /classes/CLASS_ID/members/USERNAME",
    @"DELETE /classes/CLASS_ID/members/USERNAME",
    @"POST /images",
    @"GET /search/sets",
    @"GET /search/definitions",
    @"GET /search/classes",
    @"GET /search/universal",
    @"GET /sets/SET_ID",
    @"GET /sets/SET_ID/terms",
    @"GET /sets/SET_ID/password",
    @"GET /sets",
    @"POST /sets",
    @"PUT /sets/SET_ID",
    @"DELETE /sets/SET_ID",
    @"POST /sets/SET_ID/terms",
    @"PUT /sets/SET_ID/terms/TERM_ID",
    @"DELETE /sets/SET_ID/terms/TERM_ID",
    @"GET /users/USERNAME",
    @"GET /users/USERNAME/sets",
    @"GET /users/USERNAME/favorites",
    @"GET /users/USERNAME/classes",
    @"GET /users/USERNAME/studied",
    @"PUT /users/USERNAME/favorites/SET_ID",
    @"DELETE /users/USERNAME/favorites/SET_ID"
};

static NSString * const QZExamplesDescrs[] = {
    @"View a single class.",
    @"View full details of all sets in a class.",
    @"Add a new class.",
    @"Edit a class.",
    @"Delete a class.",
    @"Add a set to a class.",
    @"Remove a set from a class.",
    @"Join (or apply to join) a class.",
    @"Leave a class.",
    @"Upload one or more images.",
    @"Search for sets by title, description or term. Returns limited information.",
    @"Search for definitions.",
    @"Search for classes by their title and description.",
    @"Search for classes, users, and sets all together",
    @"View complete details (including all terms) of a single set.",
    @"View just the terms in a single set.",
    @"Submit a password for a password-protected set.",
    @"View complete details of multiple sets at once.",
    @"Add a new set",
    @"Edit an existing set",
    @"Delete an existing set",
    @"Add a single term to a set",
    @"Edit a single term within a set",
    @"Delete a single term within a set",
    @"View basic user information, including their sets, favorites, last 25 sessions, etc.",
    @"View complete details about all the user's created sets.",
    @"View complete details about all the user's favorited sets.",
    @"View complete details about all the classes that the user is a member of.",
    @"View the last 100 recently studied sessions for a user.",
    @"Mark a set as a favorite.",
    @"Unmark a set as a favorite."
};

@interface QZExamplesViewController ()
{
    NSInteger examplesCount;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginButton;

@end

@implementation QZExamplesViewController

#pragma mark - View Controller Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    examplesCount = 0;
    self.loginButton.enabled = YES;
}

#pragma mark - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return examplesCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QZExamplesTableViewCell *cell = (QZExamplesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"QZExamplesCustomCell"
                                                                                               forIndexPath:indexPath];
    cell.titleLabel.text = QZExamplesTitles[indexPath.row];
    cell.descrLabel.text = QZExamplesDescrs[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case QZExamplesViewClass:
        case QZExamplesViewClassSets:
        case QZExamplesAddClass:
        case QZExamplesEditClass:
        case QZExamplesDeleteClass:
        case QZExamplesAddSetToClass:
        case QZExamplesRemoveSetFromClass:
        case QZExamplesJoinClass:
        case QZExamplesLeaveClass:
        {
            QZClassesViewController *classesViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"classesViewControllerId"];
            classesViewController.exampleId = indexPath.row;
            [self.navigationController pushViewController:classesViewController animated:YES];
        }
        break;
            
        case QZExamplesUploadImage:
        {
            QZImagesViewController *imagesViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"imagesViewControllerId"];
            [self.navigationController pushViewController:imagesViewController animated:YES];
        }
        break;
        
        case QZExamplesUserDetails:
        case QZExamplesUserSets:
        case QZExamplesUserFavorites:
        case QZExamplesUserClasses:
        case QZExamplesUserStudied:
        case QZExamplesMarkSetAsFavorite:
        case QZExamplesUnmarkSetAsFavorite:
        {
            QZUsersViewController *usersViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"usersViewControllerId"];
            usersViewController.exampleId = indexPath.row;
            [self.navigationController pushViewController:usersViewController animated:YES];
        }
        break;
            
        case QZExamplesViewSet:
        case QZExamplesViewSetTerms:
        case QZExamplesSubmitSetPassword:
        case QZExamplesViewSets:
        case QZExamplesAddSet:
        case QZExamplesEditSet:
        case QZExamplesDeleteSet:
        case QZExamplesAddTermToSet:
        case QZExamplesEditTermFromSet:
        case QZExamplesDeleteTermFromSet:
        {
            QZSetsViewController *setsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"setsViewControllerId"];
            setsViewController.exampleId = indexPath.row;
            [self.navigationController pushViewController:setsViewController animated:YES];
        }
        break;
            
        case QZExamplesSearchSets:
        case QZExamplesSearchDefinitions:
        case QZExamplesSearchClasses:
        case QZExamplesSearchUniversal:
        {
            QZSearchViewController *searchViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"searchViewControllerId"];
            searchViewController.exampleId = indexPath.row;
            [self.navigationController pushViewController:searchViewController animated:YES];
        }
        break;
            
        default:
            break;
    }
}

#pragma mark - Actions

- (IBAction)loginButtonAction:(UIBarButtonItem *)sender
{
    [[Quizlet sharedQuizlet] authorize:^(void) {
        self.loginButton.enabled = NO;
        examplesCount = QZExamplesCount;
        [self.tableView reloadData];
        NSLog(@"User was authorized");
    } failure:^(NSError *error) {
        NSLog(@"User wasn't authorized");
    }];
}

@end
