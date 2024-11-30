import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes BAR!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Clothes BAR!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> clothingItems = [
      {
        "name": "T-Shirt",
        "description": "Comfortable t-shirt, 100% cotton.",
        "image": 'assets/t-shirt.png',
        "price": 40.0,
      },
      {
        "name": "Jeans",
        "description": "Classic blue jeans",
        "image": "assets/jeans.png",
        "price": 90.0
      },
      {
        "name": "Jacket",
        "description": "Warm winter jacket",
        "image": "assets/jacket.png",
        "price": 120.0
      },
      {
        "name": "Shorts",
        "description": "Cool shorts",
        "image": "assets/shorts.png",
        "price": 80.0
      },
      {
        "name": "Hoodie",
        "description": "Cool hoodie for you.",
        "image": "assets/hoodie.png",
        "price": 130.0
      },
      {
        "name": "Sneakers",
        "description": "Cool white sneakers. Feel it on your feet!",
        "image": "assets/sneakers.png",
        "price": 80.0
      },
    ];

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title:const Text('211222', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.black)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.asset(
                item["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(item["name"]!, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              subtitle: Text(item["description"]!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(product["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: Colors.greenAccent,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product["image"]!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              product["name"]!,
              style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              product["description"]!,
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Price: \$${product["price"]!.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
            ),
          ],
        ),
      ),
    );
  }
}

