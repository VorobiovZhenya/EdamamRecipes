//
//  EdamamRequest.h
//  EdamamRecipes
//
//  Created by Zhenya on 8/16/16.
//  Copyright © 2016 Zhenka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EdamamRequest : NSObject
{
    NSString *appID;
    NSString *appKey;
    NSDictionary *results;
    NSInteger countOfResults;
    NSArray *hits;
}
    -(void) setAppID : (NSString*) theAppID;
    -(void) setAppKey : (NSString*) theAppKey;
    -(void) recipeSearch : (NSString*) queryText;
    -(NSInteger) count; //Number of results found
    -(NSData*) getRecipeImg:(NSInteger)index;
    -(NSString*) getRecipeLabel:(NSInteger)index;
    -(NSString*) getRecipeIngredientsString:(NSInteger)index;
@end
