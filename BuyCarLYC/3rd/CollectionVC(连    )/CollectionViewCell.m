//
//  CollectionViewCell.m
//  CollectionView
//
//  Created by tang on 16/3/4.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"CollectionViewCell" owner:nil options:nil];
    
    UIView *plainView = [nibContents lastObject];
    CGSize padding = (CGSize){ 0, 0 };
    plainView.frame = (CGRect){padding.width, padding.height, plainView.frame.size};
    // Add to the view hierarchy (thus retain).
    [self.contentView addSubview:plainView];
    return self;
}


@end
