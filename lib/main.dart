import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:latihanday14danday15sekolahbeta/catalog/index.dart';
import 'package:latihanday14danday15sekolahbeta/checkout/index.dart';
import 'package:latihanday14danday15sekolahbeta/checkout/process_checkout.dart';
import 'package:latihanday14danday15sekolahbeta/firebase_options.dart';
import 'package:latihanday14danday15sekolahbeta/model/cart.dart';
import 'package:latihanday14danday15sekolahbeta/model/order.dart';
import 'package:latihanday14danday15sekolahbeta/model/product.dart';
import 'package:latihanday14danday15sekolahbeta/navigation/index.dart';
import 'package:latihanday14danday15sekolahbeta/product_detail/index.dart';
import 'package:latihanday14danday15sekolahbeta/shopping_cart/index.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const StoreApp(),
    ),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Product(
      id: '1',
      name: 'Item 1',
      price: 100000,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image: 'assets/images/shoes1.jpg',
    );

    return MaterialApp(
      title: 'Ihza Store',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        '/': (context) => const CatalogPage(),
        '/shopping-cart': (context) => const ShoppingCartPage(),
        '/product-detail': (context) => ProductDetailPage(product: product),
        '/product-detail': (context) => ProductDetailPage(
              product: ModalRoute.of(context)?.settings.arguments as Product,
            ),
        '/checkout': (context) => const CheckoutPage(),
        '/process_checkout': (context) => ProcessCheckoutPage(
              order: ModalRoute.of(context)?.settings.arguments as Order,
            ),
      },
      // home: const CatalogPage(),
      // home: NavigationPage1(),
    );
  }
}
