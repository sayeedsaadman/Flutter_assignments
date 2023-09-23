import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme:
      ThemeData(
        primaryColor: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget
{
  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductList>
{
  List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 20),
    Product(name: 'Product 3', price: 30),
    Product(name: 'Product 4', price: 40),
    Product(name: 'Product 5', price: 50),
    Product(name: 'Product 6', price: 60),
    Product(name: 'Product 7', price: 70),
    Product(name: 'Product 8', price: 80),
    Product(name: 'Product 9', price: 90),

  ];

  int boughtproduct = 0;

  void count(int index)
  {
    setState(() {
      products[index].incrementCount();
      if (products[index].count == 5)
      {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Congratulations!'),
              content: Text('You have bought 5 ${products[index].name}!'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: ()
                  {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
      boughtproduct++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(boughtproduct)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Count: ${products[index].count}'),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => count(index),
                    child: Text('Buy Now'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int count;

  Product({required this.name, required this.price, this.count = 0});

  void incrementCount() {
    count++;
  }
}

class CartPage extends StatelessWidget {
  final int totalBoughtProducts;

  CartPage(this.totalBoughtProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text(
          'Total Products Bought: $totalBoughtProducts',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}