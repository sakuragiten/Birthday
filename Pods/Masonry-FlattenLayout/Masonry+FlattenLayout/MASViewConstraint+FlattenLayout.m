//
//  MASViewConstraint+FlattenLayout.h
//  Masonry with FlattenLayout
//
//  Created by doggy on 4/24/16.
//  Copyright © 2016 doggy. All rights reserved.
//

#import "MASCompositeConstraint.h"
#import "MASConstraint+Private.h"
#import "MASViewConstraint+FlattenLayout.h"

@implementation MASViewConstraint (Flatten)
@dynamic hasLayoutRelation;
@dynamic secondViewAttribute;
@dynamic layoutRelation;

#pragma mark - NSLayoutRelation proxy

- (MASConstraint * (^)(id, NSLayoutRelation))equalTillWithRelation {
    return ^id(id attribute, NSLayoutRelation relation) {
        if ([attribute isKindOfClass:NSArray.class]) {
            NSAssert(!self.hasLayoutRelation, @"Redefinition of constraint relation");
            NSMutableArray *children = NSMutableArray.new;
            for (id attr in attribute) {
                MASViewConstraint *viewConstraint = [self copy];
                viewConstraint.secondViewAttribute = [self layoutAttributeWithFlattenLayout:attr];
                [children addObject:viewConstraint];
            }
            MASCompositeConstraint *compositeConstraint = [[MASCompositeConstraint alloc] initWithChildren:children];
            compositeConstraint.delegate = self.delegate;
            [self.delegate constraint:self shouldBeReplacedWithConstraint:compositeConstraint];
            return compositeConstraint;
        } else {
            NSAssert(!self.hasLayoutRelation || self.layoutRelation == relation && [attribute isKindOfClass:NSValue.class], @"Redefinition of constraint relation");
            self.layoutRelation = relation;
            self.secondViewAttribute = [self layoutAttributeWithFlattenLayout:attribute];
            return self;
        }
    };
}

- (MASConstraint * (^)(NSValue *value))valueGap {
    return ^id(NSValue *offset) {
        NSAssert([offset isKindOfClass:NSValue.class], @"expected an NSValue offset, got: %@", offset);
        if ([offset isKindOfClass:NSNumber.class]) {
            double gap = [(NSNumber *)offset doubleValue];
            if (   ( NSLayoutAttributeBottom == self.firstViewAttribute.layoutAttribute
                  && NSLayoutAttributeTop == self.secondViewAttribute.layoutAttribute )
                || ( NSLayoutAttributeRight == self.firstViewAttribute.layoutAttribute
                  && NSLayoutAttributeLeft == self.secondViewAttribute.layoutAttribute )
                || ( NSLayoutAttributeTrailing == self.firstViewAttribute.layoutAttribute
                  && NSLayoutAttributeLeading == self.secondViewAttribute.layoutAttribute )
                ) {
                self.offset = -gap;
            } else
//            if (   ( NSLayoutAttributeTop == self.firstViewAttribute.layoutAttribute
//                  && NSLayoutAttributeBottom == self.secondViewAttribute.layoutAttribute )
//                || ( NSLayoutAttributeLeft == self.firstViewAttribute.layoutAttribute
//                  && NSLayoutAttributeRight == self.secondViewAttribute.layoutAttribute )
//                || ( NSLayoutAttributeLeading == self.firstViewAttribute.layoutAttribute
//                  && NSLayoutAttributeTrailing == self.secondViewAttribute.layoutAttribute )
//                )
            {
                self.offset = gap;
            }
        } else {
            [self setLayoutConstantWithValue:offset];
        }
        return self;
    };
}

#pragma mark - internal method
- (id)layoutAttributeWithFlattenLayout:(id)secondViewAttribute
{
    if ([secondViewAttribute isKindOfClass:MAS_VIEW.class]) {
        NSLayoutAttribute layoutAttribute = self.firstViewAttribute.layoutAttribute;
        switch (self.firstViewAttribute.layoutAttribute) {
            case NSLayoutAttributeTop:
                layoutAttribute = NSLayoutAttributeBottom;
                break;
            case NSLayoutAttributeBottom:
                layoutAttribute = NSLayoutAttributeTop;
                break;
            case NSLayoutAttributeLeft:
                layoutAttribute = NSLayoutAttributeRight;
                break;
            case NSLayoutAttributeRight:
                layoutAttribute = NSLayoutAttributeLeft;
                break;
            case NSLayoutAttributeLeading:
                layoutAttribute = NSLayoutAttributeTrailing;
                break;
            case NSLayoutAttributeTrailing:
                layoutAttribute = NSLayoutAttributeLeading;
                break;
                
            default:
                break;
        }
        return [[MASViewAttribute alloc] initWithView:secondViewAttribute layoutAttribute:layoutAttribute];
    } else {
        return secondViewAttribute;
    }
}

@end
