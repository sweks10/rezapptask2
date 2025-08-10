import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rezapp/providers/user_provider.dart';

class MakePaymentScreen extends StatefulWidget {
  final String price;

  const MakePaymentScreen({super.key, required this.price});

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {
  int coinsToRedeem = 0;

  int get priceValue {
    final numeric = widget.price.replaceAll(RegExp(r'[^\d]'), '');
    return int.tryParse(numeric) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    int maxRedeemable = priceValue < userProvider.coins
        ? priceValue
        : userProvider.coins;
    int finalAmount = priceValue - coinsToRedeem;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Make Payment"),
        backgroundColor: const Color(0xFF7A32FF),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF7F6FB),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 0),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.payment, size: 48, color: Color(0xFF7A32FF)),
              const SizedBox(height: 12),
              Text(
                "Complete Your Payment",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7A32FF),
                ),
              ),
              const SizedBox(height: 24),
              _infoRow("Product Price", "₹$priceValue"),
              const SizedBox(height: 12),
              _infoRow("Your Wallet Coins", "${userProvider.coins}"),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5E9FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.monetization_on, color: Color(0xFF7A32FF)),
                    const SizedBox(width: 8),
                    const Text("Redeem Coins:"),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      color: Colors.grey,
                      onPressed: coinsToRedeem > 0
                          ? () => setState(() => coinsToRedeem--)
                          : null,
                    ),
                    Text(
                      "$coinsToRedeem",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF7A32FF),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      color: Color(0xFF7A32FF),
                      onPressed: coinsToRedeem < maxRedeemable
                          ? () => setState(() => coinsToRedeem++)
                          : null,
                    ),
                    Text(
                      " (Max: $maxRedeemable)",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Divider(thickness: 1.2, color: Colors.grey[300]),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Final Amount to Pay:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "₹$finalAmount",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7A32FF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.lock, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7A32FF),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    userProvider.addCoins(-coinsToRedeem);
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        title: const Text(
                          "Payment Successful",
                          style: TextStyle(color: Color(0xFF7A32FF)),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 48,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "You paid ₹$finalAmount\nusing $coinsToRedeem coins!",
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            ),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  label: const Text(
                    "Pay Now",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF7A32FF),
          ),
        ),
      ],
    );
  }
}
