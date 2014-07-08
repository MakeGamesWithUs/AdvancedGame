//
//  GameState.m
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameState.h"

@implementation GameState

+ (instancetype)sharedInstance {
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}

#pragma mark - Setter Override

- (void)setCoins:(NSInteger)coins {
    _coins = coins;
    
    NSNumber *coinNumber = [NSNumber numberWithInt:coins];
    [[NSNotificationCenter defaultCenter] postNotificationName:GAME_STATE_SCORE_NOTIFICATION object:coinNumber];
}

@end
