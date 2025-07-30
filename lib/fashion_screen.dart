import 'dart:async';
import 'package:flutter/material.dart';

class FashionScreen extends StatefulWidget {
  const FashionScreen({super.key});

  @override
  State<FashionScreen> createState() => _FashionScreenState();
}

class _FashionScreenState extends State<FashionScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _currentPage = 0;
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });

    // Auto Slide Timer
    _autoSlideTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page?.round() ?? 0) + 1;
        if (nextPage >= 3) nextPage = 0; // Total number of pages
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Fashion",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.monetization_on, color: Colors.amber),
            SizedBox(width: 4),
            Text("382", style: TextStyle(color: Colors.black)),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.5,
                child: Image.asset('assets/banner.png', fit: BoxFit.cover),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Categories
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _buildCategoryIcon('assets/50.png', '50%'),
                _buildCategoryIcon('assets/men.png', 'Men'),
                _buildCategoryIcon('assets/women.png', 'Women'),
                _buildCategoryIcon('assets/shoes.png', 'Footwear'),
                _buildCategoryIcon('assets/accessories.png', 'Accessories'),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Fashion Cards
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 320,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      _buildFashionCard(
                        'Zara',
                        'Power',
                        'Your Rules',
                        'assets/zara1.png',
                      ),
                      _buildFashionCard(
                        'H&M',
                        'Casual',
                        'Cool Vibes',
                        'assets/hm.png',
                      ),
                      _buildFashionCard(
                        'Uniqlo',
                        'Comfort',
                        'Everyday Style',
                        'assets/uniq.png',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Page Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 10 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.purple
                            : Colors.grey[400],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      // Bottom Navigation Bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 4),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              buildRectNavButton(Icons.location_on, "Near me"),
              SizedBox(width: 10),
              buildRectNavButton(Icons.local_offer_outlined, "New offer"),
              SizedBox(width: 10),
              buildRectNavButton(
                Icons.shopping_cart_checkout,
                "Wasil collection",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRectNavButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(String assetPath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28,
            child: Image.asset(assetPath, height: 30),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildFashionCard(
    String brand,
    String title,
    String subtitle,
    String imagePath,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          // Brand Tag
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                brand,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Title and Subtitle
          Positioned(
            bottom: 50,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          // Cashback Tag
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "Cashback upto 10%",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 22,
          child: Icon(icon, color: Colors.purple, size: 20),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 11)),
      ],
    );
  }
}
