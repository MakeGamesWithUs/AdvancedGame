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

/* 
 
 Two different gameplays:
 
 1) Dodge obstacles as they come by by soling puzzle correctly
 
 2) Tell if statements are true or not by solving puzzle correctly or wrong
 
 3) Timer as notification
 
 4) Notification about purchased coins as notification
 
 */

- (void)dodgeButtonPressed {
    CCScene *scene = [CCBReader loadAsScene:@"Gameplay"];
    GameplayScene *gameplay = scene.children[0];
    gameplay.gameplayMode = @"Dodge";
    [[CCDirector sharedDirector] pushScene:scene];
}

- (void)factButtonPressed {
    CCScene *scene = [CCBReader loadAsScene:@"Gameplay"];
    GameplayScene *gameplay = scene.children[0];
    gameplay.gameplayMode = @"Facts";
    [[CCDirector sharedDirector] pushScene:scene];
}

@end
