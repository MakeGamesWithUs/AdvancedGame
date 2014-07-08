//
//  GameState.h
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameState : NSObject

+ (id)sharedInstance;

@property (nonatomic, copy) NSString *username;
@property (nonatomic, assign) NSInteger *coins;

@end
