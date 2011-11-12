//
//  RKUGuidesView.m
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/10/11.
//  Copyright (c) 2011 Raku. All rights reserved.
//

#import "RKUGuidesView.h"

@implementation RKUGuidesView

- (id)initWithFrame:(CGRect)frame andStartCoordinates:(NSArray *)theStartCoordinates andEndCoordinates:(NSArray *)theEndCoordinates {

	self = [super initWithFrame:frame];

	if (self) {

		startCoordinates = theStartCoordinates;
		endCoordinates = theEndCoordinates;
    }

	return self;
}


- (void)drawRect:(CGRect)rect {

	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat purple[4] = {0.9f, 0.1f, 0.8f, 0.8f};

	for (NSInteger i = 0; i < [startCoordinates count]; i++) {

		CGContextSetStrokeColor(context, purple);
		CGContextBeginPath(context);

		CGContextMoveToPoint(context, 
							 ((NSValue *)[startCoordinates objectAtIndex:i]).CGPointValue.x, 
							 ((NSValue *)[startCoordinates objectAtIndex:i]).CGPointValue.y);

		CGContextAddLineToPoint(context, 
								((NSValue *)[endCoordinates objectAtIndex:i]).CGPointValue.x, 
								((NSValue *)[endCoordinates objectAtIndex:i]).CGPointValue.y);

		CGContextStrokePath(context);
	}
}

/*
 NSValue *firstGuideStart = [NSValue valueWithCGPoint:CGPointMake(0.0f, 100.0f)];
 NSValue *firstGuideEnd = [NSValue valueWithCGPoint:CGPointMake(prescriptionView.frame.size.width, 100.0f)];
 */
@end
