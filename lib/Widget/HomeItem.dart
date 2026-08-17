import 'package:flutter/material.dart';
import '../EditExpense/EditExpenseScreen.dart';

class HomeItemModel {
  final String title;
  final String date;
  final String amount;
  final bool isIncome;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const HomeItemModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });
}

class HomeItem extends StatelessWidget {
  final HomeItemModel item;

  const HomeItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditExpenseScreen()),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: item.iconBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          item.icon,
          color: item.iconColor,
          size: 22,
        ),
      ),
      title: Text(
        item.title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        item.date,
        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 12,
        ),
      ),
      trailing: Text(
        item.amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: item.isIncome ? const Color(0xFF10B981) : Colors.black87,
        ),
      ),
    );
  }
}