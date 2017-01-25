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
        //NSMutableString *query = theQueryText;
        queryText = [theQueryText stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        [self recipeSearch];

    }

-(void)recipeSearch
{
    // https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}
    NSURL *URLString = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.edamam.com/search?q=%@&from=%li&app_id=%@&app_key=%@",queryText ,(long)from ,  appID, appKey]];
    
    /*NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:URLString];
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:0];
    NSURLSessionDataTask *sesTask = [session dataTaskWithRequest:URLRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {
            //if(error == nil)
            {
                NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                NSLog(@"Data = %@",text);
            }
            //responseData = [[NSData alloc] initWithData:respData];
        }];
    [sesTask resume];
    [sesTask cancel];
    */
    NSError *error = nil;
    NSData *responseData = [NSData dataWithContentsOfURL:URLString options:0 error:&error];
    if (error){
        NSLog(@"Response hadn't been gotten!");
        }
    NSLog(@"%@",[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);

    results = [NSJSONSerialization
                 JSONObjectWithData:responseData
                 options:0
                 error:&error];
    if (error){
        NSLog(@"Response hadn't been parsed!");
    }
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
-(NSArray*) getReciepeIngredientsArray:(NSInteger)index
{
    NSDictionary *recipe = hits[index][@"recipe"];
    NSArray *ingredientLines = recipe[@"ingredientLines"]; //Ingredients list
    return ingredientLines;
}

@end
