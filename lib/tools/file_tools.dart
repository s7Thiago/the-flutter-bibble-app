import 'package:flutter/services.dart' show rootBundle;

class FileTools {
  Future<String> loadFromBibbleJson(String fileName) async {
    return await rootBundle.loadString('assets/json/$fileName.json');
  }
}
