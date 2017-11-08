//
//  MASConstraint+FlattenLayout.h
//  Masonry with FlattenLayout
//
//  Created by doggy on 4/24/16.
//  Copyright © 2016 doggy. All rights reserved.
//

#import "MASConstraint.h"

@interface MASConstraint (Flatten)

/**
 *	Sets the constraint relation to NSLayoutRelationEqual
 *  returns a block which accepts one of the following:
 *    MASViewAttribute, UIView, NSValue, NSArray
 *  see readme for more details.
 */
- (MASConstraint * (^)(id attr))equalTill;

/**
 *	Sets the constraint relation to NSLayoutRelationGreaterThanOrEqual
 *  returns a block which accepts one of the following:
 *    MASViewAttribute, UIView, NSValue, NSArray
 *  see readme for more details.
 */
- (MASConstraint * (^)(id attr))greaterThanOrEqualTill;

/**
 *	Sets the constraint relation to NSLayoutRelationLessThanOrEqual
 *  returns a block which accepts one of the following:
 *    MASViewAttribute, UIView, NSValue, NSArray
 *  see readme for more details.
 */
- (MASConstraint * (^)(id attr))lessThanOrEqualTill;

/**
 *  Modifies the NSLayoutConstraint constant based on a value type
 */
- (MASConstraint * (^)(NSValue *value))valueGap;

// abstract
- (MASConstraint * (^)(id, NSLayoutRelation))equalTillWithRelation;
@end

#define mas_equalTill(...)                 equalTill(MASBoxValue((__VA_ARGS__)))
#define mas_greaterThanOrEqualTill(...)    greaterThanOrEqualTill(MASBoxValue((__VA_ARGS__)))
#define mas_lessThanOrEqualTill(...)       lessThanOrEqualTill(MASBoxValue((__VA_ARGS__)))

/**
 *  Convenience auto-boxing macros for MASConstraint methods.
 *
 *  Defining MAS_SHORTHAND_GLOBALS will turn on auto-boxing for default syntax.
 *  A potential drawback of this is that the unprefixed macros will appear in global scope.
 */
#define mas_gap(...)                  valueGap(MASBoxValue((__VA_ARGS__)))


#ifdef MAS_SHORTHAND_GLOBALS

#define equalTill(...)                     mas_equalTill(__VA_ARGS__)
#define greaterThanOrEqualTill(...)        mas_greaterThanOrEqualTill(__VA_ARGS__)
#define lessThanOrEqualTill(...)           mas_lessThanOrEqualTill(__VA_ARGS__)

#define gap(...)                      mas_gap(__VA_ARGS__)

#endif

@interface MASConstraint (AutoboxingSupportFlatten)

/**
 *  Aliases to corresponding relation methods (for shorthand macros)
 *  Also needed to aid autocompletion
 */
- (MASConstraint * (^)(id attr))mas_equalTill;
- (MASConstraint * (^)(id attr))mas_greaterThanOrEqualTill;
- (MASConstraint * (^)(id attr))mas_lessThanOrEqualTill;

/**
 *  A dummy method to aid autocompletion
 */
- (MASConstraint * (^)(id offset))mas_gap;

@end
