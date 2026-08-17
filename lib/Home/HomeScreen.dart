import 'package:flutter/material.dart';
import 'package:spendly/Widget/HomeItem.dart';
import '../Profile/ProfileScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onSeeAllPressed});

  final VoidCallback onSeeAllPressed;

  final List<HomeItemModel> recentActivities = const [
    HomeItemModel(
      title: 'Uber Ride',
      date: 'Today, 2:30 PM',
      amount: '-\$15.00',
      isIncome: false,
      icon: Icons.directions_car,
      iconColor: Color(0xFF4F46E5),
      iconBgColor: Color(0xFFEEF2FF),
    ),
    HomeItemModel(
      title: 'Sweetgreen Lunch',
      date: 'Today, 12:45 PM',
      amount: '-\$18.50',
      isIncome: false,
      icon: Icons.restaurant,
      iconColor: Color(0xFFEF4444),
      iconBgColor: Color(0xFFFEE2E2),
    ),
    HomeItemModel(
      title: 'Apple Store',
      date: 'Yesterday',
      amount: '-\$120.00',
      isIncome: false,
      icon: Icons.shopping_bag,
      iconColor: Color(0xFF10B981),
      iconBgColor: Color(0xFFD1FAE5),
    ),
    HomeItemModel(
      title: 'Salary Deposit',
      date: 'Oct 15',
      amount: '+\$4,000.00',
      isIncome: true,
      icon: Icons.account_balance_wallet,
      iconColor: Color(0xFF059669),
      iconBgColor: Color(0xFFECFDF5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          children: [
            // Header: Spendly Logo & Avatar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/images/splash.png",
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Transform.translate(
                      offset: const Offset(0, -6),
                      child: const Text(
                        'Spendly',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                          color: Color(0xFF2F27CE),
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Greeting
            const Text(
              'Good morning, Nour',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Here's a look at your finances today.",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
            ),
            const SizedBox(height: 20),

            // 1. Total Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2F27CE),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    r'$4,550.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildFlow('↓ Income', '\$8,000', const Color(0xFF00FF66)),
                      Container(
                        height: 28,
                        width: 1,
                        color: Colors.white.withOpacity(0.2),
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                      ),
                      _buildFlow('↑ Expenses', '\$3,450', Colors.white),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 2. Monthly Spending Card
            const Text(
              'Monthly Spending',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        '\$3,450',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1FAE5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '↘ 12% less',
                          style: TextStyle(
                            color: Color(0xFF059669),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: CustomPaint(painter: WavePainter()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 3. Categories
            Text(
              'CATEGORIES',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildCategoryItem('Food', Icons.restaurant, const Color(0xFFEF4444), const Color(0xFFFEE2E2)),
                _buildCategoryItem('Transit', Icons.directions_car, const Color(0xFF6366F1), const Color(0xFFEEF2FF)),
                _buildCategoryItem('Shop', Icons.shopping_bag, const Color(0xFF10B981), const Color(0xFFD1FAE5)),
                _buildCategoryItem('Bills', Icons.receipt, const Color(0xFFDC2626), const Color(0xFFFEE2E2)),
              ],
            ),
            const SizedBox(height: 24),

            // 4. Recent Activity Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Activity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: onSeeAllPressed,
                  child: const Text('See All', style: TextStyle(color: Color(0xFF2F27CE))),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // 5. Recent Activity List using ListView.builder
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recentActivities.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                  indent: 68,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  return HomeItem(
                    item: recentActivities[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFlow(String label, String amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
        const SizedBox(height: 4),
        Text(amount, style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color iconColor, Color bgColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(height: 6),
            Text(title, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2F27CE)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.6, size.width * 0.5, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.85, size.width * 0.82, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.92, size.height * 0.2, size.width, size.height * 0.7);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}