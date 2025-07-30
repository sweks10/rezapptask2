import 'package:flutter/material.dart';
import 'package:rezapp/product_detail_screen.dart';

class StoreListScreen extends StatelessWidget {
  const StoreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FB),
      body: Column(
        children: [
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
                    const Icon(Icons.arrow_back, color: Colors.white),
                    const SizedBox(width: 12),
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
                  decoration: InputDecoration(
                    hintText: 'Search for the service',
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
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFilterChip("Fashion"),
                      _buildFilterChip("Gender"),
                      _buildFilterChip("Wasil pay"),
                      _buildFilterChip("Online"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "FreeShipping",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildStoreSection(
                  context,
                  storeName: "Reliance Trends",
                  logoAsset: 'assets/reliancelogo.png',
                  distance: "0.7 Km, BTM",
                  isOpen: true,
                  onlineAvailable: true,
                  rating: 4.2,
                  items: [
                    {'title': 'Little Big Comfort Tee', 'price': '₹2,199'},
                    {'title': 'Little Big Comfort Tee', 'price': '₹2,199'},
                  ],
                ),
                _buildStoreSection(
                  context,
                  storeName: "Amazon",
                  logoAsset: 'assets/amazon.png',
                  distance: "",
                  isOpen: false,
                  onlineAvailable: true,
                  rating: 4.2,
                  items: [
                    {'title': 'Little Big Comfort Tee', 'price': '₹2,199'},
                    {'title': 'Little Big Comfort Tee', 'price': '₹2,199'},
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildStoreSection(
    BuildContext context, {
    required String storeName,
    required String logoAsset,
    required double rating,
    required String distance,
    required bool isOpen,
    required bool onlineAvailable,
    required List<Map<String, String>> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(logoAsset, width: 30, height: 30),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.orange),
                      Text(rating.toString()),
                      if (distance.isNotEmpty) ...[
                        const SizedBox(width: 6),
                        Text(distance),
                      ],
                      if (isOpen) ...[
                        const SizedBox(width: 6),
                        const Text(
                          "Open",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                      if (onlineAvailable) ...[
                        const SizedBox(width: 6),
                        const Text(
                          "Online available",
                          style: TextStyle(color: Color(0xFF7A32FF)),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: items
                  .map((item) => _buildItemCard(context, item))
                  .toList(),
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
          MaterialPageRoute(builder: (_) => const ProductDetailScreen()),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/shirt.png',
                  ), // Add this asset in pubspec
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
