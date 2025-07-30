import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rezapp/fashion_screen.dart';
import 'package:rezapp/store_list_screen.dart';
import 'package:rezapp/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    if (userProvider.userId.isEmpty) {
      userProvider.setUserId('64e8637cb75f6450f16fcf0e');
    }

    userProvider.fetchCoinsFromServer();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7A32FF),
        elevation: 0,
        leading: const Icon(Icons.location_on, color: Colors.white),
        title: const Text(
          'BTM, Bangalore',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.monetization_on, color: Colors.yellow[600]),
              Text(
                ' ${userProvider.coins}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.shopping_cart, color: Colors.white),
              const SizedBox(width: 12),
              const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Color(0xFF7A32FF)),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(height: 280, color: const Color(0xFF7A32FF)),
              Expanded(child: Container(color: const Color(0xFFF7F6FB))),
            ],
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 60,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Good night Rejaui!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for the service',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, 30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    margin: const EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFF7A32FF), Color(0xFFB590F2)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.star,
                              color: Colors.purpleAccent,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Partner',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Level 1',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '0/10',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Orders',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 28,
                          height: 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFF7A32FF).withOpacity(0.3),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFB590F2),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '20 Orders in',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '67 Days to go',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Color(0xFF7A32FF),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuickAction(Icons.card_giftcard, 'Voucher', '0'),
                    _buildQuickAction(
                      Icons.account_balance_wallet,
                      'Wallet',
                      '₹ 0',
                    ),
                    _buildQuickAction(
                      Icons.local_offer,
                      'Offers',
                      '2 New',
                      valueColor: Color(0xFF7A32FF),
                    ),
                    _buildQuickAction(
                      Icons.store,
                      'Store',
                      'Explore',
                      valueColor: const Color(0xFF7A32FF),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => StoreListScreen()),
                        );
                        await userProvider.fetchCoinsFromServer();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(context, 'Going Out', [
                  _CategoryItem(
                    label: 'Fashion',
                    icon: Icons.checkroom,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => FashionScreen()),
                      );
                      await Provider.of<UserProvider>(
                        context,
                        listen: false,
                      ).fetchCoinsFromServer();
                    },
                  ),
                  _CategoryItem(
                    label: 'Fleet Market',
                    icon: Icons.local_mall,
                    onTap: () {},
                  ),
                  _CategoryItem(
                    label: 'Gift',
                    icon: Icons.card_giftcard,
                    onTap: () {},
                  ),
                  _CategoryItem(
                    label: 'Restaurant',
                    icon: Icons.restaurant,
                    onTap: () {},
                  ),
                  _CategoryItem(
                    label: 'Electronic',
                    icon: Icons.devices,
                    onTap: () {},
                  ),
                ]),
                const SizedBox(height: 24),
                _buildSection(context, 'Home Delivery', [
                  _CategoryItem(
                    label: 'Organic',
                    icon: Icons.eco,
                    onTap: () {},
                  ),
                  _CategoryItem(
                    label: 'Grocery',
                    icon: Icons.local_grocery_store,
                    onTap: () {},
                  ),
                  _CategoryItem(
                    label: 'Medicine',
                    icon: Icons.medical_services,
                    onTap: () {},
                  ),
                  _CategoryItem(
                    label: 'Fruit',
                    icon: Icons.apple,
                    onTap: () {},
                  ),
                  _CategoryItem(
                    label: 'Meat',
                    icon: Icons.set_meal,
                    onTap: () {},
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF7A32FF),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: 'Play'),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Earn',
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(
    IconData icon,
    String label,
    String value, {
    Color valueColor = Colors.black,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: Colors.deepPurple),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF0EBFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              value,
              style: TextStyle(
                color: valueColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<_CategoryItem> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: () {}, child: const Text('View all')),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items.map((item) {
              return GestureDetector(
                onTap: item.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(item.icon, color: Colors.deepPurple),
                      ),
                      const SizedBox(height: 6),
                      Text(item.label, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _CategoryItem {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  _CategoryItem({required this.label, required this.icon, required this.onTap});
}
