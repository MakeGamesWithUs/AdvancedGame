//
//  GameState.m
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameState.h"

static NSString *const GAME_STATE_COIN_KEY = @"GameStateCoinKey";

@implementation GameState

+ (instancetype)sharedInstance {
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;

    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;

    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc]init];
    });

    // returns the same object each time
    return _sharedObject;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        NSNumber *coins = [[NSUserDefaults standardUserDefaults]objectForKey:GAME_STATE_COIN_KEY];
        self.coins = [coins integerValue];
    }

    return self;
}

#pragma mark - Setter Override

- (void)setCoins:(NSInteger)coins {
    _coins = coins;

    NSNumber *coinNumber = [NSNumber numberWithInt:coins];

    // broadcast change
    [[NSNotificationCenter defaultCenter]postNotificationName:GAME_STATE_SCORE_NOTIFICATION object:coinNumber];

    // store change
    [[NSUserDefaults standardUserDefaults]setObject:coinNumber forKey:GAME_STATE_COIN_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
