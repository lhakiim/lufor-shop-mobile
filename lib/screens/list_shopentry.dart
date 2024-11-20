import 'package:flutter/material.dart';
import 'package:lufor_shop_mobile/models/shop_entry.dart';
import 'package:lufor_shop_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ShopEntryPage extends StatefulWidget {
  const ShopEntryPage({super.key});

  @override
  State<ShopEntryPage> createState() => _ShopEntryPageState();
}

class _ShopEntryPageState extends State<ShopEntryPage> {
  Future<List<ShopEntry>> fetchShop(CookieRequest request) async {
    // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http://localhost:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object ShopEntry
    List<ShopEntry> listShop = [];
    for (var d in data) {
      if (d != null) {
        listShop.add(ShopEntry.fromJson(d));
      }
    }
    return listShop;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchShop(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data product pada Lufor Shop.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.name}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.descriptions}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.price}")
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}