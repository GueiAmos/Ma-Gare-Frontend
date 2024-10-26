import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toastification/toastification.dart';

import '../configs/functions_config.dart';
import '../screens/private/Accueil/home_page.dart';
import '../screens/public/Welcome/welcome_page.dart';
import 'api_service.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();
  final isLogged = false.obs;
  final box = GetStorage();
  late GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  late GlobalKey<FormState> keyFormRegister = GlobalKey<FormState>();
  late Dio authApi;

  @override
  void onInit() {
    super.onInit();
    print('Le contrôleur est initialisé');
  }

  @override
  void onReady() {
    super.onReady();
    authApi = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8000/api/',
        headers: {'Accept': 'application/json'},
      ),
    );
    print('Le contrôleur est prêt et l\'interface utilisateur est construite');
  }

  @override
  void onClose() {
    print('Le contrôleur auth est supprimé');
    Get.put(ApiService());
    print('Le contrôleur api est initialisé');
    super.onClose();
  }

  //verifier si l'utilisateur est connecté ou non
  Future<void> checkLoginStatus() async {
    if (box.read('token') != null) {
      isLogged.value = true;
      //Get.put(ApiService());
    }
    await Future.delayed(const Duration(seconds: 3));
  }

  //connexion
  Future<void> login(
      {required String email, required String motdepasse}) async {
    if (formKeyLogin.currentState!.validate()) {
      loadingCircular();
      try {
        var body = {'email': email, 'password': motdepasse};
        final response = await authApi.post('/login', data: body);
        final json = response.data;
        print(json);
        switch (json['status']) {
          case true:
            print(json);
            final box = GetStorage();
            box.write('token', json['access_token']);
            box.write('user', json['user']);
            Get.back();
            isLogged.value = true;
            //Get.put(ApiService());
            Get.offAll(const PgHome());
            snackBar(
              title: "Bienvenu sur MON GARAGE !",
              subtitle: "Vous êtes maintenant connecté.",
              type: ToastificationType.info,
            );
            onClose();
            break;
          case false:
            Get.back();
            errorDialog(
              errorText: json['error'] ??
                  "Informations non valide ou Utilisateur inexistant",
            );
            break;
        }
      } catch (e) {
        Get.back();
        errorDialog();
      }
    } else {
      errorDialog(errorText: "Veuillez saisir des informations correctes svp!");
    }
  }

  //deconnexion
  Future<void> logout() async {
    loadingCircular();
    try {
      final token = box.read('token');
      print(token);
      var apiToken = ApiService.instance.apiToken;
      final response = await apiToken.post('/logout');
      final json = response.data;
      if (json['status'] == true) {
        box.erase();
        Get.back();
        isLogged.value = false;
        Get.offAll(const PgWelcome());
        snackBar(
          title: "Déconnexion !",
          subtitle: "Vous êtes maintenant déconnecté.",
          type: ToastificationType.warning,
        );
        ApiService.instance.onClose();
      } else {
        Get.back();
        Get.back();
        errorDialog(errorText: json['error'] ?? "Une erreur est survenu");
      }
    } catch (e) {
      print(e.toString());
      Get.back();
      Get.back();
      errorDialog();
    }
  }

  //inscription
  Future<void> register(
      {required String nomComplet,
      required String telephone,
      required String email,
      required String motdepasse}) async {
    if (keyFormRegister.currentState!.validate()) {
      loadingCircular();
      try {
        var body = {
          'name': nomComplet,
          'telephone': telephone,
          'email': email,
          'password': motdepasse,
        };
        final response = await authApi.post('/register', data: body);
        final json = response.data;
        print(json);
        switch (json['status']) {
          case true:
            final box = GetStorage();
            box.write('token', json['access_token']);
            box.write('user', json['user']);
            isLogged.value = true;
            Get.back();
            Get.offAll(const PgHome());
            snackBar(
              title: "Bienvenu sur MON GARAGE !",
              subtitle: "Votre compte a bien été créé.",
              type: ToastificationType.info,
            );
            onClose();
            break;
          case false:
            Get.back();
            errorDialog();
            break;
        }
      } catch (e) {
        Get.back();
        errorDialog();
      }
    } else {
      errorDialog(errorText: "Veuillez saisir des informations correctes svp!");
    }
  }

/*
  //suppression de compte

  //deconnexion
  Future<void> deleteUser() async {
    loadingCircular();

    final token = box.read('token');
    print(token);
    var apiToken = ApiService.instance.apiToken;
    final response = await apiToken.delete('/user/delete');
    final json = response.data;
    if (json['status'] == true) {
      box.erase();
      Get.back();
      isLogged.value = false;
      Get.offAll(const PgLanding());
      snackBar(
        title: "Compte supprimé !",
        subtitle: "Votre compte a bien été supprimé.",
        type: ToastificationType.warning,
      );
      ApiService.instance.onClose();
    } else {
      Get.back();
      Get.defaultDialog(
        title: 'Error',
        middleText: json['error'] ?? "Une erreur est survenu",
      );
    }
  }

*/
}
