import 'package:flutter/material.dart';
import '../Widget/ExpenseItem.dart';
import '../Profile/ProfileScreen.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  int selectedToggleIndex = 0;

  final List<ExpenseItemModel> todayExpenses = const [
    ExpenseItemModel(
      title: 'Osteria Mozza',
      category: 'Dining',
      time: '12:30 PM',
      amount: '-\$42.50',
      icon: Icons.restaurant,
      iconColor: Color(0xFFEF4444),
      iconBgColor: Color(0xFFFEE2E2),
    ),
    ExpenseItemModel(
      title: 'Uber Ride',
      category: 'Transport',
      time: '09:15 AM',
      amount: '-\$18.20',
      icon: Icons.directions_car,
      iconColor: Color(0xFF6366F1),
      iconBgColor: Color(0xFFEEF2FF),
    ),
    ExpenseItemModel(
      title: 'Blue Bottle Coffee',
      category: 'Coffee',
      time: '08:05 AM',
      amount: '-\$6.50',
      icon: Icons.coffee,
      iconColor: Color(0xFFF59E0B),
      iconBgColor: Color(0xFFFEF3C7),
    ),
  ];

  final List<ExpenseItemModel> yesterdayExpenses = const [
    ExpenseItemModel(
      title: 'Whole Foods Market',
      category: 'Groceries',
      time: '06:45 PM',
      amount: '-\$112.35',
      icon: Icons.shopping_bag,
      iconColor: Color(0xFF10B981),
      iconBgColor: Color(0xFFD1FAE5),
    ),
    ExpenseItemModel(
      title: 'Netflix Subscription',
      category: 'Entertainment',
      time: '10:00 AM',
      amount: '-\$15.99',
      icon: Icons.movie_creation_outlined,
      iconColor: Color(0xFFA855F7),
      iconBgColor: Color(0xFFF3E8FF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
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
                      offset: const Offset(0, -3),
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

            // Search Bar + Filter Button
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey.shade500, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search expenses...',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.tune,
                    color: Colors.grey.shade700,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Toggle Switch (List View / Empty State)
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildToggleButton(label: 'List View', index: 0),
                    _buildToggleButton(label: 'Empty State', index: 1),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Section 1: TODAY
            Text(
              'TODAY',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 10),
            _buildExpenseGroup(todayExpenses),

            const SizedBox(height: 24),

            // Section 2: YESTERDAY
            Text(
              'YESTERDAY',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 10),
            _buildExpenseGroup(yesterdayExpenses),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton({required String label, required int index}) {
    final isSelected = selectedToggleIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedToggleIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? Colors.black87 : Colors.grey.shade500,
          ),
        ),
      ),
    );
  }

  Widget _buildExpenseGroup(List<ExpenseItemModel> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Colors.grey.shade100,
          indent: 68,
          endIndent: 16,
        ),
        itemBuilder: (context, index) {
          return ExpenseItem(item: items[index]);
        },
      ),
    );
  }
}