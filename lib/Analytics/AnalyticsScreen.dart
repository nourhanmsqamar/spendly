import 'package:flutter/material.dart';
import '../Widget/AnalyticsWidgets.dart';
import '../Profile/ProfileScreen.dart';
import '../Budgets/BudgetsScreen.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int selectedPeriodIndex = 0;
  final List<String> periods = ['Week', 'Month', 'Year'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          children: [
            // Header: Spendly Logo & Avatar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/images/splash.png",
                        height: 28,
                        width: 28,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Transform.translate(
                      offset: const Offset(0, -4),
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
            const SizedBox(height: 18),

            // Time Period Selector (Week / Month / Year)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFECEEF8),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: List.generate(periods.length, (index) {
                  final isSelected = selectedPeriodIndex == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPeriodIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF2F27CE) : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            periods[index],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? Colors.white : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 18),

            // Total Spending Summary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Total Spending',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '\$3,450.00',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEE2E2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.trending_up, color: Color(0xFFEF4444), size: 14),
                        SizedBox(width: 4),
                        Text(
                          '12% vs last month',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEF4444),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Quick Stats Row (Avg Daily + Top Category)
            const Row(
              children: [
                AnalyticsStatCard(
                  label: 'Avg Daily',
                  value: '\$115.00',
                  icon: Icons.calendar_today_outlined,
                  iconColor: Color(0xFF10B981),
                  iconBgColor: Color(0xFFD1FAE5),
                ),
                SizedBox(width: 12),
                AnalyticsStatCard(
                  label: 'Top Category',
                  value: 'Food',
                  icon: Icons.restaurant,
                  iconColor: Color(0xFFEF4444),
                  iconBgColor: Color(0xFFFEE2E2),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Spending Flow Chart Card
            const SpendingFlowChartCard(),
            const SizedBox(height: 18),

            // Top Categories Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Top Categories',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const TopCategoryProgressItem(
                    title: 'Food & Dining',
                    amount: '\$1,250',
                    percentage: '36%',
                    progress: 0.36,
                    icon: Icons.restaurant,
                    iconColor: Color(0xFFDC2626),
                    iconBgColor: Color(0xFFFEE2E2),
                    progressColor: Color(0xFF991B1B),
                  ),
                  const TopCategoryProgressItem(
                    title: 'Shopping',
                    amount: '\$850',
                    percentage: '24%',
                    progress: 0.24,
                    icon: Icons.shopping_bag_outlined,
                    iconColor: Color(0xFF6366F1),
                    iconBgColor: Color(0xFFEEF2FF),
                    progressColor: Color(0xFF2F27CE),
                  ),
                  const TopCategoryProgressItem(
                    title: 'Transport',
                    amount: '\$450',
                    percentage: '13%',
                    progress: 0.13,
                    icon: Icons.directions_car_outlined,
                    iconColor: Color(0xFF059669),
                    iconBgColor: Color(0xFFD1FAE5),
                    progressColor: Color(0xFF047857),
                  ),
                  const SizedBox(height: 16),

                  // View All Categories Button
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BudgetsScreen()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFF8F9FD),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: const Text(
                        'View All Categories',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2F27CE),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}