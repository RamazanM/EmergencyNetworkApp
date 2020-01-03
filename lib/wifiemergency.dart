import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'package:wifi_iot/wifi_iot.dart';
class WifiFeatures {

  static WifiFeatures instance;

  WifiFeatures wifiFeatures(){
    instance=instance==null?new WifiFeatures():instance;
    return instance;
  }

  static void  getSSIDList()async{ //SSID 
    WiFiForIoTPlugin.setEnabled(true);
    print(await WiFiForIoTPlugin.loadWifiList());
  }
  static void closeWifi(){
    WiFiForIoTPlugin.setEnabled(false);
  }

  static Future<bool> hasInternet()async {  //İnternete erişim var mı kontrol et
    try {
      var getr = await http.get('http://www.google.com');
      print(getr.statusCode.toString());
      return true;
    }
    catch(val){
      return false;
    }
  }
  static Future<int> mobileOrWifi() async {//1 for mobile 2 for wifi
    ConnectivityResult cr=await Connectivity().checkConnectivity();
    if(cr==ConnectivityResult.mobile) return 1;
    else if(cr==ConnectivityResult.wifi) return 2;
    else return 0;
  }
  static Future<String> getWifiSsid() async {
    String ssid= await Connectivity().getWifiName();
    return ssid;
  }
  
/*  static Future<bool> hasQuakeWifi() async {
    var listofwifi=await WifiConfiguration.getWifiList();
    bool flag=false;
    listofwifi.forEach((wifi){
      if(wifi=="DEPREM")  flag=true;
    });
    return flag;
  }
  static Future<bool> connectQuakeWifi()async{
    if((await hasQuakeWifi())){
      String status= await WifiConfiguration.connectToWifi("DEPREM", "","io.flutter.app.FlutterApplication");
      if(status=="connected" || status=="alreadyConnected")return true;
      else return false;
    }
  }*/
  //Etrafta deprem isimli bir ap var mı bak

  //Yoksa oluştur.

  //
}