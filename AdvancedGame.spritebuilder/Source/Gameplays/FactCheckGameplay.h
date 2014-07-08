//
//  FactCheckGameplay.h
//  AdvancedGame
//
//  Created by Benjamin Encz on 07/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "NumberChooser.h"

@interface FactCheckGameplay : CCNode <NumberChooserDelegate> {
    CCLabelTTF *_factLabel;
    CCLabelTTF *_answerLabel;
}

@end
