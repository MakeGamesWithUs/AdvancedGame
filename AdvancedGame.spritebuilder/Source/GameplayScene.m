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

@implementation GameplayScene {
    NumberChooser *_numberChooser;
    CCNode *_gameplayContainer;
}

- (void)didLoadFromCCB {
    FactCheckGameplay *factCheckGameplay = (FactCheckGameplay *) [CCBReader load:@"FactCheckGameplay"];
    [_gameplayContainer addChild:factCheckGameplay];
    _numberChooser.delegate = factCheckGameplay;
}

@end
