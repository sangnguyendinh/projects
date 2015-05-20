typedef struct _RGBA {
	CGFloat r;
	CGFloat g;
	CGFloat b;
	CGFloat a;
} RGBA;

@interface Colors : NSObject
{
}

+ (UIColor*)colorWithHex:(uint32_t)hex;

RGBA rgbaWithHex(uint32_t hex);

@end
