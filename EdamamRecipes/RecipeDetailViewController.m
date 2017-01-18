//
//  RecipeDetailViewController.m
//  EdamamRecipes
//
//  Created by Zhenya on 1/18/17.
//  Copyright © 2017 Zhenka. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

@synthesize recipeTitle;
@synthesize recipeImage;
@synthesize recipeImageData;
@synthesize recipeName;

- (void)viewDidLoad {
    [super viewDidLoad];
    [recipeTitle setText:recipeName];
    //recipeImage.image = [[UIImage alloc] initWithData:recipeImageData scale:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
