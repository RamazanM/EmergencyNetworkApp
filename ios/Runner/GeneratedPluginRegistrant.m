//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <connectivity/ConnectivityPlugin.h>
#import <google_maps_flutter/GoogleMapsPlugin.h>
#import <sensors/SensorsPlugin.h>
#import <url_launcher/UrlLauncherPlugin.h>
#import <wifi_configuration/WifiConfigurationPlugin.h>
#import <wifi_iot/WifiIotPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTConnectivityPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTConnectivityPlugin"]];
  [FLTGoogleMapsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleMapsPlugin"]];
  [FLTSensorsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSensorsPlugin"]];
  [FLTUrlLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTUrlLauncherPlugin"]];
  [WifiConfigurationPlugin registerWithRegistrar:[registry registrarForPlugin:@"WifiConfigurationPlugin"]];
  [WifiIotPlugin registerWithRegistrar:[registry registrarForPlugin:@"WifiIotPlugin"]];
}

@end
