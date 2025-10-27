 import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text("Jelajah Bandung"), centerTitle: true),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "Halo",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Selamat Datang Di Kota Kembang",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),

            const SizedBox(height: 12),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/cover.jpg",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                hintText: "Cari destinasi, kuliner, atau penginapan di Bandung...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBookingButton(Icons.hotel, "Hotel"),
                _buildBookingButton(Icons.flight, "Pesawat"),
                _buildBookingButton(Icons.hiking, "Kegiatan"),
                _buildBookingButton(Icons.directions_bus, "Bus"),
                _buildBookingButton(Icons.train, "Kereta"),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Destinasi Populer Di Bandung",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // List destinasi populer
            _buildReviewCard(
              imageUrl: "assets/images/asia.jpg",
              title: "Jl. Asia Afrika",
              rating: 4.8,
              review:
                  "Bandung bukan hanya tentang kota,tapi tentang perasaan. Kota yang selalu memanggil pulang.",
            ),
            _buildReviewCard(
              imageUrl: "assets/images/kawah.jpg",
              title: "Kawah Putih Ciwidey",
              rating: 4.9,
              review:
                  "Pemandangan danau belerang yang eksotis dan memukau, cocok untuk foto-foto yang dramatis. Udara sangat dingin, pastikan pakai jaket!",
            ),
            _buildReviewCard(
              imageUrl: "assets/images/farmhouse.jpg",
              title: "Farmhouse Lembang",
              rating: 4.7,
              review:
                  "Tempat wisata bertema Eropa yang populer, lengkap dengan kostum Belanda dan spot-spot foto yang instagrammable. Ideal untuk keluarga.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade100,
          ),
          child: Icon(icon, size: 28, color: Colors.blue),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  Widget _buildReviewCard({
    required String imageUrl,
    required String title,
    required double rating,
    required String review,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(" $rating"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(review, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
