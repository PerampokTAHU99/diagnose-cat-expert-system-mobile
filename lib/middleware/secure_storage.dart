import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<String> readToken({required String key}) async {
    String? token = await storage.read(key: key);

    if (token?.isEmpty ?? true) {
      return "";
    }

    return token.toString();
  }

  void writeToken({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }
}
