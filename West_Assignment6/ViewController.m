//
//  ViewController.m
//  West_Assignment6
//
//  Created by Gabriel West on 2/20/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize objMan, firstTimeUser;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    addVC = [[AddObject alloc]init];
    addVC.objMan = self.objMan;
    uiTable.delegate = self;
    uiTable.dataSource = self;
    closeDetailB.enabled = NO;
    closeDetailB.hidden = YES;
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) viewDidAppear:(BOOL)animated{
    if(firstTimeUser){
        firstTimeUser = NO;
        welcomeVC = [[WelcomePop alloc] init];
        [self presentViewController:welcomeVC animated:YES completion:nil];
    }
    [uiTable reloadData];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return [NSString stringWithFormat:@"Plants - %d records", self.objMan.plantArray.count];
        }
            break;
        case 1:{
            return [NSString stringWithFormat:@"Critters - %d records", self.objMan.critterArray.count];
        }
        default:
            break;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return self.objMan.plantArray.count;
            break;
        case 1:
            return self.objMan.critterArray.count;
        default:
            break;
    }
    NSLog(@"No case for section, defaulting.");
    return self.objMan.critterArray.count + self.objMan.plantArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *unused = @"UNUSED";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:unused];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:unused];
    }
    switch (indexPath.section) {
        case 0:
        {
            cell.textLabel.text = [[self.objMan.plantArray objectAtIndex:indexPath.row] getName];
            cell.detailTextLabel.text = [[self.objMan.plantArray objectAtIndex:indexPath.row] getTimeStamp];
            break;
        }
        case 1:
        {
            cell.textLabel.text = [[self.objMan.critterArray objectAtIndex:indexPath.row] getName];
            cell.detailTextLabel.text = [[self.objMan.critterArray objectAtIndex:indexPath.row] getTimeStamp];
            break;
        }
            
    }
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    Object * tappedObject;
    if ([self.view viewWithTag:100]) {
        return;
    }
    switch (indexPath.section) {
        case 0:
        {
            tappedObject = [self.objMan.plantArray objectAtIndex:indexPath.row];
            break;
        }
        case 1:
        {
            tappedObject = [self.objMan.critterArray objectAtIndex:indexPath.row];
            break;
        }
        default:
            break;
    }
    NSLog(@"Row: %d Section: %d accesory tapped", indexPath.row, indexPath.section);
    UIView * popView = [[DetailPopup alloc] initWithFrame:CGRectMake(0, 0, 250, 250) and:tappedObject];
    
    [self.view addSubview:popView];
    closeDetailB.enabled = YES;
    closeDetailB.hidden = NO;

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        switch (indexPath.section) {
            case 0:
            {
                [self.objMan.plantArray removeObjectAtIndex:indexPath.row];
                break;
            }
            case 1:
            {
                [self.objMan.critterArray removeObjectAtIndex:indexPath.row];
                break;
            }
            default:
                break;
        }
    [uiTable reloadData];
    }
}

-(IBAction)closeDetail:(id)sender{
    UIView * view = [self.view viewWithTag:100];
    if (view) {
        [view removeFromSuperview];
        closeDetailB.hidden = YES;
        closeDetailB.enabled = NO;
    }
}

-(IBAction)saveButtonPressed:(id)sender{
    if([self.objMan saveData]){
        NSLog(@"User data saved!");
    }
    else{
        NSLog(@"Something went wrong while saving..");
    }
}

-(IBAction)cameraButtonPressed:(id)sender{
    [self presentViewController:addVC animated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self.objMan saveData];
}

@end
