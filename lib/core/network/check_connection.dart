import 'dart:io';

Future<bool> hasConnection() async {
  var resp = false;

  try {
    final result = await InternetAddress.lookup('example.com');

    print(result);

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }

  } on SocketException catch (_) {
    print('not connected');
  }

  return resp;
}
