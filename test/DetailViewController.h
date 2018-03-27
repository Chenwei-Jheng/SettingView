//
//  DetailViewController.h
//  test
//
//  Created by arplanet on 2018/3/27.
//  Copyright © 2018年 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingView.h"

@interface DetailViewController : UIViewController
@property(nonatomic)SettingView *settingView;
@property (strong, nonatomic) IBOutlet UILabel *showValue;
- (instancetype)initWithType:(StyleType)style;
@end
