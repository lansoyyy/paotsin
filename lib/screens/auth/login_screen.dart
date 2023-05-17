import 'package:flutter/material.dart';
import 'package:menu/screens/auth/signup_screen.dart';
import 'package:menu/widgets/button_widget.dart';
import 'package:menu/widgets/text_widget.dart';
import 'package:menu/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            TextBold(text: 'Welcome to', fontSize: 18, color: Colors.purple),
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
              label: 'Login',
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextRegular(
                    text: 'New to PAOTSIN?', fontSize: 12, color: Colors.grey),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignupScreen()));
                  },
                  child: TextBold(
                      text: 'Register now', fontSize: 14, color: Colors.purple),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
