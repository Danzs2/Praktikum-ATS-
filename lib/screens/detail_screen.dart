import 'package:flutter/material.dart';
import '../models/service_item.dart';

class DetailScreen extends StatelessWidget {
  final ServiceItem item;
  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Chip(label: Text(item.category)),
            const SizedBox(height: 12),
            Text("Biaya: ${item.price}", style: const TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text("Deskripsi Layanan:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(item.description, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Layanan berhasil dipilih/dibooking!")),
                  );
                },
                child: const Text('Booking Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}