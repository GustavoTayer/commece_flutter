import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController userController = Get.put(AuthController());

    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'username'.tr),
                  controller: usernameController,
                  enabled: userController.loading.isFalse,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  validator: (email) {
                    // if (email == null || !emailValid(email)) {
                    //   return 'email-invalid'.i18n();
                    // }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'password'.tr),
                  controller: passwordController,
                  enabled: userController.loading.isFalse,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'password-invalid'.tr;
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text('forgot-password'.tr),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    onSurface: Theme.of(context).primaryColor.withAlpha(100),
                  ),
                  onPressed: userController.loading.isTrue
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            userController.signIn(
                              email: usernameController.text,
                              password: passwordController.text,
                              onFail: (String e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              onSuccess: (user) {
                                print('Sucesso');
                              },
                            );
                          }
                        },
                  child: userController.loading.isTrue
                      ? const SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : Text(
                          'login-button'.tr,
                          style: const TextStyle(fontSize: 18),
                        ),
                )
              ],
            )),
      ),
    );
  }
}
