import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    this.description = "",
    required this.price,
    this.image = "",
  });

  String id;
  String name;
  String description;
  int price;
  String image;
}

Future<List<Product>> getProductsFromFirebase() async {
  return FirebaseFirestore.instance.collection('products').get().then(
    (q) {
      return List<Product>.generate(
        q.docs.length,
        (index) {
          DocumentSnapshot doc = q.docs[index];
          return Product(
            id: doc.id,
            name: doc['name'] as String,
            price: doc['price'] as int,
            description: doc['description'] as String,
            image: doc['image'] as String,
          );
        },
      );
    },
  );
}
