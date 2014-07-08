//
//  NumberChooser.h
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@class NumberChooser;

@protocol NumberChooserDelegate <NSObject>

- (void)numberChooser:(NumberChooser *)numberChooser guessedCorrectly:(BOOL)guess;

@end


@interface NumberChooser : CCNode

@property (nonatomic, weak) id <NumberChooserDelegate> delegate;

@end
