//
//  EdamamRecipe.h
//  EdamamRecipes
//
//  Created by Zhenya on 3/5/17.
//  Copyright © 2017 Zhenka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EdamamRecipe : NSObject
{
    
    NSInteger count; //Number of results found
    NSData*   RecipeImg;
    NSString* RecipeLabel;
    NSString* RecipeIngredientsString;
    NSArray*  ReciepeIngredientsArray;
}

@end
