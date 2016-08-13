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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewdidload");
    queryText = @"chicken";
    appID = @"20707401";
    appKey = @"81ecd15b5c9d825f81d010ac2e067f3b";
    // https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}
    URLString = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.edamam.com/search?q=%@&app_id=%@&app_key=%@", queryText, appID, appKey]];
    URLRequestString = [NSURLRequest requestWithURL:URLString];
    
    responseData = [NSData dataWithContentsOfURL:URLString];
    NSString *ret = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
