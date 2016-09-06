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
    NSURL *URLString;
    NSData *responseData;
}
    -(void) setAppID : (NSString*) theAppID;
    -(void) setAppKey : (NSString*) theAppKey;
    -(NSDictionary*) recipeSearch : (NSString*) queryText;
@end
