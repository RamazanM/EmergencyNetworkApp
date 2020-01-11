package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.connectivity.ConnectivityPlugin;
import io.flutter.plugins.googlemaps.GoogleMapsPlugin;
import io.flutter.plugins.sensors.SensorsPlugin;
import io.flutter.plugins.urllauncher.UrlLauncherPlugin;
import com.example.wifi_configuration.WifiConfigurationPlugin;
import com.alternadom.wifiiot.WifiIotPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    ConnectivityPlugin.registerWith(registry.registrarFor("io.flutter.plugins.connectivity.ConnectivityPlugin"));
    GoogleMapsPlugin.registerWith(registry.registrarFor("io.flutter.plugins.googlemaps.GoogleMapsPlugin"));
    SensorsPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sensors.SensorsPlugin"));
    UrlLauncherPlugin.registerWith(registry.registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"));
    WifiConfigurationPlugin.registerWith(registry.registrarFor("com.example.wifi_configuration.WifiConfigurationPlugin"));
    WifiIotPlugin.registerWith(registry.registrarFor("com.alternadom.wifiiot.WifiIotPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
