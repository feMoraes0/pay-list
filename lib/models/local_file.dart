import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalFile {
  Future<File> _getFile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<dynamic> readFile() async {
    try {
      File file = await this._getFile();
      return file.readAsStringSync();
    } catch(error) {
      return null;
    }
  }

  Future<void> saveFile(String data) async {
    File file = await this._getFile();
    await file.writeAsString(data);
  }

  Future<void> deleteFile() async {
    File file = await this._getFile();
    await file.delete();
  }
}
