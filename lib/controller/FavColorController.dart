import 'package:get/get.dart';
import 'package:simackges/services/DbHelper.dart';

class FavColorController extends GetxController {
  final favColor = false.obs;
  final DBHelper _dbHelper = DBHelper();
  final name = ''.obs;
  final network = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void changeValue({required String name, required String network}) {
    this.name.value = name;
    this.network.value = network;
    changeColor();
  }

  void changeColor() async {
    favColor.value = await _dbHelper.checkFavouriteList(
        name: name.value, network: network.value);
  }
}
