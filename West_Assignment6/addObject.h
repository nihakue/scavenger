//
//  AddObject.h
//  West_Assignment6
//
//  Created by Gabriel West on 2/21/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectManager.h"
#import "PlantObject.h"
#import "CritterObject.h"
#import "Object.h"

@interface AddObject : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate>{
    
    __weak IBOutlet UILabel *nameL;
    __weak IBOutlet UILabel *speciesL;
    __weak IBOutlet UITextField *nameTF;
    __weak IBOutlet UITextField *speciesTF;
    __weak IBOutlet UISegmentedControl *typeSelector;
    Object * newObject;
    NSArray * fieldKeys;
    NSArray * fieldValues;
}

-(IBAction)addPressed:(id)sender;


@property(strong, nonatomic) ObjectManager *objMan;
@property (strong, nonatomic) IBOutlet UIImageView *pictureView;

@end
