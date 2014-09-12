//
//  QuizletResponse.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/22/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

typedef NS_ENUM(NSInteger, QuizletHTTPResponseCode)
{
    QuizletHTTPResponseCodeOK               = 200,
    QuizletHTTPResponseCodeCreated          = 201,
    QuizletHTTPResponseCodeNoContent        = 204,
    QuizletHTTPResponseCodeBadRequest       = 400,
    QuizletHTTPResponseCodeUnauthorized     = 401,
    QuizletHTTPResponseCodeNotFound         = 404,
    QuizletHTTPResponseCodeMethodNotAllowed = 405,
    QuizletHTTPResponseCodeServerError      = 500
};
