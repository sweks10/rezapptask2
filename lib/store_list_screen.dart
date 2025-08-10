import 'package:flutter/material.dart';
import 'package:rezapp/product_detail_screen.dart';

class StoreListScreen extends StatefulWidget {
  const StoreListScreen({super.key});

  @override
  State<StoreListScreen> createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  String searchQuery = "";

  // Updated product list with new names and store info
  List<Map<String, String>> allProducts = [
    {
      "title": "Little Big Comfort White Shirt",
      "price": "₹2,199",
      "image": "assets/whiteshirt1.png",
      "store": "Reliance Trends",
      "distance": "0.7 Km, BTM",
      "isOpen": "Open",
      "online": "Online available",
      "rating": "4.2",
    },
    {
      "title": "Slim White Shirt",
      "price": "₹1,999",
      "image": "assets/whiteshirt2.png",
      "store": "Reliance Trends",
      "distance": "0.7 Km, BTM",
      "isOpen": "Open",
      "online": "Online available",
      "rating": "4.2",
    },
    {
      "title": "Regular Fit White Shirt",
      "price": "₹1,799",
      "image": "assets/whiteshirt3.png",
      "store": "Reliance Trends",
      "distance": "0.7 Km, BTM",
      "isOpen": "Open",
      "online": "Online available",
      "rating": "4.2",
    },
    {
      "title": "Classic White Shirt",
      "price": "₹2,399",
      "image": "assets/whiteshirt4.png",
      "store": "Reliance Trends",
      "distance": "0.7 Km, BTM",
      "isOpen": "Open",
      "online": "Online available",
      "rating": "4.2",
    },
    {
      "title": "Purple Slim Shirt",
      "price": "₹2,299",
      "image": "assets/purple1.png",
      "store": "Reliance Trends",
      "distance": "0.7 Km, BTM",
      "isOpen": "Open",
      "online": "Online available",
      "rating": "4.2",
    },
    {
      "title": "Purple Regular Fit Shirt",
      "price": "₹2,099",
      "image": "assets/purple2.png",
      "store": "Reliance Trends",
      "distance": "0.7 Km, BTM",
      "isOpen": "Open",
      "online": "Online available",
      "rating": "4.2",
    },
    {
      "title": "Purple Classic Shirt",
      "price": "₹1,899",
      "image": "assets/purple3.png",
      "store": "Reliance Trends",
      "distance": "0.7 Km, BTM",
      "isOpen": "Open",
      "online": "Online available",
      "rating": "4.2",
    },
    {
      "title": "Purple Comfort Tee",
      "price": "₹2,499",
      "image": "assets/purple4.png",
      "store": "Reliance Trends",
      "distance": "0.7 Km, BTM",
      "isOpen": "Open",
      "online": "Online available",
      "rating": "4.2",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter products based on search query
    List<Map<String, String>> filteredProducts = allProducts
        .where(
          (product) => product["title"]!.toLowerCase().contains(
            searchQuery.toLowerCase(),
          ),
        )
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FB),
      body: Column(
        children: [
          // Header with search bar
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF7A32FF),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Store list page",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search for shirts',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Store info section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Image.asset('assets/reliancelogo.png', width: 30, height: 30),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Reliance Trends",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        const Text("4.2"),
                        const SizedBox(width: 6),
                        const Text("0.7 Km, BTM"),
                        const SizedBox(width: 6),
                        const Text(
                          "Open",
                          style: TextStyle(color: Colors.green),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "Online available",
                          style: TextStyle(color: Color(0xFF7A32FF)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Show filtered products in grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7, // Adjust for your card height/width
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return _buildItemCard(context, filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(
              title: item['title'] ?? '',
              price: item['price'] ?? '',
              image: item['image'] ?? '',
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Use product image from the list
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(item["image"]!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['price'] ?? '',
                    style: TextStyle(color: Colors.grey[700]),
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
