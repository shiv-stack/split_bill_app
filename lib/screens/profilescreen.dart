import 'package:flutter/material.dart';
import 'package:split_bill_app/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F9F9),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          // Profile Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, size: 35, color: Colors.white),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shivamthapa171999",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "shivamthapa171999@gmail.com",
                        style: TextStyle(fontSize: 14, color: AppColors.subText),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.edit, color: Colors.grey),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Premium Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE9F87C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.emoji_events, color: Colors.orange),
                SizedBox(width: 10),
                Text("Premium", style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Text("Settings",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),
          _buildTile(
              icon: Icons.currency_exchange,
              title: "Split Currency",
              trailing: "USD",
              chipColor: Colors.yellow),
          _buildTile(
              icon: Icons.account_balance_wallet_outlined,
              title: "Paypal Account"),

          const SizedBox(height: 24),
          const Text("Information",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),
          _buildTile(icon: Icons.receipt_long, title: "Expense records"),
          _buildTile(icon: Icons.privacy_tip_outlined, title: "Privacy policy"),
          _buildTile(
              icon: Icons.article_outlined, title: "Splitfun's user agreement"),
          _buildTile(icon: Icons.feedback_outlined, title: "Feedback"),
        ],
      ),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    String? trailing,
    Color? chipColor,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      trailing: trailing != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: chipColor ?? Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(trailing,
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            )
          : const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {},
    );
  }
}
