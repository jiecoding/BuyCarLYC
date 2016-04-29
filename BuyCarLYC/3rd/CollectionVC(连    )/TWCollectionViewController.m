//
//  TWCollectionViewController.m
//  CollectionView
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 tang. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "TWCollectionViewController.h"
#import "CollectionDefine.h"
#define StaticCell  @"CollectionCell"
@interface TWCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (retain, nonatomic) UICollectionView *collectionView;

@end

@implementation TWCollectionViewController

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCollectionView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)createCollectionView
{
    if(_collectionView == nil){
        UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:StaticCell];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [self addSubview:_collectionView];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:StaticCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
   
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    imageView.backgroundColor = [UIColor yellowColor];

//    NSString *urlStr =@"http://i1.chexun.net/images/2016/0331/17998/car_750_500_105C0D5F35C167A8E999112570B3666F.jpg";
//    [imageView setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@""]];

   //https://segmentfault.com/a/1190000002933776
//    UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:]]];

//    [imageView setImage:image];
    imageView.image = [UIImage imageNamed:_imageName];
    
    [cell.contentView addSubview:imageView];
    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 120, 20)];
    //label.text = [NSString stringWithFormat:@"顺序", (long)indexPath.row ];
    label.text = @"测试用车";
    cell.backgroundColor = [UIColor clearColor];
    
    [cell.contentView addSubview:label];
 
    return cell;
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
     return UIEdgeInsetsMake(15, 15, 5, 15);//分别为上、左、下、右
}
//选择一个
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
}

//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(120, 120);
}

@end
