//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene

/* 
 
 Two different gameplays:
 
 1) Dodge obstacles as they come by by soling puzzle correctly
 
 2) Tell if statements are true or not by solving puzzle correctly or wrong
 
 3) Timer as notification
 
 */

- (void)startButtonPressed {
    CCScene *gameplay = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] pushScene:gameplay];
}

@end
