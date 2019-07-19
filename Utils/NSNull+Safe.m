

#import "NSNull+Safe.h"

#define JsonObjects @[@"",@0,@{},@[]]

@implementation NSNull (Safe)

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    for (id jsonObj in JsonObjects) {
        if ([jsonObj respondsToSelector:aSelector]) {
            NSLog(@"NULL出现了,这个对象本来是_%@",[jsonObj class]);
            return jsonObj;
        }
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
