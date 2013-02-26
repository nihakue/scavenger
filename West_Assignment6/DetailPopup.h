//
//  DetailPopup.h
//  West_Assignment6
//
//  Created by Gabriel West on 2/25/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Object.h"

@interface DetailPopup : UIView{
    
    IBOutlet UILabel *speciesL;
    IBOutlet UILabel *nameL;
    IBOutlet UIImageView *pictureView;
    IBOutlet UILabel *timeStampL;
}

-(IBAction)closeDetail:(id)sender;

-initWithFrame:(CGRect)frame and:(Object *)object;

@end
