import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:latihanday14danday15sekolahbeta/model/cart.dart';
import 'package:latihanday14danday15sekolahbeta/model/product.dart';
import 'package:latihanday14danday15sekolahbeta/product_detail/index.dart';
import 'package:latihanday14danday15sekolahbeta/shopping_cart/index.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
          id: '1',
          name: 'Item 1',
          price: 100000,
          image: 'assets/images/shoes1.jpg'),
      Product(
          id: '2',
          name: 'Item 2',
          price: 250000,
          image: 'assets/images/shoes2.jpg'),
      Product(
          id: '3',
          name: 'Item 3',
          price: 500000,
          image: 'assets/images/shoes3.jpg'),
      Product(
          id: '4',
          name: 'Item 4',
          price: 350000,
          image: 'assets/images/shoes1.jpg'),
      Product(
          id: '5',
          name: 'Item 5',
          price: 150000,
          image: 'assets/images/shoes2.jpg'),
      Product(
          id: '6',
          name: 'Item 6',
          price: 100000,
          image: 'assets/images/shoes3.jpg'),
      Product(
          id: '7',
          name: 'Item 7',
          price: 200000,
          image: 'assets/images/shoes1.jpg'),
      Product(
          id: '8',
          name: 'Item 8',
          price: 750000,
          image: 'assets/images/shoes2.jpg'),
      Product(
          id: '9',
          name: 'Item 9',
          price: 800000,
          image: 'assets/images/shoes3.jpg'),
      Product(
          id: '10',
          name: 'Item 10',
          price: 1000000,
          image: 'assets/images/shoes1.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {},
        ),
        title: const Text(
          'Catalog',
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const ShoppingCartPage();
              //     },
              //   ),
              // );
              Navigator.pushNamed(
                context,
                '/shopping-cart',
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
            tooltip: 'Shopping Cart',
          ),
        ],
      ),
      body: FutureBuilder(
        future: getProductsFromFirebase(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'An Error Has Occured:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.all(
                10,
              ),
              itemBuilder: (context, index) {
                return CatalogProductCard(
                  product: products[index],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  const CatalogProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return ProductDetailPage(
          //         product: product,
          //       );
          //     },
          //   ),
          // );
          Navigator.pushNamed(
            context,
            '/product-detail',
            arguments: product,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(
                10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Rp. ${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 200,
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            Provider.of<Cart>(
                              context,
                              listen: false,
                            ).addToCart(
                              product,
                            );
                            Navigator.pushNamed(
                              context,
                              '/shopping-cart',
                            );
                          },
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                          label: const Text(
                            'Add to Cart',
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.tealAccent.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
