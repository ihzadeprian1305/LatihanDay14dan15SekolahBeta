import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:latihanday14danday15sekolahbeta/model/cart.dart';
import 'package:latihanday14danday15sekolahbeta/model/order.dart';
import 'package:provider/provider.dart';

class ProcessCheckoutPage extends StatelessWidget {
  const ProcessCheckoutPage({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: sendOrderToFirebase(order),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'An Error Has Occured:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Order Placed!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<Cart>(context, listen: false).clearCart();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.tealAccent.shade700,
                  ),
                  child: const Text('Finish'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
