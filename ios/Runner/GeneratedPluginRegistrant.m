//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<connectivity/FLTConnectivityPlugin.h>)
#import <connectivity/FLTConnectivityPlugin.h>
#else
@import connectivity;
#endif

#if __has_include(<google_maps_flutter/FLTGoogleMapsPlugin.h>)
#import <google_maps_flutter/FLTGoogleMapsPlugin.h>
#else
@import google_maps_flutter;
#endif

#if __has_include(<sensors/FLTSensorsPlugin.h>)
#import <sensors/FLTSensorsPlugin.h>
#else
@import sensors;
#endif

#if __has_include(<url_launcher/FLTURLLauncherPlugin.h>)
#import <url_launcher/FLTURLLauncherPlugin.h>
#else
@import url_launcher;
#endif

#if __has_include(<wifi_configuration/WifiConfigurationPlugin.h>)
#import <wifi_configuration/WifiConfigurationPlugin.h>
#else
@import wifi_configuration;
#endif

#if __has_include(<wifi_iot/WifiIotPlugin.h>)
#import <wifi_iot/WifiIotPlugin.h>
#else
@import wifi_iot;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTConnectivityPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTConnectivityPlugin"]];
  [FLTGoogleMapsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleMapsPlugin"]];
  [FLTSensorsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSensorsPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
  [WifiConfigurationPlugin registerWithRegistrar:[registry registrarForPlugin:@"WifiConfigurationPlugin"]];
  [WifiIotPlugin registerWithRegistrar:[registry registrarForPlugin:@"WifiIotPlugin"]];
}

@end
