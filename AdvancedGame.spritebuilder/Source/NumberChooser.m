//
//  NumberChooser.m
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "NumberChooser.h"

@implementation NumberChooser {
    CCButton *_leftButton;
    CCButton *_rightButton;
    NSNumber *_leftNumber;
    NSNumber *_rightNumber;
}

- (void)didLoadFromCCB {
    [self generateNewRandomNumbers];
}

#pragma marks - Puzzle Logic

- (void)guessNumber:(NSNumber *)number1 isLargerThan:(NSNumber *)number2 {
    if ([number1 integerValue] > [number2 integerValue]) {
        // guess correct
        CCLOG(@"Correct");
        [self.delegate numberChooser:self guessedCorrectly:YES];
    } else {
        // guess wrong
        CCLOG(@"Wrong");
        [self.delegate numberChooser:self guessedCorrectly:NO];
    }

    [self generateNewRandomNumbers];
}

#pragma mark - Button Callbacks

- (void)leftButtonPressed {
    [self guessNumber:_leftNumber isLargerThan:_rightNumber];
}

- (void)rightButtonPressed {
    [self guessNumber:_rightNumber isLargerThan:_leftNumber];
}

#pragma mark - Generate two unique random numbers

- (void)generateNewRandomNumbers {
    NSArray *randomNumbers = [self generate:2 randomUniqueNumbersBetween:0 upperLimit:20];
    _leftNumber = randomNumbers[0];
    _rightNumber = randomNumbers[1];

    _leftButton.title = [_leftNumber stringValue];
    _rightButton.title = [_rightNumber stringValue];
}

- (NSArray *)generate:(int)n randomUniqueNumbersBetween:(int)lowerLimit upperLimit:(int)upperLimit {
    NSMutableArray *randomNumberArray = [NSMutableArray arrayWithCapacity:upperLimit-lowerLimit];

    // add all numbers to array
    for (int i = lowerLimit; i < upperLimit; i++) {
        [randomNumberArray addObject:@(i)];
    }

    // shuffle array
    for (NSUInteger i = 0; i < [randomNumberArray count]; i++) {
        int j = arc4random_uniform([randomNumberArray count]);

        NSNumber *jNumber = randomNumberArray[j];
        NSNumber *iNumber = randomNumberArray[i];

        randomNumberArray[j] = iNumber;
        randomNumberArray[i] = jNumber;
    }

    return [randomNumberArray subarrayWithRange:NSMakeRange(0,n)];
}

@end
