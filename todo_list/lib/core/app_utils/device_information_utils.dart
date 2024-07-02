import 'package:device_info_plus/device_info_plus.dart';

class DeviceInformationUtils {
  static Future<String> getDeviceId() async {
    var deviceInfo = await DeviceInfoPlugin().deviceInfo;

    return deviceInfo.data['id'].toString();
  }
}
