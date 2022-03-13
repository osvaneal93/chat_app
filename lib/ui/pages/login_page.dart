// ignore_for_file: avoid_unnecessary_containers

import 'package:chat_app_/ui/widgets/custom_button.dart';
import 'package:chat_app_/ui/widgets/custom_logo_app.dart';
import 'package:chat_app_/ui/widgets/custom_signup.dart';
import 'package:chat_app_/ui/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailCtrl = TextEditingController();
    final TextEditingController passCtrl = TextEditingController();
    final sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: sizeDevice.height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo('SignIn'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      CustomTextField(
                        sizeDevice: sizeDevice,
                        icon: Icons.email,
                        placeholder: 'Correo Electronico',
                        keyboardType: TextInputType.emailAddress,
                        textController: emailCtrl,
                      ),
                      CustomTextField(
                        sizeDevice: sizeDevice,
                        icon: Icons.lock,
                        placeholder: 'Contrasena',
                        textController: passCtrl,
                        isPassword: true,
                      ),
                      CustomEnterButton(onPressed: (){}, text: 'Ingresar'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomSignUp(context, 'register_page', 'no tienes cuenta?', 'Registrarse'),
                const Center(
                  child: Text(
                    'Terminos y condiciones',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  


}
