# Lufor
### e-commerce
Luqmanul Hakim (2306152191)<br>
PBP D

- [Tugas7](#Tugas-7)
- [Tugas8](#Tugas-8)
- [Tugas9](#Tugas-9)

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

<br> 
Contoh Implementasi `Column` <br>

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
``` dart
onPressed: () {
    Navigator.pop(context);
},
```

# Tugas 9

###  Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
 Alasan Model diperlukan
- Model memastikan bahwa data yang diterima atau dikirim sesuai dengan format yang diharapkan
- Pengolahan data menjadi lebih sederhana karena setiap atribut memiliki representasi yang jelas dalam objek.
- Menjaga konsistensi antara data pada Flutter dan Django.

Bagaimana jika tidak membuat model
- Potensi error saat data tidak sesuai dengan yang diharapkan
- Kesulitan debugging karena tidak ada referensi jelas 
- Terjadi kesalahan membaca atau menulis data

### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http digunakan untuk:
- Mengirim HTTP Request: Digunakan untuk melakukan permintaan GET, POST, PUT, atau DELETE ke server.
- Menerima Respons: Library ini digunakan untuk menerima respons dari server, baik berupa data JSON, HTML, atau status HTTP.


### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah alat yang mempermudah pengelolaan sesi dan autentikasi berbasis cookie.
Fungsinya:
- Menyimpan Sesi Autentikasi: CookieRequest menyimpan informasi sesi sehingga server dapat mengenali pengguna tanpa perlu login ulang.
- Mengirim Permintaan dengan Sesi: Semua permintaan HTTP menggunakan cookie yang tersimpan, memastikan hanya pengguna yang terautentikasi dapat mengakses sumber daya tertentu.

Instance CookieRequest dibagikan agar seluruh komponen dalam aplikasi Flutter dapat berbagi sesi yang sama. Sehingga pengguna tetap terautentikasi di seluruh bagian aplikasi, tidak perlu membuat ulang koneksi atau login ulang di setiap komponen.

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Input Data:

- Pengguna memasukkan data ke dalam form di Flutter.
  Data diverifikasi menggunakan validator untuk memastikan keakuratan.
  
- Mengirim Data ke Server:
  Data di-serialize menjadi JSON menggunakan fungsi seperti jsonEncode.
  Permintaan POST dikirim ke endpoint Django menggunakan library http atau CookieRequest.

- Pengolahan Data di Server:
  Django menerima data melalui endpoint. Data diverifikasi dan disimpan dalam database (jika valid). Django mengembalikan respons (status berhasil atau error).

- Menampilkan Hasil di Flutter:
  Flutter menerima respons JSON dari Django.
  Data ditampilkan langsung di UI.


###  Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
- Login:
  Pengguna memasukkan data akun username dan password ke form Flutter.
  Flutter mengirim data ke endpoint /auth/login/ di Django menggunakan POST.
  Django memverifikasi kredensial terhadap database. Jika valid, Django mengirim cookie sesi kembali ke Flutter.
  Flutter menyimpan cookie tersebut menggunakan CookieRequest.

- Register:
  Data akun baru dikirim ke endpoint /auth/register/ di Django.
  Django membuat pengguna baru di database.
  Respons dikirim kembali ke Flutter berhasil atau error.

- Logout:
  Flutter mengirim permintaan POST ke endpoint /auth/logout/.
  Django menghapus sesi pengguna dari server.
  Flutter menghapus cookie sesi lokal.

- Menu Setelah Login:
  Setelah login, CookieRequest menyertakan cookie pada setiap permintaan.
  Django memverifikasi cookie sebelum mengizinkan akses ke menu tertentu.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

### Membuat App authentication pada django

#### Menambahkan fungsi register, login pada views.py
``` dart
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']
    ...
```
```dart
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
...
``` 

#### Membuat file register.dart dan login.dart pada folder screens
#### Mengintegrasikan sistem autentikasi django
Membuat Views dan URL untuk autentikasi untuk login, register, dan logout di Django
Pengimplementasian Login, Register, dan Logout padan Flutter
``` dart
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
...
```
``` dart
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
```

#### Membuat model kustom sesuai dengan proyek aplikasi Django.
Ambil konten dari localhost:8000/json kemudian generate model dart dengan bantuan website Quicktype
Membuat file baru bernama product_entry.dart danmeletakan model yang telah digenerate

#### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON dan menampilkan name, price, dan description dari masing-masing item
Buat file baru bernama `product_list.dart` dan isi dengan

``` dart
class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    var data = response;
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }
```
Manmpilkan data
``` dart
const SizedBox(height: 10),
Text("${snapshot.data![index].fields.name}"),
const SizedBox(height: 10),
Text("${snapshot.data![index].fields.descriptions}"),
const SizedBox(height: 10),
Text("${snapshot.data![index].fields.price}")
```
