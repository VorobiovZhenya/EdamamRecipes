//
//  RecipeDetailViewController.h
//  EdamamRecipes
//
//  Created by Zhenya on 1/18/17.
//  Copyright © 2017 Zhenka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *recipeTitle;
@property (weak, nonatomic) IBOutlet NSString *recipeName;
@property (weak, nonatomic) IBOutlet NSData *recipeImageData;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImage;

@end
