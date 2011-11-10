//
//  CanvasViewController.h
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/9/11.
//  Copyright (c) 2011 Emlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RKUGuidesView;
@class RKURulerView;

@interface CanvasViewController : UIViewController {

	RKUGuidesView *guidesView;
	RKURulerView *verticalRulerView;
	RKURulerView *horizontalRulerView;

	NSMutableArray *canvasGuidesCoordinates;
}


@property (strong, nonatomic) IBOutlet UIView *prescriptionView;


- (IBAction)printPrescription:(id)sender;

- (void)setGuidesView;
- (void)setRulers;

@end
