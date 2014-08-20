//
//  QZExamplesViewController.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/20/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, QZExamples)
{
    QZExamplesViewClass,
    QZExamplesViewClassSets,
    QZExamplesAddClass,
    QZExamplesEditClass,
    QZExamplesDeleteClass,
    QZExamplesAddSetToClass,
    QZExamplesRemoveSetFromClass,
    QZExamplesJoinClass,
    QZExamplesLeaveClass,
    QZExamplesUploadImage,
    QZExamplesSearchSets,
    QZExamplesSearchDefinitions,
    QZExamplesSearchClasses,
    QZExamplesSearchUniversal,
    QZExamplesViewSet,
    QZExamplesViewSetTerms,
    QZExamplesSubmitSetPassword,
    QZExamplesViewSets,
    QZExamplesAddSet,
    QZExamplesEditSet,
    QZExamplesDeleteSet,
    QZExamplesAddTermToSet,
    QZExamplesEditTermFromSet,
    QZExamplesDeleteTermFromSet,
    QZExamplesUserDetails,
    QZExamplesUserSets,
    QZExamplesUserFavorites,
    QZExamplesUserClasses,
    QZExamplesUserStudied,
    QZExamplesMarkSetAsFavorite,
    QZExamplesUnmarkSetAsFavorite
};

@interface QZExamplesViewController : UIViewController

@end
