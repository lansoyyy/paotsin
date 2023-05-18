import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:menu/screens/auth/login_screen.dart';
import 'package:menu/screens/home_screen.dart';
import 'package:menu/widgets/button_widget.dart';
import 'package:menu/widgets/text_widget.dart';
import 'package:menu/widgets/textfield_widget.dart';

class SignupScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  SignupScreen({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            TextBold(text: 'Registration', fontSize: 18, color: Colors.purple),
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              minRadius: 75,
              maxRadius: 75,
              backgroundImage: AssetImage(
                'assets/images/logo.png',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(label: 'Full Name', controller: nameController),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(label: 'Username', controller: usernameController),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
                isObscure: true,
                isPassword: true,
                label: 'Password',
                controller: passwordController),
            const SizedBox(
              height: 50,
            ),
            ButtonWidget(
              label: 'Signup',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: TextRegular(
                        text: 'Account created succesfully!',
                        fontSize: 12,
                        color: Colors.white),
                  ),
                );
                box.write('username', usernameController.text);
                box.write('name', nameController.text);
                box.write('password', passwordController.text);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextRegular(
                    text: 'Already had an account?',
                    fontSize: 12,
                    color: Colors.grey),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: TextBold(
                      text: 'Login now', fontSize: 14, color: Colors.purple),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
