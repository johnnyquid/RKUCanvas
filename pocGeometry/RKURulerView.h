//
//  RKURulerView.h
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/9/11.
//  Copyright (c) 2011 Raku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKURulerView : UIView {

	BOOL isLandscape;
}

- (id)initWithFrame:(CGRect)frame andBool:(BOOL)isViewLandscape;

@end
