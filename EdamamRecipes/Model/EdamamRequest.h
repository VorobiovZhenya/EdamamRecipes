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
    NSString *queryText;
    NSInteger from; //the initial value of the index for searching
    NSDictionary *results;
    NSArray *hits;
    //NSData * responseData;
}
    -(void) setAppID : (NSString*) theAppID;
    -(void) setAppKey : (NSString*) theAppKey;
    -(void) setQueryText : (NSString*) theQueryText;
    -(void) recipeSearch;
    -(NSInteger) count; //Number of results found
    -(NSData*) getRecipeImg:(NSInteger)index;
    -(NSString*) getRecipeLabel:(NSInteger)index;
    -(NSString*) getRecipeIngredientsString:(NSInteger)index;
    -(NSArray*) getReciepeIngredientsArray:(NSInteger)index;
@end
