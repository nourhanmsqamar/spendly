import 'package:flutter/material.dart';
import '../Widget/AiInsightsWidgets.dart';
import '../AiChat/AiChatScreen.dart';

class AiInsightsScreen extends StatefulWidget {
  const AiInsightsScreen({super.key});

  @override
  State<AiInsightsScreen> createState() => _AiInsightsScreenState();
}

class _AiInsightsScreenState extends State<AiInsightsScreen> {
  final TextEditingController chatInputController = TextEditingController();

  @override
  void dispose() {
    chatInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                          IconButton(
                            onPressed: () => Navigator.maybePop(context),
                            icon: const Icon(Icons.arrow_back, color: Colors.black87),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          const SizedBox(width: 12),
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
                  const SizedBox(height: 20),

                  // 1. Top Banner Card
                  const AiBannerCard(),
                  const SizedBox(height: 24),

                  // Section Title
                  const Text(
                    'Key Findings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // 2. Spending Pattern Card
                  FindingCard(
                    icon: Icons.flare_outlined,
                    iconColor: const Color(0xFF6366F1),
                    iconBgColor: const Color(0xFFEEF2FF),
                    cardBgColor: const Color(0xFFF8F9FD),
                    title: 'Spending Pattern',
                    content: const Text.rich(
                      TextSpan(
                        text: 'You tend to spend ',
                        style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                        children: [
                          TextSpan(text: '40% more on weekends', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ', mostly in dining and entertainment.'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 3. Budget Alert Card
                  FindingCard(
                    icon: Icons.warning_amber_rounded,
                    iconColor: const Color(0xFFDC2626),
                    iconBgColor: const Color(0xFFFEE2E2),
                    cardBgColor: const Color(0xFFFEF2F2),
                    title: 'Budget Alert',
                    content: const Text.rich(
                      TextSpan(
                        text: 'You are ',
                        style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                        children: [
                          TextSpan(
                            text: 'close to your shopping limit',
                            style: TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' (\$450/\$500 used).'),
                        ],
                      ),
                    ),
                    bottomWidget: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.9,
                        minHeight: 5,
                        backgroundColor: Color(0xFFFCA5A5),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFDC2626)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 4. Positive Trend Card
                  FindingCard(
                    icon: Icons.trending_down,
                    iconColor: const Color(0xFF059669),
                    iconBgColor: const Color(0xFFD1FAE5),
                    cardBgColor: const Color(0xFFECFDF5),
                    title: 'Positive Trend',
                    content: const Text.rich(
                      TextSpan(
                        text: 'Great job! Your transportation costs are ',
                        style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                        children: [
                          TextSpan(text: 'down 12%', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' compared to last month.'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Bottom Floating Prompt & Chat Input
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Prompt Chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      QuickPromptChip(
                        label: 'Where did I spend most?',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AiChatScreen()),
                          );
                        },
                      ),
                      QuickPromptChip(
                        label: 'Compare this month to last',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AiChatScreen()),
                          );
                        },
                      ),
                      QuickPromptChip(
                        label: 'Analyze groceries',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AiChatScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Chat Input Field
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: chatInputController,
                            decoration: InputDecoration(
                              hintText: 'Ask Spendly AI anything...',
                              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AiChatScreen()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(0xFF2F27CE),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.send_rounded, color: Colors.white, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}