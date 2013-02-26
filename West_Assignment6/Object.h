//
//  Object.h
//  West_Assignment6
//
//  Created by Gabriel West on 2/21/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object : NSObject

-(id) initWith:(NSDictionary *)dictionary and:(NSDate*) date;
-(id) initWith:(NSDictionary *)dictionary;
-(NSString *) getName;
-(NSString *) getTimeStamp;
-(UIImage *) getPicture;
+(NSArray *) saveKeys;
+(NSArray *) saveValues;


@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) NSString* species;
@property(strong, nonatomic) NSString* timeStamp;
@property(strong, nonatomic) UIImage* picture;
@property(strong, nonatomic) NSData* pictureData;


@end
