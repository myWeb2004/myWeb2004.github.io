import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import '../Model/Pixabay_model.dart';

class homeController extends GetxController {
  var isloading = true.obs;
  var hits = <PixaBay>[].obs;
  static const String api_key = "43412822-f3cddb79185238e0269719dbc";
  Uri url =
      Uri.parse("https://pixabay.com/api/?key=${api_key}&q=nature&per_page=50");

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() {
    try {
      isloading(true);
      http.get(url).then((onResp) {
        print(onResp.body);
        var sn = OpenseaModel(assets: []).fromJson(json.decode(onResp.body));
        hits.assignAll(sn);
      }).catchError((onError) {
        print(onError.toString());
      });
    } finally {
      isloading(false);
    }
  }
}
