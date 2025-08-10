import 'package:flutter/material.dart';

class ReviewCashbackScreen extends StatefulWidget {
  final String image;
  final String price; // <-- Add price

  const ReviewCashbackScreen({
    super.key,
    required this.image,
    required this.price, // <-- Add price
  });

  @override
  State<ReviewCashbackScreen> createState() => _ReviewCashbackScreenState();
}

class _ReviewCashbackScreenState extends State<ReviewCashbackScreen> {
  final TextEditingController _reviewController = TextEditingController();
  bool _isSubmitting = false;

  int calculateCoins(String price) {
    final numeric = price.replaceAll(RegExp(r'[^\d]'), '');
    if (numeric.isEmpty) return 0;
    final value = int.tryParse(numeric) ?? 0;
    return (value * 0.10).round();
  }

  void _handleSubmit() async {
    if (_reviewController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter a review')));
      return;
    }

    setState(() => _isSubmitting = true);

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _isSubmitting = false;
      _reviewController.clear();
    });

    final coins = calculateCoins(widget.price);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Image.asset('assets/cashback.png', height: 100),
                  SizedBox(height: 16),
                  Text(
                    "10% Cashback Received!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "$coins coins added to wallet",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 24),
                  // Add this button to close and return coins
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close bottom sheet
                      Navigator.pop(
                        context,
                        coins,
                      ); // Return coins to previous screen
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F6FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Review", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(widget.image, height: 200)),
            SizedBox(height: 20),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Earn ", style: TextStyle(fontSize: 16)),
                  TextSpan(
                    text: "10% cash back ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7A32FF),
                    ),
                  ),
                  TextSpan(
                    text: "by leaving a review on this!",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Review", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  TextField(
                    controller: _reviewController,
                    decoration: InputDecoration(
                      hintText: "Write a review",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7A32FF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _isSubmitting ? null : _handleSubmit,
                      child: Text(
                        _isSubmitting
                            ? "Submitting..."
                            : "Submit get 10% cashback",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Recent cash back",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            _buildEarnerRow("assets/user1.png", "Swathi earned"),
            _buildEarnerRow("assets/user2.png", "Priya earned "),
            _buildEarnerRow("assets/user3.png", "Anila earned "),
          ],
        ),
      ),
    );
  }

  Widget _buildEarnerRow(String image, String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 18, backgroundImage: AssetImage(image)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
