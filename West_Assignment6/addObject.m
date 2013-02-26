//
//  AddObject.m
//  West_Assignment6
//
//  Created by Gabriel West on 2/21/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "AddObject.h"

@interface AddObject ()

@end

@implementation AddObject
@synthesize objMan, pictureView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [typeSelector addTarget:self action:@selector(changeBG:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated{
    if (pictureView.image == nil) {
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        [self presentViewController:picker animated:YES completion:NULL];
    }

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    pictureView.image = image;
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    pictureView.image = [UIImage imageNamed:@"no_image.png"];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)goBack:(id)sender{
    [self clearFields];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(IBAction)changeBG:(id)sender{
    NSLog(@"ChangeBG");
    switch (typeSelector.selectedSegmentIndex) {
        case 0:
        {
            NSLog(@"CASE 0");
            self.view.backgroundColor = [UIColor colorWithRed:.65 green:.92 blue:.56 alpha:1];
            break;
        }
            
        case 1:
        {
            self.view.backgroundColor = [UIColor colorWithRed:.61 green:.45 blue:.14 alpha:1];
            break;
        }
            
        default:
        {
            NSLog(@"Case -1");
            self.view.backgroundColor = [UIColor whiteColor];
            break;
        }
    }
}


-(IBAction)addPressed:(id)sender{
    //Protects user from adding an entry with no type
    if (typeSelector.selectedSegmentIndex == -1) {
        NSLog(@"Please select a type!");
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Please select a type." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL, nil];
        [alert show];
        return;
    }
    
    //Adding the entry
    NSData * pictureData = [NSData dataWithData:UIImagePNGRepresentation(pictureView.image)];
    fieldKeys = [[NSArray alloc] initWithObjects:nameL.text, speciesL.text, @"Picture", @"PictureData", nil];
    
    fieldValues = [[NSArray alloc] initWithObjects:nameTF.text,speciesTF.text, pictureView.image, pictureData, nil];
    
    NSDictionary * newObjInfo = [[NSDictionary alloc] initWithObjects:fieldValues forKeys:fieldKeys];
    switch (typeSelector.selectedSegmentIndex) {
        case 0:
        {
            newObject = [[PlantObject alloc] initWith:newObjInfo and:[NSDate date]];
            NSLog(@"I created a Plant");
            break;
        }
        case 1:
        {
            newObject = [[CritterObject alloc]initWith:newObjInfo and:[NSDate date]];
            NSLog(@"I created a critter");
            break;
        }
        default:
            break;
    }
    [self.objMan addObject:newObject];
    [self clearFields];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)clearFields{
    pictureView.image = nil;
    nameTF.text = @"";
    speciesTF.text = @"";
    typeSelector.selectedSegmentIndex = -1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
