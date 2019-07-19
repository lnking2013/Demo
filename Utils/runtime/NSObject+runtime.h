

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (runtime)

#pragma mark - method_exchangeImplementations
/**
 交换实例方法
 
 @param originalSelector 原始类方法
 @param swizzledSelector 交换的类方法
 */
+ (void)swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector;

/**
 交换类方法

 @param originalSelector 原始类方法
 @param swizzledSelector 交换的类方法
 */
+ (void)swizzleClassSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector;
@end

NS_ASSUME_NONNULL_END
