import 'package:flutter/material.dart';
import 'package:jsonversion/Model/NetworkHelper.dart';
import 'package:jsonversion/Model/modelVersion.dart';
import 'package:provider/provider.dart';

class VersionData extends ChangeNotifier{
  bool loading= true;
  List<Version> vd;
  void loadVersions(){
    Services.getVersions().then((versions){
      vd = versions;
      loading = false;
      notifyListeners();

    });
  }
}
