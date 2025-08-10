import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rezapp/payment_screen.dart';
import 'package:rezapp/providers/user_provider.dart';
import 'package:rezapp/review_cashback_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final String title;
  final String price;
  final String image;

  const ProductDetailScreen({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool reviewSubmitted = false;

  int calculateCoins(String price) {
    final numeric = price.replaceAll(RegExp(r'[^\d]'), '');
    if (numeric.isEmpty) return 0;
    final value = int.tryParse(numeric) ?? 0;
    return (value * 0.10).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.monetization_on, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                reviewSubmitted ? "${calculateCoins(widget.price)}" : "0",
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.share, color: Colors.black),
              const SizedBox(width: 12),
              const Icon(Icons.favorite_border, color: Colors.black),
              const SizedBox(width: 12),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(widget.image, height: 250),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 8,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/reliancelogo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildProductInfoSection(context),
            const SizedBox(height: 16),
            _buildStoreButtons(),
            const SizedBox(height: 20),
            _buildPayBillSection(),
            const Spacer(),
            _buildInstagramSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfoSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          const Text(
            "Little Big Comfort Tee offers a perfect blend of relaxed fit and soft fabric for all-day comfort and effortless style",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                widget.price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const Text("0.7 Km, BTM", style: TextStyle(fontSize: 13)),
              const SizedBox(width: 10),
              const Icon(Icons.circle, size: 8, color: Colors.green),
              const SizedBox(width: 4),
              const Text("open", style: TextStyle(fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.star, size: 16, color: Color(0xFF7A32FF)),
              const SizedBox(width: 4),
              const Text("3.2"),
              const SizedBox(width: 16),
              const Icon(Icons.people, size: 16, color: Colors.orange),
              const SizedBox(width: 4),
              const Text("300"),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewCashbackScreen(
                        image: widget.image,
                        price: widget.price,
                      ),
                    ),
                  );
                  if (result is int && result > 0) {
                    // Add coins to provider
                    Provider.of<UserProvider>(
                      context,
                      listen: false,
                    ).addCoins(result);
                    setState(() {
                      reviewSubmitted = true;
                    });
                  }
                },
                child: const Text(
                  "Write a review and earn cashback",
                  style: TextStyle(
                    color: Color(0xFF7A32FF),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    fontSize: 13.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.groups, size: 16),
              SizedBox(width: 6),
              Text(
                "1200  People brought today",
                style: TextStyle(fontSize: 13.5),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoreButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7A32FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "STORE VISIT",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MakePaymentScreen(price: widget.price),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF7A32FF)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Buy Now",
              style: TextStyle(color: Color(0xFF7A32FF), fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPayBillSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pay your bill",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              Text(
                "Save 20%",
                style: TextStyle(color: Color(0xFF7A32FF), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter the amount",
                    hintStyle: const TextStyle(fontSize: 13.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7A32FF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Pay bill"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInstagramSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5E9FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Center(
        child: Text(
          "Earn from Instagram",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontSize: 14.5,
          ),
        ),
      ),
    );
  }
}
