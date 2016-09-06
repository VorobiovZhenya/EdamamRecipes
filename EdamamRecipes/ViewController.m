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
    //NSLog(@"%@",[edamamReq recipeSearch:requestTextField.text]);
    NSDictionary *dataFromEdamam = [edamamReq recipeSearch:requestTextField.text];
    Hits = dataFromEdamam[@"hits"];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 10; //Number of rows
    return count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UILabel *title, *recipetext;
    UIImageView *pic;
    NSDictionary *Hit = Hits[3];
    NSDictionary *Recipe = Hit[@"recipe"];
    NSString *recipeLabel = Recipe[@"label"];
    
    title = (UILabel *)[cell.contentView viewWithTag:1001];
    title.text  = (@"hgh%@",recipeLabel);
    
    recipetext = (UILabel *)[cell.contentView viewWithTag:1003];
    recipetext.text  = (@"recipe text ");
    
    pic = (UIImageView *)[cell.contentView viewWithTag:1002];
    pic.image = [UIImage imageNamed:@""];
    
    //cell.textLabel.text = @"123";
    
    return cell;
}
@end
