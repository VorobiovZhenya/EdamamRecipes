//
//  ViewController.m
//  EdamamRecipes
//
//  Created by Zhenya on 8/13/16.
//  Copyright © 2016 Zhenka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize requestTextField;
@synthesize searchButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewdidload");
    edamamReq = [[EdamamRequest alloc] init];
    [edamamReq setAppID:ID];
    [edamamReq setAppKey:Key];
}

-(void)touchDownSearch:(id)sender{
    NSLog(@"%@",[edamamReq recipeSearch:self.requestTextField.text]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
