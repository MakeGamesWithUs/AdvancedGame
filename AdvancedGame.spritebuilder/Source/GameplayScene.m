//
//  Gameplay.m
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameplayScene.h"
#import "NumberChooser.h"
#import "FactCheckGameplay.h"
#import "GameState.h"

@implementation GameplayScene {
    NumberChooser *_numberChooser;
    CCNode *_gameplayContainer;
    CCLabelTTF *_coinsLabel;
}

- (void)didLoadFromCCB {
    FactCheckGameplay *factCheckGameplay = (FactCheckGameplay *) [CCBReader load:@"FactCheckGameplay"];
    [_gameplayContainer addChild:factCheckGameplay];
    _numberChooser.delegate = factCheckGameplay;
}

- (void)onEnter {
    [super onEnter];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scoreChanged:) name:GAME_STATE_SCORE_NOTIFICATION object:nil];
}

- (void)onExit {
    [super onExit];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification Callbacks

- (void)scoreChanged:(NSNotification *)notification {
    // calling the object method will return whichever object the object posting the notification has passed in
    NSNumber *newCoinValue = [notification object];
    _coinsLabel.string = [NSString stringWithFormat:@"Coins: %d", [newCoinValue integerValue]];
}

@end
