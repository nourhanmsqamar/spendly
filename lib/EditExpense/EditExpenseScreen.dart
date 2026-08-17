import 'package:flutter/material.dart';
import '../Widget/EditExpenseWidgets.dart';

class EditExpenseScreen extends StatefulWidget {
  const EditExpenseScreen({super.key});

  @override
  State<EditExpenseScreen> createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  final TextEditingController amountController = TextEditingController(text: "150.00");
  final TextEditingController merchantController = TextEditingController(text: "Uber Ride");
  final TextEditingController noteController = TextEditingController();

  String selectedCategory = "Transportation";
  String selectedDate = "Today";
  String selectedPaymentMethod = "Card";

  @override
  void dispose() {
    amountController.dispose();
    merchantController.dispose();
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
                      'Edit Expense',
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
            const SizedBox(height: 24),

            // 1. Amount Field
            _buildLabel('Amount'),
            const SizedBox(height: 8),
            EditAmountField(controller: amountController),
            const SizedBox(height: 18),

            // 2. Merchant Field
            _buildLabel('Merchant'),
            const SizedBox(height: 8),
            EditMerchantField(controller: merchantController),
            const SizedBox(height: 18),

            // 3. Category Field
            _buildLabel('Category'),
            const SizedBox(height: 8),
            EditCategorySelector(
              categoryName: selectedCategory,
              icon: Icons.directions_car,
              onTap: () {
                // فتح خيارات الفئات
              },
            ),
            const SizedBox(height: 18),

            // 4. Date & Payment Method
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Date'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          EditSmallOptionCard(
                            value: selectedDate,
                            icon: Icons.calendar_today_outlined,
                            onTap: () {
                              // فتح التاريخ
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Payment Method'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          EditSmallOptionCard(
                            value: selectedPaymentMethod,
                            icon: Icons.credit_card_outlined,
                            onTap: () {
                              // اختيار وسيلة الدفع
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // 5. Note Field
            Row(
              children: [
                _buildLabel('Note'),
                const SizedBox(width: 4),
                Text(
                  '(Optional)',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
            const SizedBox(height: 8),
            EditNoteField(controller: noteController),
            const SizedBox(height: 32),

            // 6. Action Buttons
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // حفظ التعديلات
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F27CE),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  // حذف المصروف
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFE4E6),
                  foregroundColor: const Color(0xFFE11D48),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                icon: const Icon(Icons.delete_outline, size: 18),
                label: const Text(
                  'Delete Expense',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }
}