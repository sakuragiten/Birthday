//
//  MASConstraint+FlattenLayout.m
//  Masonry with FlattenLayout
//
//  Created by doggy on 4/24/16.
//  Copyright © 2016 doggy. All rights reserved.
//

#import "MASConstraint+Private.h"
#import "MASConstraint+FlattenLayout.h"

#define MASMethodNotImplemented() \
    @throw [NSException exceptionWithName:NSInternalInconsistencyException \
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
                                 userInfo:nil]

@implementation MASConstraint (Flatten)

- (MASConstraint * (^)(NSValue *value))valueGap { MASMethodNotImplemented(); }
- (MASConstraint * (^)(id, NSLayoutRelation))equalTillWithRelation { MASMethodNotImplemented(); }

#pragma mark - NSLayoutRelation proxies

- (MASConstraint * (^)(id))equalTill {
    return ^id(id attribute) {
        return self.equalTillWithRelation(attribute, NSLayoutRelationEqual);
    };
}

- (MASConstraint * (^)(id))mas_equalTill {
    return ^id(id attribute) {
        return self.equalTillWithRelation(attribute, NSLayoutRelationEqual);
    };
}

- (MASConstraint * (^)(id))greaterThanOrEqualTill {
    return ^id(id attribute) {
        return self.equalTillWithRelation(attribute, NSLayoutRelationGreaterThanOrEqual);
    };
}

- (MASConstraint * (^)(id))mas_greaterThanOrEqualTill {
    return ^id(id attribute) {
        return self.equalTillWithRelation(attribute, NSLayoutRelationGreaterThanOrEqual);
    };
}

- (MASConstraint * (^)(id))lessThanOrEqualTill {
    return ^id(id attribute) {
        return self.equalTillWithRelation(attribute, NSLayoutRelationLessThanOrEqual);
    };
}

- (MASConstraint * (^)(id))mas_lessThanOrEqualTill {
    return ^id(id attribute) {
        return self.equalTillWithRelation(attribute, NSLayoutRelationLessThanOrEqual);
    };
}

@end
