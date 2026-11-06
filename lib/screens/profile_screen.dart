import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Pengguna")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 16),
            const Text("Daniel Huang", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("NIM: 4342501016", style: TextStyle(color: Colors.grey)),
            const Divider(height: 32),
            const ListTile(
              leading: Icon(Icons.history),
              title: Text("Riwayat Servis"),
              trailing: Text("2 Selesai"),
            ),
            const Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Keluar (Logout)'),
            ),
          ],
        ),
      ),
    );
  }
}