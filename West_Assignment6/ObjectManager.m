//
//  ObjectManager.m
//  West_Assignment6
//
//  Created by Gabriel West on 2/20/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "ObjectManager.h"

@implementation ObjectManager
@synthesize plantArray, critterArray, plantKeys, critterKeys;

-(id)init{
    self = [super init];
    if (self) {
        plantArray = [[NSMutableArray alloc] init];
        critterArray = [[NSMutableArray alloc] init];
        }
    return self;
}

-(id)initWithContentsOfFileAt:(NSString*)path{
    self = [super init];
    NSArray* dataArray = [NSArray arrayWithContentsOfFile:[ObjectManager pathForFile:path]];
    if (self) {
        plantArray = [[NSMutableArray alloc] init];
        critterArray = [[NSMutableArray alloc] init];
        for (NSDictionary* dict in dataArray) {
            NSString * idString = [dict objectForKey:@"ID"];
            if ([idString isEqualToString:@"plantRecord"]) {
                [self.plantArray addObject:[[PlantObject alloc]initWith:dict]];
            }
            else if ([idString isEqualToString:@"critterRecord"]){
                [self.critterArray addObject:[[CritterObject alloc]initWith:dict]];
            }
        }

    }
    return self;
}

-(id)initWithArrayOfDictionaries:(NSArray *)arrayOfDictionaries{
    self = [super init];
    if (self) {
        plantArray = [[NSMutableArray alloc] init];
        critterArray = [[NSMutableArray alloc] init];
        for (NSDictionary* dict in arrayOfDictionaries) {
            NSString * idString = [dict objectForKey:@"ID"];
            if ([idString isEqualToString:@"plantRecord"]) {
                [self.plantArray addObject:[[PlantObject alloc]initWith:dict]];
            }
            else if ([idString isEqualToString:@"critterRecord"]){
                [self.critterArray addObject:[[CritterObject alloc]initWith:dict]];
            }
        }
    }
    return self;
}
 
+(NSArray*)objectKeys{
    static NSArray *_objectKeys;
    if(_objectKeys == nil){
        _objectKeys = [[NSArray alloc]initWithObjects:@"ID", @"Name", @"Species", @"Timestamp", @"PictureData", nil];
    }
    return _objectKeys;
}

+(NSString*)pathForFile:(NSString *)file{
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    NSString *recordsPath = [documentDirectory stringByAppendingPathComponent:file];
    return recordsPath;
}

-(void) addObject:(Object*)newObject{
    NSSortDescriptor* descriptor = [[NSSortDescriptor alloc]initWithKey:@"Name" ascending:YES];
    NSArray * sortDescriptors = [NSArray arrayWithObject:descriptor];
    NSArray * sortedArray;
    
    
    
    if ([newObject isMemberOfClass:[PlantObject class]]) {
        [plantArray addObject:newObject];
        sortedArray = [plantArray sortedArrayUsingDescriptors:sortDescriptors];
        plantArray = [NSMutableArray arrayWithArray:sortedArray];
        
        NSLog(@"the type of object is: %@", newObject);
    }
    else{
        [critterArray addObject:newObject];
        NSLog(@"Inside of addObject, the object is a: %@", newObject);
        sortedArray = [critterArray sortedArrayUsingDescriptors:sortDescriptors];
        critterArray = [NSMutableArray arrayWithArray:sortedArray];
    }
}

-(NSArray*)toArray{
    NSString *plantID = @"plantRecord";
    NSString *critterID = @"critterRecord";
    NSMutableArray* information = [[NSMutableArray alloc]init];
    for (Object* plant in plantArray) {
        NSArray *plantInfo = [NSArray arrayWithObjects:plantID, plant.name, plant.species, plant.timeStamp, plant.pictureData, nil];
        NSDictionary * itemInfo = [[NSDictionary alloc] initWithObjects: plantInfo forKeys:[ObjectManager objectKeys]];
        [information addObject:itemInfo];
    }
    for (Object* critter in critterArray) {
        NSArray *critterInfo = [NSArray arrayWithObjects:critterID, critter.name, critter.species, critter.timeStamp, critter.pictureData, nil];
        NSDictionary * itemInfo = [[NSDictionary alloc] initWithObjects: critterInfo forKeys:[ObjectManager objectKeys]];
        [information addObject:itemInfo];
    }
    return information;
}

-(BOOL)saveData{
    NSArray* information = [NSArray arrayWithArray:[self toArray]];
    return [information writeToFile:[ObjectManager pathForFile:@"records.out"] atomically:YES];
}

@end
