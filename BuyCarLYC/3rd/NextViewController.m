//
//  NextViewController.m
//  test1
//
//  Created by siqiyang on 15/12/24.
//  Copyright © 2015年 mengxianjin. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_indexArr;//数据源
    UILabel *_indexLabel;//索引条
    UILabel *_indexView;//中间索引view
}
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, width, height-20) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
   //初始化索引条
    _indexLabel = [[UILabel alloc]initWithFrame:CGRectMake(width-15, (height -380)/2, 13, 380)];
    _indexLabel.numberOfLines = 0;
    _indexLabel.font = [UIFont systemFontOfSize:12];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.textColor = [UIColor blackColor];
    _indexLabel.backgroundColor = [UIColor lightGrayColor];
    _indexLabel.userInteractionEnabled = YES;

    _indexLabel.alpha = 0.7;
    [self.view addSubview:_indexLabel];
    //初始化数据源
    _indexArr = [[NSMutableArray alloc]init];
    for (int i = 0; i<26; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%c",i+65];
        [_indexArr addObject:str];
        _indexLabel.text = i == 0? str:[NSString stringWithFormat:@"%@\n%@",_indexLabel.text,str];
    }
    //初始化中间的索引view
    _indexView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _indexView.layer.cornerRadius = _indexView.frame.size.width/2;
    _indexView.layer.masksToBounds = YES;
    _indexView.textColor = [UIColor redColor]
    ;
    _indexView.center = self.view.center;
    _indexView.textAlignment = NSTextAlignmentCenter;
    _indexView.alpha = 0.0;
    _indexView.backgroundColor = [UIColor brownColor];
    _indexView.font = [UIFont systemFontOfSize:50];
    [self.view addSubview:_indexView];
 
}
//点击开始
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self mytouches:touches];
    
}
//点击进行中
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self mytouches:touches];
    
}
//点击结束
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:2.5 animations:^{//让中间的view消失
        _indexView.alpha = 0.0;
    } completion:nil];
}

//点击事件的回调
- (void)mytouches:(NSSet *)touches{

    [UIView animateWithDuration:2.5 animations:^{//让中间的view显现
        _indexView.alpha = 1.0;
    }completion:nil];
    //获取点击的点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:_indexLabel];
    int index = (int)(point.y/380*26);
    if (index>25|index<0) {
        return;
    }
    //给索引view赋标题
    _indexView.text = _indexArr[index];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    //_tableView 回滚
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arc4random()%5 +1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *IdStr = @"haha";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IdStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IdStr];
        cell.textLabel.textColor = [UIColor cyanColor];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"-------第%d行------",indexPath.row];
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _indexArr.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
 
    return _indexArr[section];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
