//
//  ViewController.m
//  EdamamRecipes
//
//  Created by Zhenya on 8/13/16.
//  Copyright © 2016 Zhenka. All rights reserved.
//

#import "ViewController.h"
#import "EdamamRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewdidload");
    NSString *ID = @"20707401";
    NSString *Key = @"81ecd15b5c9d825f81d010ac2e067f3b";
    EdamamRequest *edamamRequest = [[EdamamRequest alloc] init];
    [edamamRequest setAppID:ID];
    [edamamRequest setAppKey:Key];
    NSLog(@"%@",[edamamRequest recipeSearch:@"potato"]);
    
    
    
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
