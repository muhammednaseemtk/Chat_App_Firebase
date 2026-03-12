import 'package:chat_app/constants/app_color.dart';
import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/view/auth/login_page.dart';
import 'package:chat_app/view/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthController>();

    return Scaffold(
      backgroundColor: AppColor.bgClr,
      appBar: AppBar(
        backgroundColor: AppColor.bgClr,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColor.iconClr),
            onPressed: () async {
              await authController.logout();
              if (!context.mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
                (_) => false,
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<UserModel>>(
        stream: authController.usersStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.iconClr),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No users found',
                  style: TextStyle(color: Colors.grey)),
            );
          }
          final users = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: users.length,
            separatorBuilder: (_, __) =>
                const Divider(color: Colors.white12, height: 1),
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4),
                leading: CircleAvatar(
                  backgroundColor: AppColor.iconClr,
                  child: Text(
                    user.email[0].toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(user.email,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15)),
                trailing: const Icon(Icons.chevron_right,
                    color: AppColor.iconClr),
                // ✅ Fixed: just pass ChatPage directly — no ChangeNotifierProvider wrapper
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatPage(receiver: user),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}