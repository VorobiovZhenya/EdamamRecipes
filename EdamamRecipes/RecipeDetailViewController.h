//
//  RecipeDetailViewController.h
//  EdamamRecipes
//
//  Created by Zhenya on 1/18/17.
//  Copyright © 2017 Zhenka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
}

@property (weak, nonatomic) IBOutlet UILabel *recipeTitle;
@property (weak, nonatomic) NSString *recipeName;
@property (weak, nonatomic) NSData *recipeImageData;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImage;
@property (weak, nonatomic) NSArray *ingradientsList;
@property (weak, nonatomic) IBOutlet UITableView *detailsTableView;
@end
