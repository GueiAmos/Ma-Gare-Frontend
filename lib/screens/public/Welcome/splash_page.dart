import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../../../widgets/loading_widget.dart';
import '../../private/Accueil/home_page.dart';
import 'welcome_page.dart';

class PgSplash extends GetView<AuthService> {
  const PgSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return Obx(() {
              if (controller.isLogged.value) {
                controller.onClose();
                return const PgHome();
              } else {
                //controller.onClose();
                return const PgWelcome();
              }
            });
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return const Scaffold(body: WdgLoading());
  }
}
