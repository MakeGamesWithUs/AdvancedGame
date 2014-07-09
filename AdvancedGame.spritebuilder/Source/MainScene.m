//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "GameplayScene.h"

@implementation MainScene

- (void)dodgeButtonPressed {
    CCScene *scene = [CCBReader loadAsScene:@"Gameplay"];
    GameplayScene *gameplay = scene.children[0];
    gameplay.gameplayMode = @"Dodge";
    [[CCDirector sharedDirector]pushScene:scene];
}

- (void)factButtonPressed {
    CCScene *scene = [CCBReader loadAsScene:@"Gameplay"];
    GameplayScene *gameplay = scene.children[0];
    gameplay.gameplayMode = @"Facts";
    [[CCDirector sharedDirector]pushScene:scene];
}

@end
