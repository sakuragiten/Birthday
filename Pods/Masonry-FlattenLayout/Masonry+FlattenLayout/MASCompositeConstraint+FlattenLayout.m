//
//  MASCompositeConstraint+FlattenLayout.h
//  Masonry with FlattenLayout
//
//  Created by doggy on 4/24/16.
//  Copyright © 2016 doggy. All rights reserved.
//

#import "MASConstraint+Private.h"
#import "MASConstraint+FlattenLayout.h"
#import "MASCompositeConstraint+FlattenLayout.h"

@implementation MASCompositeConstraint (Flatten)
@dynamic mas_key;
@dynamic childConstraints;

- (MASConstraint * (^)(id, NSLayoutRelation))equalTillWithRelation {
    return ^id(id attr, NSLayoutRelation relation) {
        for (MASConstraint *constraint in self.childConstraints.copy) {
            constraint.equalTillWithRelation(attr, relation);
        }
        return self;
    };
}

- (MASConstraint * (^)(NSValue *value))valueGap {
    return ^id(NSValue *offset) {
        NSAssert([offset isKindOfClass:NSValue.class], @"expected an NSValue offset, got: %@", offset);
        for (MASConstraint *constraint in self.childConstraints.copy) {
            constraint.valueGap(offset);
        }
        return self;
    };
}

@end
