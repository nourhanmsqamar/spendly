import 'package:flutter/material.dart';
import '../Widget/ProfileWidgets.dart';
import '../AiInsights/AiInsightsScreen.dart';
import '../Login/LoginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          children: [
            // Top App Bar
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
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.person, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Profile Header Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEFF7),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF2F27CE),
                        ),
                        child: const CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage('assets/images/profile1.png'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 14,
                            color: Color(0xFF2F27CE),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nour',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'nour.rivera@example.com',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const ProfileStatCard(
                        label: 'Member Since',
                        value: '2021',
                        valueColor: Color(0xFF2F27CE),
                      ),
                      const SizedBox(width: 12),
                      ProfileStatCard(
                        label: 'Tier',
                        value: 'Pro',
                        valueColor: const Color(0xFF059669),
                        icon: const Icon(
                          Icons.workspace_premium,
                          color: Color(0xFF059669),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Section 1: ACCOUNT
            _buildSectionHeader('ACCOUNT'),
            const SizedBox(height: 8),
            ProfileSectionGroup(
              children: [
                ProfileOptionItem(
                  title: 'Personal Information',
                  icon: Icons.person_outline,
                  iconColor: const Color(0xFF6366F1),
                  iconBgColor: const Color(0xFFEEF2FF),
                  onTap: () {},
                ),
                _buildDivider(),
                ProfileOptionItem(
                  title: 'Security & Privacy',
                  icon: Icons.shield_outlined,
                  iconColor: const Color(0xFF059669),
                  iconBgColor: const Color(0xFFECFDF5),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Section 2: PREFERENCES
            _buildSectionHeader('PREFERENCES'),
            const SizedBox(height: 8),
            ProfileSectionGroup(
              children: [
                ProfileOptionItem(
                  title: 'Currency',
                  trailingText: 'USD (\$)',
                  icon: Icons.payments_outlined,
                  iconColor: const Color(0xFFDC2626),
                  iconBgColor: const Color(0xFFFEE2E2),
                  onTap: () {},
                ),
                _buildDivider(),
                ProfileOptionItem(
                  title: 'Notifications',
                  subtitle: 'Push & Email',
                  icon: Icons.notifications_none_outlined,
                  iconColor: const Color(0xFF8B5CF6),
                  iconBgColor: const Color(0xFFF3E8FF),
                  isSwitch: true,
                  switchValue: notificationsEnabled,
                  onSwitchChanged: (val) {
                    setState(() {
                      notificationsEnabled = val;
                    });
                  },
                ),
                _buildDivider(),
                ProfileOptionItem(
                  title: 'Theme',
                  trailingText: 'System',
                  icon: Icons.dark_mode_outlined,
                  iconColor: const Color(0xFF64748B),
                  iconBgColor: const Color(0xFFF1F5F9),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Section 3: DATA & INTELLIGENCE
            _buildSectionHeader('DATA & INTELLIGENCE'),
            const SizedBox(height: 8),
            ProfileSectionGroup(
              children: [
                ProfileOptionItem(
                  title: 'AI Insights Preferences',
                  subtitle: 'Manage smart budgeting',
                  icon: Icons.smart_toy_outlined,
                  iconColor: const Color(0xFF10B981),
                  iconBgColor: const Color(0xFFD1FAE5),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AiInsightsScreen()),
                    );
                  },
                ),
                _buildDivider(),
                ProfileOptionItem(
                  title: 'Export Data',
                  icon: Icons.file_download_outlined,
                  iconColor: const Color(0xFF3B82F6),
                  iconBgColor: const Color(0xFFEFF6FF),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Log Out Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFEBEB),
                  foregroundColor: const Color(0xFFDC2626),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                icon: const Icon(Icons.logout, size: 18),
                label: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
        color: Colors.grey.shade400,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey.shade100,
      indent: 62,
      endIndent: 16,
    );
  }
}