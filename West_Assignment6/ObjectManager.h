//
//  ObjectManager.h
//  West_Assignment6
//
//  Created by Gabriel West on 2/20/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlantObject.h"
#import "CritterObject.h"
#import "Object.h"

@interface ObjectManager : NSObject

-(id)initWithArrayOfDictionaries:(NSArray*) array;
-(id)initWithContentsOfFileAt:(NSString*)path;
-(void)addObject:(Object*)newObject;
-(BOOL)saveData;
-(NSArray*)toArray;
+(NSArray*)objectKeys;
+(NSString*)pathForFile:(NSString*)file;

@property(strong, nonatomic) NSMutableArray* plantArray;
@property(strong, nonatomic) NSMutableArray* critterArray;
@property(strong, nonatomic) NSArray* plantKeys;
@property(strong, nonatomic) NSArray* critterKeys;

@end
