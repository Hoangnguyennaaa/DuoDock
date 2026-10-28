#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <notify.h>
#import <spawn.h>

#define PREF_PATH_ROOTLESS @"/var/jb/var/mobile/Library/Preferences/com.hoangnguyen.duodock.plist"
#define PREF_PATH_ROOTFUL  @"/var/mobile/Library/Preferences/com.hoangnguyen.duodock.plist"
#define PREF_CHANGED_NOTIFICATION "com.hoangnguyen.duodock/preferences.changed"
#define PREF_RESPRING_NOTIFICATION "com.hoangnguyen.duodock/respring"
#define PREF_RESET_NOTIFICATION "com.hoangnguyen.duodock/reset"

// Forward declarations
@class SBDockView, SBRootFolderView, SBFloatingDockView;
@class SBIconListView, SBIconView, SBIconController;

@interface SBIconView : UIView
@property (nonatomic, assign) BOOL labelHidden;
- (void)setLabelHidden:(BOOL)hidden;
@end

@interface SBIconListView : UIView
@property (nonatomic, copy) NSString *iconLocation;
@property (nonatomic, readonly) BOOL isDock;
- (NSArray<SBIconView *> *)displayedIconViews;
- (NSUInteger)maximumIconCount;
- (UIEdgeInsets)layoutInsetsForOrientation:(NSInteger)orientation;
- (void)layoutIconsNow;
@end

@interface SBDockIconListView : SBIconListView
@end

@interface SBDockView : UIView
@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic, readonly) SBDockIconListView *dockIconListView;
- (SBDockIconListView *)_iconListView;
- (double)dockHeight;
@end

@interface SBRootFolderView : UIView
@property (nonatomic, retain) SBDockView *dockView;
- (CGRect)_frameForDockView;
- (void)layoutSubviews;
@end

@interface SBFloatingDockView : UIView
@property (nonatomic, retain) UIView *mainPlatterView;
@property (nonatomic, retain) SBIconListView *userIconListView;
@property (nonatomic, retain) UIView *dividerView;
- (void)layoutSubviews;
@end

@interface SBIconController : NSObject
+ (id)sharedInstance;
- (void)relayout;
- (SBRootFolderView *)_rootFolderView;
- (id)iconManager;
- (BOOL)isShowingSpotlightOrLeadingCustomView;
- (BOOL)presentSpotlightFromSource:(unsigned long long)arg1 animated:(BOOL)arg2 completionHandler:(id)arg3;
- (BOOL)dismissSpotlightAnimated:(BOOL)arg1 completionHandler:(id)arg2;
- (void)presentSpotlightAnimated:(BOOL)animated;
@end

@interface DuoDockSearchButton : UIControl
@property (nonatomic, strong) UIVisualEffectView *blurView;
@property (nonatomic, strong) UIImageView *iconImageView;
- (void)updateAppearanceWithDockFrame:(CGRect)dockFrame containerBounds:(CGRect)containerBounds;
@end
