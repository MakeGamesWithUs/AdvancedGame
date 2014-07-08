//
//  Gameplay.m
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameplayScene.h"
#import "NumberChooser.h"
#import "BaseGameplay.h"
#import "GameState.h"

@implementation GameplayScene {
    NumberChooser *_numberChooser;
    CCNode *_gameplayContainer;
    CCLabelTTF *_coinsLabel;
    CCLabelTTF *_timerLabel;
    
    NSInteger _timerValue;
}

- (void)didLoadFromCCB {
    _timerValue = 15;
    [self schedule:@selector(tick) interval:1.f];
    
    _coinsLabel.string = [NSString stringWithFormat:@"Coins: %d", [GameState sharedInstance].coins];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scoreChanged:) name:GAME_STATE_SCORE_NOTIFICATION object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)onEnter {
    [super onEnter];
    
    // unpause when gameplay gets visible
    self.paused = NO;
}

#pragma mark - Setter Override

- (void)setGameplayMode:(NSString *)gameplayMode {
    _gameplayMode = [gameplayMode copy];
    
    BaseGameplay *gameplay = nil;
    
    if ([_gameplayMode isEqualToString:@"Dodge"]) {
        gameplay = (BaseGameplay *) [CCBReader load:@"DodgeGameplay"];
    } else if ([_gameplayMode isEqualToString:@"Facts"]) {
        gameplay = (BaseGameplay *) [CCBReader load:@"FactCheckGameplay"];
    }
    
    [_gameplayContainer addChild:gameplay];
    _numberChooser.delegate = gameplay;
}

#pragma mark - Timer

- (void)tick {
    if (_timerValue == 0) {
        [self unschedule:@selector(tick)];
        [[CCDirector sharedDirector] popScene];
    }
    
    _timerValue--;
    _timerLabel.string = [NSString stringWithFormat:@"%d", _timerValue];
}

#pragma mark - Notification Callbacks

- (void)scoreChanged:(NSNotification *)notification {
    // calling the object method will return whichever object the object posting the notification has passed in
    NSNumber *newCoinValue = [notification object];
    _coinsLabel.string = [NSString stringWithFormat:@"Coins: %d", [newCoinValue integerValue]];
}

#pragma mark - Button Callback

- (void)storeButtonPressed {
    // pause this gameplay when we present the store scene
    self.paused = YES;
    CCScene *storeScene = [CCBReader loadAsScene:@"StoreScene"];
    [[CCDirector sharedDirector] pushScene:storeScene];
}


@end
