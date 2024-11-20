import 'package:flutter/material.dart';
import 'package:lufor_shop_mobile/screens/menu.dart';
import 'package:lufor_shop_mobile/screens/shopentry_form.dart';
import 'package:lufor_shop_mobile/screens/list_shopentry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Luforshop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Semua ada di Luforshop!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart_rounded),
            title: const Text('Tambah Item'),
            // Bagian redirection ke productEntryFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.search_rounded),
            title: const Text('Daftar Product'),
            onTap: () {
                // Route menu ke halaman mood
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopEntryPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}