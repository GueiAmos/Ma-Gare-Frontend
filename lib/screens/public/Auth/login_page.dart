import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/colors_config.dart';
import '../../../services/auth_service.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/input_widget.dart';
import '../Welcome/welcome_page.dart';
import 'register_page.dart';

class PgLogin extends GetView<AuthService> {
  const PgLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController txtEmail = TextEditingController();
    final TextEditingController txtPassword = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () => Get.offAll(const PgWelcome()),
        ),
      ),
      body: Stack(
        children: [
          //backgroud
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/car3.jpg"),
              ),
            ),
          ),

          Container(
            color: GColor.blanc.withOpacity(0.8),
            padding: const EdgeInsets.all(25),
            height: Get.height,
            width: Get.width,
            child: Form(
              key: controller.formKeyLogin,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: Get.height / 4,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'CONNECTEZ-VOUS !',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: GColor.noir,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //email
                    WdgTextField(
                      labelText: "Email",
                      controller: txtEmail,
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      inputColor: GColor.orange.withOpacity(0.15),
                    ),
                    const SizedBox(height: 15),

                    //mot de passe
                    WdgTextField(
                      labelText: "Mot de passe",
                      controller: txtPassword,
                      obscureText: true,
                      prefixIcon: const Icon(Icons.lock),
                      inputColor: GColor.orange.withOpacity(0.15),
                    ),

                    //mot de passe oublié
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Mot de passe oublié?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: GColor.bleu,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    //bouton d'inscription
                    WdgRoundButton(
                      title: "SE CONNECTER",
                      onPressed: () => controller.login(
                        email: txtEmail.text.trim(),
                        motdepasse: txtPassword.text.trim(),
                      ),
                      titleSize: 20,
                      buttonColor: GColor.bleu,
                    ),
                    
                    //compte inexistant
                    TextButton(
                      onPressed: () => Get.off(const PgRegister()),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: "Pas de compte? ",
                              style: TextStyle(color: GColor.noir),
                            ),
                            TextSpan(
                              text: "Inscrivez-vous",
                              style: TextStyle(color: GColor.vert),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
