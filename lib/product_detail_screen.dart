import 'package:flutter/material.dart';
import 'package:rezapp/review_cashback_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

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
            children: const [
              Icon(Icons.monetization_on, color: Colors.amber),
              SizedBox(width: 4),
              Text("352", style: TextStyle(color: Colors.black)),
              SizedBox(width: 12),
              Icon(Icons.share, color: Colors.black),
              SizedBox(width: 12),
              Icon(Icons.favorite_border, color: Colors.black),
              SizedBox(width: 12),
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
                    child: Image.asset('assets/shirt.png', height: 250),
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
          const Text(
            "Little Big Comfort Tee",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          const Text(
            "Little Big Comfort Tee offers a perfect blend of relaxed fit and soft fabric for all-day comfort and effortless style",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Text(
                "₹2,199",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 12),
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              Text("0.7 Km, BTM", style: TextStyle(fontSize: 13)),
              SizedBox(width: 10),
              Icon(Icons.circle, size: 8, color: Colors.green),
              SizedBox(width: 4),
              Text("open", style: TextStyle(fontSize: 13)),
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
                      builder: (context) => ReviewCashbackScreen(),
                    ),
                  );
                  if (result == true) {
                    print("Review submitted, refresh HomeScreen if needed");
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
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF7A32FF)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Book Now",
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
