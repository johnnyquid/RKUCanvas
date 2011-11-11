//
//  RKUGuidesView.h
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/10/11.
//  Copyright (c) 2011 Emlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKUGuidesView : UIView {

	NSArray *startCoordinates;
	NSArray *endCoordinates;
}


- (id)initWithFrame:(CGRect)frame andStartCoordinates:(NSArray *)theStartCoordinates andEndCoordinates:(NSArray *)theEndCoordinates;

@end
