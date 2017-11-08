//
//  MASCompositeConstraint+FlattenLayout.h
//  Masonry with FlattenLayout
//
//  Created by doggy on 4/24/16.
//  Copyright © 2016 doggy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MASCompositeConstraint.h"

@interface MASCompositeConstraint (Flatten)

// inhert from interface
@property (nonatomic, strong) id mas_key;
@property (nonatomic, strong) NSMutableArray *childConstraints;

@end
