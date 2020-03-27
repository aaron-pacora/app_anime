import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:app_anime/features/directory/data/models/directory_model.dart';

abstract class DirectoryDatasource {
  Future<DirectoryModel> getDirectory();
}

class DirectoryDatasourceImpl extends DirectoryDatasource {

  @override
  Future<DirectoryModel> getDirectory() async {
    String data = await rootBundle.loadString('data/directory.json');
    List<dynamic> jsonResult = json.decode(data);
    DirectoryModel directoryModel;
    jsonResult.forEach((value){
      directoryModel = DirectoryModel.fromJson(value, beforeData: directoryModel);
    });
    return Future.value(directoryModel);
  }
}