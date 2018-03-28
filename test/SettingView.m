//
//  SettingView.m
//  test
//
//  Created by arplanet on 2018/3/27.
//  Copyright © 2018年 Johnny. All rights reserved.
//

#import "SettingView.h"

@implementation SettingView

- (instancetype)initWithFrame:(CGRect)frame Style:(StyleType) style {
    self = [super initWithFrame:frame];
    self.alpha = 0.8;
    self.backgroundColor = [UIColor darkGrayColor];
    self.layer.cornerRadius = 36;
    self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor blueColor]);
    self.layer.borderWidth = 4;
    self.layer.shadowColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
    self.styleType = style;
    
    switch (self.styleType) {
        case StyleTypeTest1:
        {
            [self showStyleTypeTest1];
            break;
        }
        case StyleTypeTest2:
        {
            [self showStyleTypeTest2];
            break;
        }
        case StyleTypeTest3:
        {
            [self showStyleTypeTest3];
            break;
        }
        case StyleTypeTest4:
        {
            [self showStyleTypeTest4];
            break;
        }
        default:
            break;
    }
    return self;
}

- (void)showStyleTypeTest1 {
    self.testSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, 30)];
    self.testSlider.maximumValue = 100;
    self.testSlider.minimumValue = 0;
    self.testSlider.value = 50;
    [self.testSlider addTarget:self action:@selector(sliderValue:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.testSlider];
    
    self.testSlider1 = [[UISlider alloc] initWithFrame:CGRectMake(20, 50, self.frame.size.width - 40 - 50, 30)];
    self.testSlider1.maximumValue = 100;
    self.testSlider1.minimumValue = 0;
    self.testSlider1.value = 50;
    [self.testSlider1 addTarget:self action:@selector(sliderValue:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.testSlider1];
    
    self.testSlider1Label = [[UILabel alloc] initWithFrame:CGRectMake(self.testSlider1.frame.size.width + 20, 50, 50, 30)];
    self.testSlider1Label.text = [NSString stringWithFormat:@"%d", (int)self.testSlider1.value];
    self.testSlider1Label.enabled = NO;
    self.testSlider1.tag = 2;
    [self addSubview:self.testSlider1Label];
    
    
}

- (void)showStyleTypeTest2 {
    self.testStepper = [[UIStepper alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, 30)];
    self.testStepper.maximumValue = 10;
    self.testStepper.minimumValue = 0;
    self.testStepper.value =5;
    self.testStepper.stepValue = 1;
    [self addSubview:self.testStepper];
}

- (void)showStyleTypeTest3 {
    self.testSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, 30)];
    [self.testSwitch setOn:YES];
    [self.testSwitch addTarget:self action:@selector(switchValue:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.testSwitch];
}

- (void)showStyleTypeTest4 {
    self.testTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, 30)];
    self.testTextField.backgroundColor = [UIColor whiteColor];
    self.testTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.testTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.testTextField.returnKeyType = UIReturnKeyDone;
    [self.testTextField setEnabled:YES];
    self.testTextField.delegate = self;
    self.testTextField.text = @"Input";
    
    [self addSubview:self.testTextField];
}

- (IBAction)sliderValue:(UISlider *)sender {
    if ( sender.tag == 2 ) {
        self.testSlider1Label.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    }
    self.testSlider1.maximumValue = self.testSlider.value - 1;
    sender.value = sender.value;
}

- (IBAction)switchValue:(UISwitch *)sender {
    sender.on = !sender.on;
}
#pragma mark- textfielddelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {

}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    self.testTextField.text = string;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.testTextField.text = textField.text;
    return YES;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
