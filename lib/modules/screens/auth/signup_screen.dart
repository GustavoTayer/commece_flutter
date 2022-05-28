import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'email'.tr),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'username'.tr),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'password'.tr),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'password-confirm'.tr),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: () {
                // TODO: Verificar como realizar cadastro no wp
              }, child: Text('signup'.tr))
            ],
          ),
        ),
      ),
    );
  }
}
