//
//  ViewController.m
//  test
//
//  Created by arplanet on 2018/3/27.
//  Copyright © 2018年 Johnny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *dataArray;
    StyleType _type;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = @[@"test1", @"test2", @"test3", @"test4"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            _type = StyleTypeTest1;
            break;
        }
        case 1:
        {
            _type = StyleTypeTest2;
            break;
        }
        case 2:
        {
            _type = StyleTypeTest3;
            break;
        }
        case 3:
        {
            _type = StyleTypeTest4;
            break;
        }
            
        default:
            break;
    }
    DetailViewController *viewcontrooler = [[DetailViewController alloc] initWithType:_type];
    [self.navigationController pushViewController:viewcontrooler animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellString = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
    if ( cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellString];
    }
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}




@end
