//
//  MASViewConstraint+FlattenLayout.h
//  Masonry with FlattenLayout
//
//  Created by doggy on 4/24/16.
//  Copyright © 2016 doggy. All rights reserved.
//

#import "MASViewConstraint.h"

@interface MASViewConstraint (Flatten)

// inhert from interface
@property (nonatomic, assign) BOOL hasLayoutRelation;
@property (nonatomic, strong) MASViewAttribute *secondViewAttribute;
@property (nonatomic, assign) NSLayoutRelation layoutRelation;

@end
