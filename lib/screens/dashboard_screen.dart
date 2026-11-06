import 'package:flutter/material.dart';
import '../models/service_item.dart';
import 'detail_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<ServiceItem> _allServices = [
    ServiceItem(title: "Servis Rutin / Tune Up", category: "Mesin", price: "Rp 50.000", description: "Pembersihan karburator/injector dan cek kelistrikan."),
    ServiceItem(title: "Ganti Oli Mesin", category: "Pelumas", price: "Rp 45.000", description: "Penggantian oli mesin matic/bebek berkualitas tinggi."),
    ServiceItem(title: "Ganti Kampas Rem", category: "Kaki-kaki", price: "Rp 35.000", description: "Pemasangan kampas rem baru depan/belakang."),
    ServiceItem(title: "Tambal Ban Tubeless", category: "Ban", price: "Rp 20.000", description: "Tambal ban sistem tusuk/cacing instan dan aman."),
  ];

  List<ServiceItem> _filteredServices = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredServices = _allServices;
  }

  void _filterSearch(String query) {
    setState(() {
      _filteredServices = _allServices
          .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Bengkel"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterSearch,
              decoration: const InputDecoration(
                labelText: 'Cari Layanan...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredServices.length,
              itemBuilder: (context, index) {
                final item = _filteredServices[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${item.category} • ${item.price}"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen(item: item)),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}