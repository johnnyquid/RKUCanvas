//
//  CanvasViewController.h
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/9/11.
//  Copyright (c) 2011 Emlink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextPrescriptionComponent.h"

@class RKUGuidesView;
@class RKURulerView;


@interface CanvasViewController : UIViewController {

	RKUGuidesView *guidesView;
	RKURulerView *verticalRulerView;
	RKURulerView *horizontalRulerView;
	

	NSMutableArray *canvasStartGuidesCoordinates;
	NSMutableArray *canvasEndGuidesCoordinates;
}


@property (strong, nonatomic) IBOutlet UIView *prescriptionView;
@property (nonatomic,strong) CALayer *selectedLayer;
@property (nonatomic,strong) NSMutableArray *barComponentsLayers;
@property (nonatomic,assign) Boolean isComponentInPrescripcionView;
@property (nonatomic,assign) CGPoint lastPointInPrescripcionView;

- (void)addBarLayers;
- (IBAction)printPrescription:(id)sender;
- (IBAction)handleSingleTap:(UIGestureRecognizer *)sender;

- (void)setGuidesSource;
- (void)setRulers;

@end
