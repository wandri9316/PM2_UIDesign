// login.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

// 1. Ubah menjadi StatefulWidget untuk mengelola animasi
class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin>
    with SingleTickerProviderStateMixin {
  // Tambahkan 'mixin' untuk animasi

  // Controller dan variabel untuk animasi
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Durasi animasi 1 detik
    );

    // Animasi untuk efek fade in (dari transparan ke solid)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // Animasi untuk efek slide up (dari bawah ke atas)
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    // Mulai animasi saat halaman dibuka
    _animationController.forward();
  }

  @override
  void dispose() {
    // Selalu dispose controller untuk menghindari memory leak
    _animationController.dispose();
    super.dispose();
  }

  // Definisikan warna tema kustom
  static const Color primaryColor = Color.fromARGB(255, 0, 73, 146); // Biru yang lebih cerah

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Menggunakan Stack untuk menumpuk gambar, overlay, dan form
        children: [
          // Latar Belakang Gambar Travel
          Image.asset("assets/images/cover2.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          // Overlay Gelap untuk Keterbacaan
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          // Konten Login (yang dianimasikan)
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: FadeTransition(
                opacity: _fadeAnimation, // Terapkan animasi fade
                child: SlideTransition(
                  position: _slideAnimation, // Terapkan animasi slide
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Judul yang Lebih Menarik
                      Text(
                        'Pesona Kota Kembang',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'Masuk untuk memulai petualanganmu di Bandung',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 48.0),

                      // Input Username dengan Ikon
                      _buildTextField(
                        hint: 'Username',
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 20.0),

                      // Input Password dengan Ikon
                      _buildTextField(
                        hint: 'Password',
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const SizedBox(height: 32.0),

                      // Tombol Login dengan Ikon Pesawat
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30.0,
                              ), // Tombol bulat
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.airplanemode_active,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Mulai Jelajah Bandung',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Lupa Kata Sandi?',
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper yang diperbarui dengan ikon
  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      style: GoogleFonts.poppins(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2), // Latar semi-transparan
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none, // Tanpa border
        ),
      ),
    );
  }
}
