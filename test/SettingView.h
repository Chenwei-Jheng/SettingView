//
//  SettingView.h
//  test
//
//  Created by arplanet on 2018/3/27.
//  Copyright © 2018年 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum StyleType {
    StyleTypeTest1,
    StyleTypeTest2,
    StyleTypeTest3,
    StyleTypeTest4
}StyleType;

@interface SettingView : UIView <UITextFieldDelegate>
@property(nonatomic)StyleType styleType;
@property(nonatomic)UISlider *testSlider;
@property(nonatomic)UIStepper *testStepper;
@property(nonatomic)UISwitch *testSwitch;
@property(nonatomic)UITextField *testTextField;

- (instancetype)initWithFrame:(CGRect)frame Style:(StyleType) style;

@end
