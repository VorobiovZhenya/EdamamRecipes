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
-(NSString*) recipeSearch:(NSString*)queryText
{
    // https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}
    URLString = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.edamam.com/search?q=%@&app_id=%@&app_key=%@", queryText, appID, appKey]];
    
    responseData = [NSData dataWithContentsOfURL:URLString];
    
    return [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
}

@end
