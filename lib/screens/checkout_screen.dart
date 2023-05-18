import 'package:flutter/material.dart';
import 'package:menu/screens/home_screen.dart';

import '../widgets/text_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.purple,
        title: TextBold(
          text: 'Checkout',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
    );
  }
}
