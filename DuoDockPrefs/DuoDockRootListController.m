#import "DuoDockRootListController.h"
#import <spawn.h>
#import <notify.h>

#define PREF_PATH_ROOTLESS @"/var/jb/var/mobile/Library/Preferences/com.hoangnguyen.duodock.plist"
#define PREF_PATH_ROOTFUL  @"/var/mobile/Library/Preferences/com.hoangnguyen.duodock.plist"
#define PREF_CHANGED_NOTIFICATION "com.hoangnguyen.duodock/preferences.changed"
#define PREF_RESPRING_NOTIFICATION "com.hoangnguyen.duodock/respring"
#define PREF_RESET_NOTIFICATION "com.hoangnguyen.duodock/reset"

@interface PSSpecifier (DuoDock)
- (id)propertyForKey:(NSString *)key;
- (void)setProperty:(id)value forKey:(NSString *)key;
@end

@implementation DuoDockRootListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
        if (!_specifiers || _specifiers.count == 0) {
            _specifiers = [self loadSpecifiersFromPlistName:@"DuoDock" target:self];
        }
    }
    return _specifiers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *respringBtn = [[UIBarButtonItem alloc] initWithTitle:@"Respring"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(respringPrompt:)];
    respringBtn.tintColor = [UIColor systemBlueColor];
    self.navigationItem.rightBarButtonItem = respringBtn;
}

- (id)readPreferenceValue:(PSSpecifier *)specifier {
    NSString *key = [specifier propertyForKey:@"key"];
    CFPreferencesAppSynchronize(CFSTR("com.hoangnguyen.duodock"));
    CFPropertyListRef val = CFPreferencesCopyAppValue((__bridge CFStringRef)key, CFSTR("com.hoangnguyen.duodock"));
    if (val) {
        return (__bridge_transfer id)val;
    }
    
    NSString *path = PREF_PATH_ROOTLESS;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        path = PREF_PATH_ROOTFUL;
    }
    
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:path];
    id v = settings[key];
    if (!v) {
        v = [specifier propertyForKey:@"default"];
    }
    return v;
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
    NSString *key = [specifier propertyForKey:@"key"];
    CFPreferencesSetAppValue((__bridge CFStringRef)key, (__bridge CFPropertyListRef)value, CFSTR("com.hoangnguyen.duodock"));
    CFPreferencesAppSynchronize(CFSTR("com.hoangnguyen.duodock"));
    
    NSString *path = PREF_PATH_ROOTLESS;
    NSString *dir = [path stringByDeletingLastPathComponent];
    
    NSError *error = nil;
    if (![[NSFileManager defaultManager] fileExistsAtPath:dir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:path] ?: [NSMutableDictionary dictionary];
    [settings setObject:value forKey:key];
    [settings writeToFile:path atomically:YES];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:PREF_PATH_ROOTFUL]) {
        [settings writeToFile:PREF_PATH_ROOTFUL atomically:YES];
    }
    
    CFNotificationCenterPostNotification(
        CFNotificationCenterGetDarwinNotifyCenter(),
        CFSTR(PREF_CHANGED_NOTIFICATION),
        NULL,
        NULL,
        YES
    );
}

- (void)respringPrompt {
    [self respringPrompt:nil];
}

- (void)respringPrompt:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"DuoDock"
                                                                   message:@"Khởi động lại SpringBoard (Respring) để áp dụng toàn bộ thay đổi ngay bây giờ?"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *respringAction = [UIAlertAction actionWithTitle:@"Respring ngay"
                                                             style:UIAlertActionStyleDestructive
                                                           handler:^(UIAlertAction * _Nonnull action) {
        [self respring];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Huỷ"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:respringAction];
    [alert addAction:cancelAction];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && [sender isKindOfClass:[UIView class]]) {
        alert.popoverPresentationController.sourceView = (UIView *)sender;
        alert.popoverPresentationController.sourceRect = ((UIView *)sender).bounds;
    }
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)respring {
    CFNotificationCenterPostNotification(
        CFNotificationCenterGetDarwinNotifyCenter(),
        CFSTR(PREF_RESPRING_NOTIFICATION),
        NULL,
        NULL,
        YES
    );
    notify_post(PREF_RESPRING_NOTIFICATION);
    
    pid_t pid;
    const char *args_sbreload[] = {"/var/jb/usr/bin/sbreload", NULL};
    if (access("/var/jb/usr/bin/sbreload", X_OK) == 0) {
        posix_spawn(&pid, "/var/jb/usr/bin/sbreload", NULL, NULL, (char *const *)args_sbreload, NULL);
    }
}

- (void)resetToDefaults {
    [self resetToDefaults:nil];
}

- (void)resetToDefaults:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Khôi phục mặc định"
                                                                   message:@"Đặt lại tất cả thiết lập DuoDock về ban đầu?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Đồng ý"
                                                       style:UIAlertActionStyleDestructive
                                                     handler:^(UIAlertAction * _Nonnull action) {
        CFPreferencesSetAppValue(CFSTR("enabled"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockSide"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockIconCount"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockIconScale"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockWidth"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockHeight"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("rightMargin"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("verticalOffset"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("cornerRadius"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockBlurEnabled"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockBlurStyle"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockBlurAlpha"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockBorderEnabled"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockBorderWidth"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("dockShadowEnabled"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("hideDockLabels"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("homeCompressGrid"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("homeRightInset"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesSetAppValue(CFSTR("expandBottomRows"), NULL, CFSTR("com.hoangnguyen.duodock"));
        CFPreferencesAppSynchronize(CFSTR("com.hoangnguyen.duodock"));
        
        [[NSFileManager defaultManager] removeItemAtPath:PREF_PATH_ROOTLESS error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:PREF_PATH_ROOTFUL error:nil];
        
        CFNotificationCenterPostNotification(
            CFNotificationCenterGetDarwinNotifyCenter(),
            CFSTR(PREF_CHANGED_NOTIFICATION),
            NULL,
            NULL,
            YES
        );
        notify_post(PREF_RESET_NOTIFICATION);
        [self reloadSpecifiers];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Huỷ"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
