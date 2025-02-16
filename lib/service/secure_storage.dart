import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = FlutterSecureStorage();

  Future<void> writeKey(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readKey(String key) async {
    return await storage.read(key: key);
  }

  void deleteKey(String key) async {
    await storage.delete(key: key);
  }

  Future<Map<String, String>> readAll() async {
    return await storage.readAll();
  }

  void deleteAll() async {
    await storage.deleteAll();
  }
}
