//
//  ViewController.h
//  West_Assignment6
//
//  Created by Gabriel West on 2/20/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectManager.h"
#import "PlantObject.h"
#import "Object.h"
#import "WelcomePop.h"
#import "AddObject.h"
#import "DetailPopup.h"



@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    __weak IBOutlet UITableView *uiTable;
    IBOutlet UIButton *closeDetailB;
    WelcomePop * welcomeVC;
    AddObject * addVC;
}

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)cameraButtonPressed:(id)sender;
-(IBAction)closeDetail:(id)sender;
@property(strong, nonatomic) ObjectManager * objMan;
@property BOOL firstTimeUser;

@end
