import 'package:flutter/material.dart';

// 1. كارت التحليل الرئيسي البنفسجي العلوي
class AiBannerCard extends StatelessWidget {
  const AiBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF2F27CE),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.smart_toy_outlined, color: Colors.white, size: 16),
              const SizedBox(width: 6),
              Text(
                'AI ANALYSIS COMPLETE',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            "Here's what I noticed... Food is your largest category (35%).",
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 20),
          // أعمدة الرسم البياني الصغيرة
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar(24, const Color(0xFF6B7280).withOpacity(0.5)),
              const SizedBox(width: 6),
              _buildBar(36, const Color(0xFF9CA3AF).withOpacity(0.6)),
              const SizedBox(width: 6),
              _buildBar(48, const Color(0xFFE5E7EB).withOpacity(0.8)),
              const SizedBox(width: 6),
              _buildBar(58, const Color(0xFF4ADE80)), // العمود الأخضر البارز
              const SizedBox(width: 6),
              _buildBar(18, const Color(0xFF6B7280).withOpacity(0.4)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double height, Color color) {
    return Container(
      width: 14,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// 2. كارت التحليل المخصص (Key Finding Card)
class FindingCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final Color cardBgColor;
  final String title;
  final Widget content;
  final Widget? bottomWidget;

  const FindingCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.cardBgColor,
    required this.title,
    required this.content,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                content,
                if (bottomWidget != null) ...[
                  const SizedBox(height: 10),
                  bottomWidget!,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. أزرار الاقتراحات السريعة (Prompt Chips)
class QuickPromptChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const QuickPromptChip({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: const Color(0xFFEEF2FF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF2F27CE),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}