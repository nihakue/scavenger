//
//  Object.m
//  West_Assignment6
//
//  Created by Gabriel West on 2/21/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "Object.h"

@implementation Object
@synthesize name, species, timeStamp, picture, pictureData;

-(id) init{
    self = [super init];
    return self;
}

-(id) initWith:(NSDictionary *)dictionary and:(NSDate *)date{
    self = [super init];
    if (self){
        self.name = [dictionary objectForKey:@"Name:"];
        self.species = [dictionary objectForKey:@"Species:"];
        picture = [dictionary objectForKey:@"Picture"];
        pictureData = [dictionary objectForKey:@"PictureData"];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM/dd @ HH:mm"];
        self.timeStamp = [formatter stringFromDate:date];
    }
    return self;
}

-(id) initWith:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        name = [dictionary objectForKey:@"Name"];
        species = [dictionary objectForKey:@"Species"];
        timeStamp = [dictionary objectForKey:@"Timestamp"];
        pictureData = [dictionary objectForKey:@"PictureData"];
        picture = [UIImage imageWithData:pictureData];
    }
    return self;
}


-(NSString *)getName{
    return self.name;
}

-(NSString *)getTimeStamp{
    return timeStamp;
}

-(UIImage*) getPicture{
    return picture;
}


@end
