import 'package:flutter/material.dart';
import 'package:menu/data/cart_list.dart';
import 'package:menu/screens/checkout_screen.dart';

import '../widgets/text_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: cartData.isEmpty
          ? const SizedBox()
          : FloatingActionButton(
              backgroundColor: Colors.purple,
              child: const Icon(
                Icons.shopping_cart_checkout_sharp,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Checkout Confirmation',
                            style: TextStyle(
                                fontFamily: 'QBold',
                                fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                            'Are you sure you want to checkout?',
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
                                        builder: (context) =>
                                            const CheckoutScreen()));
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
              }),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: TextBold(
          text: 'You Cart',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: cartData.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 75,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextBold(
                      text: 'Your Cart is Empty',
                      fontSize: 24,
                      color: Colors.black),
                ],
              ),
            )
          : ListView.builder(
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
                      trailing: IconButton(
                        onPressed: () {
                          cartData.remove(cartData[index]);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const CartScreen()));
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ),
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
    );
  }
}
