//
//  DetailPopup.m
//  West_Assignment6
//
//  Created by Gabriel West on 2/25/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "DetailPopup.h"
#define DETAIL_POPUP_TAG 100;

@implementation DetailPopup

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:.7 green:.6 blue:.5 alpha:1];
        
    }
    return self;
}

-(id) initWithFrame:(CGRect)frame and:(Object *)object{
    self = [super initWithFrame:frame];
    if (self){
        NSArray * nibViews = [[NSBundle mainBundle]loadNibNamed:@"DetailPopup" owner:self options:nil];
        UIView * mainView = (UIView*)[nibViews objectAtIndex:0];
        mainView.tag = DETAIL_POPUP_TAG;
        pictureView.image = object.picture;
        nameL.text = object.name;
        speciesL.text = object.species;
        timeStampL.text = object.timeStamp;
        [self addSubview:mainView];
    }
    return self;
}


-(IBAction)closeDetail:(id)sender{
    NSLog(@"close tapped");
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
