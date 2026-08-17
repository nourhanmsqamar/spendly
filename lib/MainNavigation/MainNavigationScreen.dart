import 'package:flutter/material.dart';
import '../Home/HomeScreen.dart';
import '../Expenses/ExpensesScreen.dart';
import '../Analytics/AnalyticsScreen.dart';
import '../Profile/ProfileScreen.dart';
import '../AddExpense/AddExpenseScreen.dart';
import '../Widget/CustomBottomNavBar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(onSeeAllPressed: () => _onTabSelected(1)),
      const ExpensesScreen(),
      const AnalyticsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
        onItemTapped: _onTabSelected,
        onAddTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpenseScreen(),
            ),
          );
        },
      ),
    );
  }
}