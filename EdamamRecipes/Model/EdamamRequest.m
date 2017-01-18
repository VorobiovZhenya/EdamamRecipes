//
//  EdamamRequest.m
//  EdamamRecipes
//
//  Created by Zhenya on 8/16/16.
//  Copyright © 2016 Zhenka. All rights reserved.
//

#import "EdamamRequest.h"

@implementation EdamamRequest

-(void) setAppID:(NSString *)theAppID
    {
        appID = theAppID;
    }
-(void) setAppKey:(NSString *)theAppKey
    {
        appKey = theAppKey;
    }
-(void) setQueryText:(NSString *)theQueryText
    {
        from = 0;
        queryText = theQueryText;
        [self recipeSearch];
    }
-(void)recipeSearch
{
    // https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}
    NSURL *URLString = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.edamam.com/search?q=%@&from=%li&app_id=%@&app_key=%@",queryText ,(long)from ,  appID, appKey]];
    
    NSData *responseData = [NSData dataWithContentsOfURL:URLString];
    NSLog(@"%@",[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);

    NSError *error = nil;
    results = [NSJSONSerialization
                 JSONObjectWithData:responseData
                 options:0
                 error:&error];
     hits = results[@"hits"];
}
-(NSInteger) count
{
    NSNumber *count = results[@"count"];
    return count.integerValue;
}
-(NSData*) getRecipeImg:(NSInteger)index
{
    if (index >= [hits count])
    {
        from = index;
        NSArray *tmpHits = hits;
        [self recipeSearch];
        [tmpHits arrayByAddingObjectsFromArray:hits];
        hits = tmpHits;
    }
    NSDictionary *recipe = hits[index][@"recipe"];
    NSString *recipeImage = recipe[@"image"];
    NSURL *imgUrl = [NSURL URLWithString:recipeImage];
    NSData *imgData = [NSData dataWithContentsOfURL:imgUrl];
    return imgData;
}
-(NSString*) getRecipeLabel:(NSInteger)index
{
    if (index >= [hits count])
    {
        from = index;
        NSMutableArray *tmpHits = [[NSMutableArray alloc] initWithArray:hits];
        [self recipeSearch];
        //[tmpHits addObjectsFromArray:hits];
        hits = [tmpHits arrayByAddingObjectsFromArray:hits];
    }
    NSDictionary *recipe = hits[index][@"recipe"];
    return recipe[@"label"];
}
-(NSString*) getRecipeIngredientsString:(NSInteger)index
{
    NSDictionary *recipe = hits[index][@"recipe"];
    NSArray *ingredientLines = recipe[@"ingredientLines"]; //Ingredients list
    NSString *ingredientsString = @""; // Array of ingredients in one string

    for(int i =0; i<ingredientLines.count; i++)
    {
        if (i!=0)  ingredientsString = [ingredientsString stringByAppendingFormat:@", %@",ingredientLines[i]];
        else   ingredientsString = [ingredientsString stringByAppendingFormat:@"%@",ingredientLines[i]];
    }
    return ingredientsString;
}
@end
