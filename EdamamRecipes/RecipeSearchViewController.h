//
//  RecipeSearchViewController.h
//  EdamamRecipes
//
//  Created by Zhenya on 8/13/16.
//  Copyright © 2016 Zhenka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EdamamRequest.h"
#import "RecipeDetailViewController.h"

NSString *ID = @"20707401";
NSString *Key = @"81ecd15b5c9d825f81d010ac2e067f3b";
EdamamRequest *edamamReq;
NSInteger count; ///Number of results found

@interface RecipeSearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
    
}
@property (weak, nonatomic) IBOutlet UITextField *requestTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)touchDownSearch:(id)sender;
@end

