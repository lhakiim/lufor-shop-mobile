import 'package:flutter/material.dart';
import 'package:lufor_shop_mobile/widgets/left_drawer.dart';
import 'package:lufor_shop_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {

    final String npm = '2306152191'; // NPM
    final String name = 'Luqmanul Hakim'; // Nama
    final String className = 'PBP D'; // Kelas

    MyHomePage({super.key});
    final List<ItemHomepage> items = [
        ItemHomepage("Lihat Daftar Produk", Icons.search, Colors.lightBlueAccent), // Biru terang
        ItemHomepage("Tambah Produk", Icons.add, Colors.tealAccent), // Hijau teal
        ItemHomepage("Logout", Icons.logout, Colors.deepOrangeAccent), // Oranye terang
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Luforshop',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
            backgroundColor: Theme.of(context).colorScheme.primary,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          drawer: const LeftDrawer(),
          // Body halaman dengan padding di sekelilingnya.
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            // Menyusun widget secara vertikal dalam sebuah kolom.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              // Row untuk menampilkan 3 InfoCard secara horizontal.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: name),
                  InfoCard(title: 'Class', content: className),
                ],
              ),
                Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Welcome to Luforshop',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),

                      // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                      GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        // Agar grid menyesuaikan tinggi kontennya.
                        shrinkWrap: true,

                        // Menampilkan ItemCard untuk setiap item dalam list items.
                        children: items.map((ItemHomepage item) {
                          return ItemCard(item);
                        }).toList(),
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

class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan title dan content.

  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}