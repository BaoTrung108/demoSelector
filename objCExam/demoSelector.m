//
//  demoSelector.m
//  objCExam
//
//  Created by trung bao on 16/09/2015.
//  Copyright (c) Năm 2015 baotrung. All rights reserved.
//

#import "demoSelector.h"

@interface demoSelector ()
@property (weak, nonatomic) IBOutlet UISlider *slide;

@end

@implementation demoSelector

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)click:(id)sender {
    //[self performSelectorInBackground:@selector(toclick) withObject:nil];
    [self performSelectorOnMainThread:@selector(toclick) withObject:nil waitUntilDone:false];
    [self performSelector:@selector(hideslide) withObject:nil afterDelay:7];
    [self performSelectorInBackground:@selector(processData:) withObject:@{@"tao":@"apple",@"chanh":@"Lemon"}];
}
-(void) toclick {
    [NSThread sleepForTimeInterval:5];
}
-(void) hideslide {
    self.slide.hidden=TRUE;
}
-(void) processData: (NSDictionary*) data {
    for (NSString* key in [data allKeys]){
        NSLog(@"%@ - %@",key,[data valueForKey:key]);
    }
}
@end
