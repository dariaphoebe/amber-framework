//
//  AFGeometry.m
//  AmberFoundation
//
//  Created by Keith Duncan on 12/06/2007.
//  Copyright 2007. All rights reserved.
//

#include "AFGeometry.h"

void AFRectDivideEqually(CGRect rect, CGRectEdge edge, NSUInteger count, CGRect *buffer) {
	BOOL vertical = (edge == CGRectMinXEdge || edge == CGRectMaxXEdge);
	CGFloat size = (vertical ? CGRectGetWidth(rect) : CGRectGetHeight(rect))/count;
	
	CGRect remainder;
	CGRectDivide(rect, buffer, &remainder, size, edge);
	
	for (NSUInteger index = 1; index < count; index++)
		buffer[index] = CGRectOffset(buffer[index-1], (vertical * size), (!vertical * size));
}
