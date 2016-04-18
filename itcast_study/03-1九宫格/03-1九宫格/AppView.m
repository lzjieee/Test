//
//  AppView.m
//  03-1九宫格
//
//  Created by mac on 16/4/3.
//  Copyright © 2016年 lzj. All rights reserved.
//

#import "AppView.h"

@interface AppView()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *downLo;

@end

@implementation AppView

//提供这个创建view的类方法是因为虽然controller的viewdidload里也可以创建，但是controller
//只是用view，不用管view的创建。封装起来更安全，代码耦合度更低
+ (instancetype)appView
{
    //1.通过xib创建每个应用的小uiview
    //通过动态加载xib
    //1.1找到手机根目录
    NSBundle *rootPath = [NSBundle mainBundle];
    //1.2在应用程序根目录下读取对应的xib（nib）。开发的时候叫xib，部署到设备上就nib
    //下面这个函数返回的是nsarray。
    AppView *appView = [[rootPath loadNibNamed:@"AppView" owner:nil options:nil] lastObject];
    return appView;
}


//重写model的set方法
-(void)setModel:(App *)model
{
    //先赋值
    _model = model;
    
    //解析模型数据，把模型数据赋值给uiview的各个子控件
    self.imgView.image = [UIImage imageNamed:model.icon];
    self.nameLabel.text = model.name;
}
@end
