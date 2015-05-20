#import "Colors.h"


@implementation Colors

+ (UIColor*)colorWithHex:(uint32_t)hex
{
	CGFloat r = (CGFloat)((hex & 0xFF000000) >> 24) / 0xFF;
	CGFloat g = (CGFloat)((hex & 0x00FF0000) >> 16) / 0xFF;
	CGFloat b = (CGFloat)((hex & 0x0000FF00) >> 8) / 0xFF;
	CGFloat a = (CGFloat)((hex & 0x000000FF) >> 0) / 0xFF;
	
	return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

RGBA rgbaWithHex(uint32_t hex){
	RGBA rgba;
	
	rgba.r = (CGFloat)((hex & 0xFF000000) >> 24) / 0xFF;
	rgba.g = (CGFloat)((hex & 0x00FF0000) >> 16) / 0xFF;
	rgba.b = (CGFloat)((hex & 0x0000FF00) >> 8) / 0xFF;
	rgba.a = (CGFloat)((hex & 0x000000FF) >> 0) / 0xFF;
		
	return rgba;
}

@end
