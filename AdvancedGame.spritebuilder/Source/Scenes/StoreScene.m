//
//  StoreScene.m
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "StoreScene.h"
#import "GameState.h"

@implementation StoreScene

- (void)backButtonPressed {
    [[CCDirector sharedDirector] popScene];
}

- (void)buyCoinsPressed {
    [GameState sharedInstance].coins += 10;
}

@end
