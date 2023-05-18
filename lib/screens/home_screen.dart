import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:menu/data/cart_list.dart';
import 'package:menu/data/menu_data.dart';
import 'package:menu/screens/auth/login_screen.dart';
import 'package:menu/screens/cart_screen.dart';
import 'package:menu/widgets/text_widget.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isListening = false;
  String _text = '';

  late stt.SpeechToText _speech;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: TextBold(
          text: 'PAOTSIN',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
          icon: const Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text(
                          'Logout Confirmation',
                          style: TextStyle(
                              fontFamily: 'QBold', fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Are you sure you want to Logout?',
                          style: TextStyle(fontFamily: 'QRegular'),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ));
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: _text == ''
          ? GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: paotsinMenu.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                final menu = paotsinMenu[index];
                return Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.black,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/back.jpg'),
                          opacity: 125,
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${menu['code']}',
                          style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'QBold',
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '${menu['item']}',
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'QRegular',
                              color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '${menu['price']}',
                          style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'QRegular',
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: TextBold(text: _text, fontSize: 32, color: Colors.black),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Colors.purple,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () {
            _listen();
          },
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords.toUpperCase();

            List<String> words = val.recognizedWords.toUpperCase().split(' ');

            if (words.contains('D1')) {
              cartData.add({
                'code': 'D1',
                'item': 'Dumplings (Solo)',
                'price': '₱47.00',
              });
            } else if (words.contains('D2')) {
              cartData.add({
                'code': 'D2',
                'item': 'Dumplings (Fried)',
                'price': '₱47.00',
              });
            } else if (words.contains('D3')) {
              cartData.add({
                'code': 'D3',
                'item': 'Dumplings (Steamed)',
                'price': '₱47.00',
              });
            } else if (words.contains('DR1')) {
              cartData.add({
                'code': 'DR1',
                'item': 'Dumplings on Hainanese Rice',
                'price': '₱65.00',
              });
            } else if (words.contains('DR2')) {
              cartData.add({
                'code': 'DR2',
                'item': 'Dumplings on Lemak Rice',
                'price': '₱65.00',
              });
            } else if (words.contains('AR1')) {
              cartData.add({
                'code': 'AR1',
                'item': 'Asian Chicken on Hainanese Rice',
                'price': '₱85.00',
              });
            } else if (words.contains('AR2')) {
              cartData.add({
                'code': 'AR2',
                'item': 'Asian Chicken on Lemak Rice',
                'price': '₱85.00',
              });
            } else if (words.contains('CR1')) {
              cartData.add({
                'code': 'CR1',
                'item': 'Crackling Pork with Hainanese Rice',
                'price': '₱90.00',
              });
            } else if (words.contains('CR2')) {
              cartData.add({
                'code': 'CR2',
                'item': 'Crackling Pork with Lemak Rice',
                'price': '₱90.00',
              });
            } else if (words.contains('L1')) {
              cartData.add({
                'code': 'L1',
                'item': 'Dumplings on Laksa',
                'price': '₱75.00',
              });
            } else if (words.contains('L2')) {
              cartData.add({
                'code': 'L2',
                'item': 'Asian Chicken on Laksa',
                'price': '₱90.00',
              });
            } else if (words.contains('L3')) {
              cartData.add({
                'code': 'L3',
                'item': 'Crackling Pork with Laksa',
                'price': '₱100.00',
              });
            }
          }),
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _text = '';
      });

      _speech.stop();
    }
    print(_text);
  }
}
