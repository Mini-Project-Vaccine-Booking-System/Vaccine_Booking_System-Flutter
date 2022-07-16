import 'package:flutter/material.dart';
import '../bindings/api_binding.dart';
import '../bindings/package_binding.dart';
import '../bindings/model_binding.dart';

class CovidViewModel extends ChangeNotifier {
  Covid? _data;
  Covid get data => _data!;

  Future getData() async {
    final dateNow = DateTime.now();
    final stringDate = DateFormat("yyyy-MM-dd").format(dateNow).toString();

    Response response = await CovidAPI.getData(stringDate);
    if (response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;
      final dataRange = data["response"].length - 1;
      Covid getData = Covid(
          recovered:
              data["response"][dataRange]["cases"]["recovered"].toString(),
          positive: data["response"][dataRange]["cases"]["total"].toString(),
          death: data["response"][dataRange]["deaths"]["total"].toString());

      _data = getData;
      notifyListeners();
    }
  }
}
