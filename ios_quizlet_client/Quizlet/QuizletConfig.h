//
//  QuizletConfig.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

#define QUIZLET_LOG

#ifdef QUIZLET_LOG
#define QUIZLET_RESPONSE_LOG
#endif

#define USE_AFNETWORKACTIVITYLOGGER

static NSString * const QuizletAPIBaseUrl = @"https://api.quizlet.com/2.0";
