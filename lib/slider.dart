/*
Step 3
Membuat File slider.dart
dan Membuat Logic Desain dari UI yang kita buat
 */

//3.1 import package:flutter/material.dart dan package:flutter_svg/flutter_svg.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//3.2 Buat Class slider sebagai stateless Widget
class SliderPage extends StatelessWidget {
  //3.3 tambahkan final variable untuk title, description dan image
  final String title;
  final String description;
  final String image;

  //3.4 tambahkan Receiver Function SliderPage untuk membaca Data Dari main.dart
  SliderPage({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    /*
    3.5 Tambahkan Variabel Width dari ukuran SVG Image
    dan Widget untuk menampung Title,description, dan image
     */
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white, // Warna Background
      // child :Column = Deklarasi Column yang digunakan untuk menampung Content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // digunakan untuk meletakkan column ke tengah
        children: <Widget>[ // digunakan untuk menampung widget yang akan dimasukkan ke dalam column
          /*
          Child 1 (SVG Image)
          digunakan untuk menampilkan untuk menampilkan gambar berdasarkan lokasi gambar
          dan mengatur panjang gambar
           */
          SvgPicture.asset(image, width: width * 0.6,),
          /*
          Child 2 (SizedBox)
          Digunakan untuk memberikan box, berfungsi untuk memberikan jarak
          antara elemen 1 ke elemen lain
           */
          SizedBox(height: 60,), // box diberikan jarak tinggi sebesar 60 px antara image dengan title
          /*
          Child 3 (Text Title)
          Digunakan untuk memberikan widget text
          dan pada teks diberikan style yang berfungsi untuk memodifikasi tampilan
          dari text
           */
          Text(title, style: TextStyle( // Text di ambil dari Variabel Widget yang di terima dari File Main Dart Serta memodifikasi Tampilan Text
            fontSize: 20, // Font diatur dalam ukuran 20 px
            fontWeight: FontWeight.bold // Font diatur tebal
          ),),
          /*
          Child 4 (SizedBox)
          Digunakan untuk memberikan box, berfungsi untuk memberikan jarak
          antara elemen 1 ke elemen lain
           */
          SizedBox(height: 20,), // box diberikan jarak tinggi sebesar 20 px antara title dengan description
          /*
          Child 5 (Padding + Text Description)
          padding digunakan untuk memberikan Jarak Antara Content dengan Container
          Serta Text Digunakan untuk memberikan widget text
          dan pada teks diberikan style yang berfungsi untuk memodifikasi tampilan
          dari text
           */
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80), // Memberikan Padding sebesar 80 px pada Garis Horizontal
            child: Text(
              description, style: TextStyle( // Text di ambil dari Variabel Widget yang di terima dari File Main Dart Serta memodifikasi Tampilan Text
                height: 1.5, // Mengatur Jarak Spasi sebesar 1.5
                fontSize: 14, // Mengatur Ukuran Font Sebesar 14 px
                fontWeight: FontWeight.normal, // Mengatur Font menjadi ukuran normal
                letterSpacing: 0.7 // Mengatur Jarak antar kalimat sebesar 0.7
            ),textAlign: TextAlign.center,),
          ),
          /*
          Child 6 (SizedBox)
          Digunakan untuk memberikan box, berfungsi untuk memberikan jarak
          antara elemen 1 ke elemen lain
           */
          SizedBox(height: 60,), // box diberikan jarak tinggi sebesar 20 px antara description dengan batas akhir dari Column
        ],
      ),
    );
  }
}
