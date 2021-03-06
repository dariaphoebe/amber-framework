//
//  NSSet+Additions.m
//  Amber
//
//  Created by Keith Duncan on 05/04/2009.
//  Copyright 2009. All rights reserved.
//

#import "NSSet+Additions.h"

@implementation NSSet (AFAdditions)

- (NSSet *)setByAddingObjects:(id)currentObject, ... {
	NSMutableSet *newSet = [[self mutableCopy] autorelease];
	
	if (currentObject != nil) {
		[newSet addObject:currentObject];
		
		va_list objectList;
		va_start(objectList, currentObject);
		
		while (currentObject = va_arg(objectList, id))
			[newSet addObject:currentObject];
		
		va_end(objectList);
	}
	
	return newSet;
}

@end
