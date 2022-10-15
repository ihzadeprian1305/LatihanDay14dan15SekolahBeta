import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latihanday14danday15sekolahbeta/model/cart.dart';

class Order {
  String? name;
  String? contact;
  String? address;
  List<CartItem>? cart;

  Order({
    this.name = '',
    this.contact = '',
    this.address = '',
    this.cart = const [],
  });
}

Future<bool> sendOrderToFirebase(Order order) async {
  final db = FirebaseFirestore.instance;

  final Map<String, dynamic> data = {
    'name': order.name,
    'contact': order.contact,
    'address': order.address,
    'cart': order.cart!
        .map((item) => {
              'product': db.collection('products').doc(item.product.id),
              'qty': item.qty
            })
        .toList()
  };

  await db.collection('orders').add(data);

  return true;
}
