#import <UIKit/UIKit.h>

@interface PSSpecifier : NSObject
- (void)setProperty:(id)value forKey:(NSString *)key;
- (id)propertyForKey:(NSString *)key;
@end

@interface PSListController : UIViewController {
    NSArray *_specifiers;
}
- (NSMutableArray *)loadSpecifiersFromPlistName:(NSString *)name target:(id)target;
- (void)reloadSpecifiers;
- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier;
- (id)readPreferenceValue:(PSSpecifier *)specifier;
@end

@interface DuoDockRootListController : PSListController
- (void)respring;
- (void)respringPrompt;
- (void)resetToDefaults;
@end
