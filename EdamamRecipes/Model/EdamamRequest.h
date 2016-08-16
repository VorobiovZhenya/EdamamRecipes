//
//  EdamamRequest.h
//  EdamamRecipes
//
//  Created by Zhenya on 8/16/16.
//  Copyright © 2016 Zhenka. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

@interface EdamamRequest : NSObject
{
    NSString *appID;
    NSString *appKey;
    NSString *requestString;
    NSURL *URLString;
    NSURLRequest *URLRequestString;
    NSData *responseData;
}
    -(void) setAppID : (NSString*) theAppID;
    -(void) setAppKey : (NSString*) theAppKey;
    -(NSString*) recipeSearch : (NSString*) queryText;
@end
