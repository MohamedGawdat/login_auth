import 'package:connectivity/connectivity.dart';

import 'toast_util.dart';

Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    ToastUtil.showShortToast(message: 'لا يوجد انترنت');
    return false;
  }
  return false;
}
