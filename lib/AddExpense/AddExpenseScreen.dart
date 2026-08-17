import 'package:flutter/material.dart';
import '../Widget/AddExpenseWidgets.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController amountController = TextEditingController(text: "0.00");
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  String selectedPaymentMethod = 'Card';
  String selectedCategory = 'Select';
  String selectedDate = 'Today';

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          children: [
            // Top App Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.black87),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Add Expense',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.person, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Total Amount Section
            Center(
              child: Column(
                children: [
                  Text(
                    'TOTAL AMOUNT',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '\$',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IntrinsicWidth(
                        child: TextField(
                          controller: amountController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFC7CBD9),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Icon(Icons.arrow_drop_up, color: Colors.grey.shade400, size: 22),
                          Icon(Icons.arrow_drop_down, color: Colors.grey.shade400, size: 22),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 1. What did you spend on?
            ExpenseInputField(
              label: 'What did you spend on?',
              hint: 'e.g. Uber ride to airport',
              icon: Icons.edit_note,
              controller: titleController,
            ),
            const SizedBox(height: 14),

            // 2. Category & Date Selection Row
            Row(
              children: [
                ExpenseSelectionCard(
                  label: 'Category',
                  value: selectedCategory,
                  icon: Icons.category_outlined,
                  onTap: () {
                    // فتح قائمة الفئات
                  },
                ),
                const SizedBox(width: 12),
                ExpenseSelectionCard(
                  label: 'Date',
                  value: selectedDate,
                  icon: Icons.calendar_today_outlined,
                  onTap: () {
                    // فتح الـ DatePicker
                  },
                ),
              ],
            ),
            const SizedBox(height: 14),

            // 3. Payment Method
            PaymentMethodSelector(
              selectedMethod: selectedPaymentMethod,
              onSelect: (method) {
                setState(() {
                  selectedPaymentMethod = method;
                });
              },
            ),
            const SizedBox(height: 14),

            // 4. Add Note
            ExpenseInputField(
              label: 'Add Note',
              hint: 'Any additional details?',
              icon: Icons.description_outlined,
              controller: noteController,
            ),
            const SizedBox(height: 36),

            // Save Expense Button
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  // منطق حفظ المصروف
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F27CE),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Save Expense',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}