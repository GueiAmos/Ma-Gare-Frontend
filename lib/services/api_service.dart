import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiService extends GetxController {
  static ApiService get instance => Get.find();
  final box = GetStorage();
  late String token;
  late Dio apiToken;
  var nbrDemEA = 0.obs;
  var nbrDemEC = 0.obs;
  var nbrDemLI = 0.obs;
  var nbrDemAN = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    token = box.read('token');
    apiToken = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8000/api',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        connectTimeout: const Duration(milliseconds: 30000), // 10 secondes
        receiveTimeout: const Duration(milliseconds: 20000), // 15 secondes
      ),
    );
    print("Initialisation de l'API TOKEN: $token");
    super.onInit();
  }

  @override
  void onReady() {
    print("Recuperation des statistiques");
    super.onReady();
  }

  @override
  void onClose() {
    print("Destruction de l'API");
    super.onClose();
  }
}
