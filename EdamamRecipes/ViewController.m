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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 8; //Number of rows
    return count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UILabel *title, *recipeText;
    UIImageView *img;
    NSInteger index = indexPath.row;
    
    NSDictionary *Hit = Hits[index];
    NSDictionary *Recipe = Hit[@"recipe"];
    NSString *recipeLabel = Recipe[@"label"];
    NSString *recipeImage = Recipe[@"image"]; //Recipe image URL
    NSArray *ingredientLines = Recipe[@"ingredientLines"]; //Array of ingredients
    NSString *ingredientsString = @""; // Array of ingredients in one string
    
    NSURL *imgUrl = [NSURL URLWithString:recipeImage];
    NSData *imgData = [NSData dataWithContentsOfURL:imgUrl];
    
    
    title = (UILabel *)[cell.contentView viewWithTag:1001];
    [title setText:recipeLabel];

    recipeText = (UILabel *)[cell.contentView viewWithTag:1003];
    for(int i =0; i<ingredientLines.count; i++)
    {
        if (i!=0)  ingredientsString = [ingredientsString stringByAppendingFormat:@", %@",ingredientLines[i]];
            else   ingredientsString = [ingredientsString stringByAppendingFormat:@"%@",ingredientLines[i]];
    }
    [recipeText setText:ingredientsString];
        
    img = (UIImageView *)[cell.contentView viewWithTag:1002];
    img.image = [[UIImage alloc] initWithData:imgData scale:1];
    
    return cell;
}
-(void)touchDownSearch:(id)sender{
    NSLog(@"Query - %@", requestTextField.text);
    NSLog(@"%@",[edamamReq recipeSearch:requestTextField.text]);
    NSDictionary *dataFromEdamam = [edamamReq recipeSearch:requestTextField.text];
    Hits = dataFromEdamam[@"hits"];
    [self.tableView reloadData];
    
}
@end
