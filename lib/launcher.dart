import 'package:flutter/material.dart';
// Mengimpor package utama Flutter untuk membangun UI
import 'user/login.dart';
// import 'users/landingpage.dart';
// Baris ini di-comment; seharusnya digunakan untuk mengimpor halaman tujuan setelah splash screen.
// Pastikan LandingPage tersedia dan path-nya benar
import 'constans.dart';
// Mengimpor file konstanta warna, di sini diasumsikan ada `Palette.white`

// Membuat StatefulWidget bernama LauncherPage
class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

// Kelas state untuk LauncherPage
class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching(); // Memulai timer saat halaman dibuka
  }

  // Fungsi untuk menunda navigasi ke halaman berikutnya selama 5 detik
  void startLaunching() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return; // Mengecek apakah widget masih aktif sebelum pindah halaman
      Navigator.of(context).pushReplacement(
        // Navigasi ke halaman LandingPage dan menggantikan halaman ini
        MaterialPageRoute(builder: (_) => const LoginUI()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Membangun tampilan UI
    return Scaffold(
      body: SafeArea( // Menghindari area yang tertutup oleh status bar atau notch
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Padding kiri-kanan
          width: double.infinity, // Lebar mengikuti layar penuh
          height: MediaQuery.of(context).size.height, // Tinggi mengikuti layar penuh
          color: Palette.white, // Background putih (diambil dari konstanta Palette)
          child: Center( // Memusatkan child di tengah
            child: Image.asset(
              "assets/Logo.png", // Gambar logo yang ditampilkan di tengah
              height: 200.0,
              width: 380.0,
            ),
          ),
        ),
      ),
    );
  }
}
