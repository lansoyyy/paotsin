import 'package:flutter/material.dart';
import 'package:menu/data/cart_list.dart';
import 'package:menu/screens/home_screen.dart';

import '../widgets/text_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < cartData.length; i++) {
      setState(() {
        selectedItems.add(cartData[i]['code']);
        hasLoaded = true;
      });
    }
  }

  bool hasLoaded = false;

  List<String> selectedItems = [];

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (String item in selectedItems) {
      Map<String, dynamic> menuItem = cartData.firstWhere(
        (menu) => menu['code'] == item,
      );
      double? price = double.tryParse(menuItem['price'].replaceAll('₱', ''));
      if (price != null) {
        totalPrice += price;
      }
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: hasLoaded
          ? Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: TextRegular(
                            text: 'Congratulations! Checked out succesfully!',
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    );
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
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
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              leading: const Icon(
                                Icons.restaurant,
                                color: Colors.purple,
                              ),
                              trailing: const Icon(
                                Icons.check_box,
                                color: Colors.purple,
                              ),
                              title: TextBold(
                                  text: cartData[index]['item'],
                                  fontSize: 18,
                                  color: Colors.black),
                              subtitle: TextRegular(
                                  text: cartData[index]['price'],
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Total: ₱${calculateTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'QBold'),
                    ),
                  ),
                ],
              ),
            )
          : const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              ),
            ),
    );
  }
}
