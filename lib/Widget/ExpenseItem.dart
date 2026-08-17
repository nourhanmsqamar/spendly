import 'package:flutter/material.dart';
import '../EditExpense/EditExpenseScreen.dart';

class ExpenseItemModel {
  final String title;
  final String category;
  final String time;
  final String amount;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const ExpenseItemModel({
    required this.title,
    required this.category,
    required this.time,
    required this.amount,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });
}

class ExpenseItem extends StatelessWidget {
  final ExpenseItemModel item;

  const ExpenseItem({
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: item.iconBgColor,
          borderRadius: BorderRadius.circular(14),
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
      subtitle: Row(
        children: [
          Text(
            item.category,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            item.time,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          ),
        ],
      ),
      trailing: Text(
        item.amount,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }
}