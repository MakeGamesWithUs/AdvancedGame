//
//  GameState.h
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

static  NSString * const GAME_STATE_SCORE_NOTIFICATION = @"GameState_ScoreChanged";

@interface GameState : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, assign) NSInteger coins;

@end