//
//  DodgeGameplay.m
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "DodgeGameplay.h"
#import "GameState.h"

@implementation DodgeGameplay {
    CCNode *_player;
    CCNode *_opponent;
}

#pragma mark - Number Chooser Delegate

- (void)numberChooser:(NumberChooser *)numberChooser guessedCorrectly:(BOOL)guess {
    if (guess) {
        [self.animationManager runAnimationsForSequenceNamed:@"Dodge"];
    }
}

- (void)update:(CCTime)delta {
    _opponent.position = ccp(_opponent.position.x - 150 *delta, _opponent.position.y);

    BOOL resetPosition = NO;
    BOOL collided = NO;

    if (CGRectGetMaxX(_opponent.boundingBox) < 0) {
        resetPosition = YES;
    }

    if (CGRectIntersectsRect(_player.boundingBox, _opponent.boundingBox)) {
        resetPosition = YES;
        collided = YES;
        [GameState sharedInstance].coins -= 1;
    }

    if (resetPosition) {
        if (!collided) {
            [GameState sharedInstance].coins += 1;
        }
        _opponent.position = ccp(self.contentSizeInPoints.width + _opponent.contentSize.width, _opponent.position.y);
    }
}

@end
