

#import "NSObject+runtime.h"
#import <objc/runtime.h>

@implementation NSObject (runtime)

#pragma mark - method_exchangeImplementations
+ (void)swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    Method originMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethodInit = class_addMethod(class, originalSelector,method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethodInit) {
        class_addMethod(class, swizzledSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }
    else
    {
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
}

+ (void)swizzleClassSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    if ((int)originalMethod != 0 && (int)swizzledMethod != 0) {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
