
class NetworkConfig {
  static const String serverIp = '192.168.1.251';
  static const String serverPort = '3000';


  static String get baseUrl => 'http://$serverIp:$serverPort';


  static const Map<String, String> networkProfiles = {
    'home': '192.168.1.100',
    'office': '192.168.182.148',
    'mobile_hotspot': '192.168.43.1',
    'localhost': '127.0.0.1',
  };


  static void switchNetwork(String profileName) {
    if (networkProfiles.containsKey(profileName)) {
      // ในการใช้งานจริง อาจจะต้องใช้ SharedPreferences หรือ config file
      print(
        'Switching to $profileName network: ${networkProfiles[profileName]}',
      );
    }
  }
}
