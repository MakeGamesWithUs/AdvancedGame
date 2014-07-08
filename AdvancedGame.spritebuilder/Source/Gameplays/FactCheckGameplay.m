//
//  FactCheckGameplay.m
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "FactCheckGameplay.h"

@implementation FactCheckGameplay

#pragma mark - Number Chooser Delegate

- (void)numberChooser:(NumberChooser *)numberChooser guessedCorrectly:(BOOL)guess {
    [self.animationManager runAnimationsForSequenceNamed:@"ShowAnswer"];
}

@end
