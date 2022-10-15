import 'package:flutter/material.dart';
import 'package:latihanday14danday15sekolahbeta/model/cart.dart';
import 'package:latihanday14danday15sekolahbeta/model/order.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          tooltip: 'Back',
        ),
        title: const Text('Checkout'),
      ),
      body: const CheckoutForm(),
    );
  }
}

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({super.key});

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  final _formKey = GlobalKey<FormState>();
  final _order = Order();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(
          10,
        ),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            onSaved: (value) {
              _order.name = value!;
            },
            validator: (value) =>
                (value == null || value.isEmpty) ? 'Must not be Empty' : null,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Contact',
            ),
            onSaved: (value) {
              _order.contact = value!;
            },
            validator: (value) =>
                (value == null || value.isEmpty) ? 'Must not be Empty' : null,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Address',
            ),
            onSaved: (value) {
              _order.address = value!;
            },
            validator: (value) =>
                (value == null || value.isEmpty) ? 'Must not be Empty' : null,
          ),
          Consumer<Cart>(
            builder: (context, cart, child) {
              return ListTile(
                title: const Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Rp. ${cart.totalPrice}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
              ),
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _order.cart = List.from(
                      Provider.of<Cart>(context, listen: false).items,
                    );
                    // print('Name: ${_order.name}');
                    // print('Contact: ${_order.contact}');
                    // print('Address: ${_order.address}');
                    // print('Length: ${_order.cart!.length}');
                    Navigator.pushReplacementNamed(
                      context,
                      '/process_checkout',
                      arguments: _order,
                    );
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.tealAccent.shade700,
                ),
                child: const Text(
                  'Place Order',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
