import 'package:flutter/material.dart';

// 1. كارت الإحصائيات الصغير (Member Since / Tier Pro)
class ProfileStatCard extends StatelessWidget {
  final String label;
  final String value;
  final Widget? icon;
  final Color valueColor;

  const ProfileStatCard({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.valueColor = const Color(0xFF2F27CE),
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 4),
                ],
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 2. كارت عنصر القائمة (Tile مع سهم أو Switch أو قيمة نصية)
class ProfileOptionItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? trailingText;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final bool isSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final VoidCallback? onTap;

  const ProfileOptionItem({
    super.key,
    required this.title,
    this.subtitle,
    this.trailingText,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    this.isSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: isSwitch ? null : onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: iconBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle!,
        style: TextStyle(
          fontSize: 11,
          color: Colors.grey.shade500,
        ),
      )
          : null,
      trailing: isSwitch
          ? Switch(
        value: switchValue,
        onChanged: onSwitchChanged,
        activeColor: Colors.white,
        activeTrackColor: const Color(0xFF2F27CE),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      )
          : Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null) ...[
            Text(
              trailingText!,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(width: 4),
          ],
          Icon(
            Icons.arrow_forward_ios,
            size: 13,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}

// 3. كارت تجميع الأقسام (Section Container)
class ProfileSectionGroup extends StatelessWidget {
  final List<Widget> children;

  const ProfileSectionGroup({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
}