# Lufor
### e-commerce
Luqmanul Hakim (2306152191)<br>
PBP D

# Tugas 7

### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- Stateless Widget
  Stateless widget adalah widget yang tidak memiliki state dan bersifat statis. Artinya widget ini tidak akan berubah selama aplikasi berjalan kecuali jika dilakukan rebuild pada parent widgetnya. Contohnya adalah Text, Icon, Gambar.
- Stateful Widget
  Stateful widget adalah widget yang memiliki state dan bersifat dinamis. Artinya widget ini dapat berubah selama aplikasi berjalan dengan melakukan rebuild. Contohnya adalah Textfield, Checkbox.

**Perbedaan**
- Stateless Widget -> Bersifat statis, tidak memiliki state, tidak adanya perubahan internal tampilan.
- Stateful Widget -> Bersifat dinamis, memiliki state, cocok untuk tampilan data yang dapat berubah-ubah

### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- Scaffold : Struktur dasar halaman aplikasi.
- Appbar : Digunakan untuk menampilkan bar di atas halaman yang digunakan untuk judul halaman.
- Text : Menampilkan teks statis dalam aplikasi.
- Center : Meratakan widget ditengah aplikasi.
- Padding : Memberikan jarak di sekitar widget yang ditempatkan didalamnya.
- Icon : Menampilkan icon pada widget.
- Material : Visual dan efek pada aplikasi.
- InkWell : Efek interaktif saat ditekan.
- SnackBar : Pesan singkat dibawah layar.

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` adalah fungsi dalam StatefulWidget yang digunakan untuk menginformasikan perubahan yang terjadi. Flutter akan merender ulang widget apabila `setState()` dipanggil untuk melakukan perubahan tampilan.
Variabel yang terdampak dari `setState()` adalah variabel yang ada dalam StatefulWidget dan digunakan dalam tampilan. Namun, variabel `const` dan `final` tidak dapat dipengaruhi oleh `setState()`.

### Jelaskan perbedaan antara const dengan final.
- `const` adalah variabel yang memiliki nilai yang bersifat tetap dan terdefinisi saat compile time. Contohnya adalah `const int constantValue = 10;`
- `final` adalah variabel yang memiliki nilai yang bersifat tetap dan terdefinisi saat runtime. Contohnya adalah `final DateTime currentTime = DateTime.now();`. Nilai currentTime conditional berdasarkan waktu sekarang. 

### Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

### Generate Proyek Flutter Baru dan Jalankan
``` dart
flutter create lufor_shop_mobile
cd lufor_shop_mobile
run flutter
```
#### Merapikan struktur proyek dengan membuat file `menu.dart`.
### Membuat Item Homepage
``` dart
class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color;

    ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
#### Membuat array item
``` dart
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.search, Colors.red),
    ItemHomepage("Tambah Produk", Icons.add, Colors.green),
    ItemHomepage("Logout", Icons.logout, Colors.blue),
];
```

### Memunculkan Snackbar
``` dart
child: InkWell(
    onTap: () {
        ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
        );
    },
    child: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                    ),
                ],
            ),
        ),
    ),
),
```
<br><br>
# Tugas 8

### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
`const` pada Flutter digunakan untuk mendefinisikan objek yang nilainya tidak berubah selama dilakukan runtime. Keuntunggannya adalah
- Meningkatkan efisiensi memory dikarenakan objek `const` hanya dideklarasikan sekali sehingga menghindari alokasi memori berulang untuk objek yang sama,
- Meningkatkan performa dikarenakan objek tidak perlu dilakukan rebuild setiap ada perubahan sehingga mengurangi kerja sistem.
`const` sebaiknya digunakan ketika widget bersifat statis dan tidak memiliki perubahan dan tidak perlu digunakan ketika datanya bersifat dinamis yang berubah ketika aplikasi berjalan.

###  Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
- Column menyusun widget secara vertikal dari atas ke bawah.
- Row menyusun widget secara horizontal dari kiri ke kanan.
Contoh Implementasi `Column`
``` dart
Column(
  children: [
    Text('Column 1'),
    Text('Column 2'),
  ],
);

```
Contoh Implementasi `Row`
``` dart
Column(
  children: [
    Text('Row 1'),
    Text('Row 2'),
  ],
);

```

### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada tugas ini saya menggunakan elemen `TextFormField` pada field nama, harga dan deskripsi product.
Elemen Flutter yang tidak digunakan:
 - `Slider` : Elemen input untuk memilih nilai numerik dalam suatu range.
 - `RadioListTile` : Elemen input untuk memilih salah satu radio button dari beberapa value.
 - `CheckboxListTile` : Elemen input untuk memilih beberapa value.
 - `DatePicker/TimePicker` : Elemen input untuk memilih tanggal/waktu.
 - `DropDownButtonFormField` : Elemen input untuk memilih salah satu button yang disusun dalam bentuk dropdown

### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Tema di atur dengan mengimplementasikan `ThemeData` pada MaterialApp. Tema ini bersifat global sehingga ia mengatur warna, teks dan lainnya diseluruh aplikasi.
``` Dart
colorScheme: ColorScheme.fromSwatch(
  primarySwatch: Colors.blueGrey,
).copyWith(secondary: Colors.tealAccent[200]), 
```
Pengaplikasian tema dapat dilakukan dengan `color: Theme.of(context).colorScheme.primary,` atau `color: Theme.of(context).colorScheme.secondary,`

### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Navigasi ditangani dengan menggunakan Navigator. 
- Untuk berpindah kehalaman lain menggunakan `Navigator.push`
  ``` dart
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProductEntryFormPage(),
    ),
  );
  ```
- Untuk kembali ke halaman sebelumnya menggunakan `Navigator.pop`