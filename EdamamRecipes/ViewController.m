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
    count = 0;
    //UITapGestureRecognizer *handleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing)]; // Hide keyboard when tapping screen
    //[self.view addGestureRecognizer:handleTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberOfRows;//Number of rows

    if (count == 0) numberOfRows = 0;
        else numberOfRows = count;
    
    return numberOfRows;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UILabel *title, *recipeText;
    UIImageView *img;
    NSInteger index = indexPath.row;
    
    if (count != 0)
        {
        title = (UILabel *)[cell.contentView viewWithTag:1001];
        [title setText:[edamamReq getRecipeLabel:index]];

        recipeText = (UILabel *)[cell.contentView viewWithTag:1003];
        [recipeText setText:[edamamReq getRecipeIngredientsString:index]];
            
        img = (UIImageView *)[cell.contentView viewWithTag:1002];
        img.image = [[UIImage alloc] initWithData:[edamamReq getRecipeImg:index] scale:1];
        }
    return cell;
}

-(void)touchDownSearch:(id)sender{
    [self startSearch];
    [self endEditing];
}

-(void)startSearch{
    
    NSLog(@"Query - %@", requestTextField.text);
    [edamamReq setQueryText:requestTextField.text];
    count = [edamamReq count];
    [self.tableView setContentOffset:CGPointZero];
    [self.tableView reloadData];
}

-(void)endEditing{
    // Hide keyboard from the screen
    [self.view endEditing:YES];
    NSLog(@"endEditing");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.requestTextField	resignFirstResponder];
    [self startSearch];
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"Segue to recipe details"])
    {
        NSInteger selectedRow = [self.tableView indexPathForSelectedRow].row;
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        destViewController.recipeName = [edamamReq getRecipeLabel:selectedRow];
        //destViewController.recipeImageData = [edamamReq getRecipeImg:selectedRow];
        UIImageView *recipeImage = (UIImageView *)[destViewController.view viewWithTag:2001];
        recipeImage.image = [[UIImage alloc] initWithData:[edamamReq getRecipeImg:selectedRow]];
        
    }
}
//@synthesize tableView;
@end
