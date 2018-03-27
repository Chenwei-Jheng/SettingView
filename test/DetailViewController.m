//
//  DetailViewController.m
//  test
//
//  Created by arplanet on 2018/3/27.
//  Copyright © 2018年 Johnny. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () {
    StyleType _type;
}

@end

@implementation DetailViewController

- (instancetype)initWithType:(StyleType)style {
    self = [super init];
    _type = style;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.settingView = [[SettingView alloc] initWithFrame:CGRectMake(50, 100, width -100, 100) Style:_type];
    self.settingView.hidden = YES;
    [self.view addSubview:self.settingView];
    [self addKVO];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self removeKVO];
    // Dispose of any resources that can be recreated.
}

- (void)addKVO {
    [self.settingView addObserver:self forKeyPath:@"testSlider.value" options:NSKeyValueObservingOptionNew context:nil];
    [self.settingView addObserver:self forKeyPath:@"testStepper.value" options:NSKeyValueObservingOptionNew context:nil];
    [self.settingView addObserver:self forKeyPath:@"testSwitch.on" options:NSKeyValueObservingOptionNew context:nil];
    [self.settingView addObserver:self forKeyPath:@"testTextField.text" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeKVO {
    [self.settingView removeObserver:self forKeyPath:@"testSlider.value"];
    [self.settingView removeObserver:self forKeyPath:@"testStepper.value"];
    [self.settingView removeObserver:self forKeyPath:@"testSwitch.on"];
    [self.settingView removeObserver:self forKeyPath:@"testTextField.text"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ( [keyPath isEqualToString:@"testSlider.value"] ) {
        int value = [[change objectForKey:NSKeyValueChangeNewKey] intValue];
        self.showValue.text = [NSString stringWithFormat:@"%d",value];
    }
    else if ( [keyPath isEqualToString:@"testStepper.value"] ) {
        int value = [[change objectForKey:NSKeyValueChangeNewKey] intValue];
        self.showValue.text = [NSString stringWithFormat:@"%d",value];
    }
    else if ( [keyPath isEqualToString:@"testSwitch.on"] ) {
        BOOL sw = [[change objectForKey:NSKeyValueChangeNewKey] boolValue];
        self.showValue.hidden = !sw;
    }
    else if ( [keyPath isEqualToString:@"testTextField.text"] ) {
        NSString *string = [[change objectForKey:NSKeyValueChangeNewKey] string];
        self.showValue.text = string;
    }
    else {
         [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (IBAction)buttonAction:(id)sender {
    self.settingView.hidden = !self.settingView.hidden;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
