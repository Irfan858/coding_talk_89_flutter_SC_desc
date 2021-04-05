import 'package:flutter/material.dart';
import 'package:latihan_ulang_onboard/slider.dart';

void main() {
  runApp(MyApp());
}

/*
Step 1
Membuat Kerangka Dasar
 */

//1.1. Buat Kelas MyApp Sebagai Stateless Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}

//1.2 Buat Kelas OnBoarding Sebagai Statefull Widget
class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

/*
Step 4
Membuat Penampung Data dan logika dari Page
 */
class _OnBoardingState extends State<OnBoarding> {
  // 4.1 buat variabel Constructor _currentPage
  int _currentPage = 0;

  // 4.2 Membuat Controller dengan memanggil method PageController()
  PageController _controller = PageController();

  /*
    4.3 Membuat List Widget untuk penampung data dari title, description dan image
        untuk selanjutnya di olah ke sliderPage
   */
  List <Widget> _pages = [
    SliderPage(
      title: "Belajar Online Langsung dengan Mentor Terbaik",
      description: "Belajar Online menjadi sangat mudah dan menyenangkan karena kami telah menyediakan mentor terbaik untuk anda",
      image: "assets/1.svg",
    ),
    SliderPage(
      title: "Dapatkan Sertifikat Skill Yang Terpercaya",
      description: "Kami Memberikan sertifikat atas skill anda yang telah diakui oleh banyak perusahaan ternama",
      image: "assets/2.svg",
    ),
    SliderPage(
      title: "Ayo Kita Mulai Belajar Sekarang",
      description: "tanpa berlama lama, mari kita langsung saja belajar bersama dengan kami",
      image: "assets/3.svg",
    ),
  ];

  /*
  Constructor ini digunakan untuk merefresh tampilan
  saat melakukan scroll
   */
  _onChanged(int index)
  {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*
      4.4 Membuat Logika Build tampilan Page dengan Pageview.builder
     */
    return Scaffold( //scaffold adalah widget Utama dalam membangun halaman
      body: Stack( // widget yang digunakan untuk mengatur posisi dari children widget
        children: <Widget> [ // children berisi widget
          PageView.builder( // Class Method yang berfungsi untuk Melakukan Build Page yang dapat di scroll
            scrollDirection: Axis.horizontal, // Memberikan Fungsi untuk dapat di scroll ke kiri / kanan
            controller: _controller, // memanggil constructor _controller
            itemCount: _pages.length, // Menghitung jumlah pages yang tersedia pada list
            onPageChanged: _onChanged, // Melakukan pemangilan constructor _onChanged
            itemBuilder: (context, int index) { // Melakukan Build / Menganti tampilan dari data yang dituju
              return _pages[index];
            },
          ),
          /*
            Step 5
            Membuat Bagian Indikator dan Tombol
           */
          // 5.1 Membuat Indikator
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              Row(
                mainAxisAlignment : MainAxisAlignment.center,
                children :List<Widget>.generate(_pages.length,(int index){
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentPage)
                          ? Colors.green
                          : Colors.green.withOpacity(0.5),
                    ),
                  );
                })),
              // 5.2 Membuat Button Next dan Get Started pada Index Terakhir
              InkWell(
                onTap: (){
                  _controller.nextPage(duration: Duration(milliseconds: 800), curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 60,
                  alignment: Alignment.center,
                  width: (_currentPage == (_pages.length - 1)) ? 175 : 60,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: (_currentPage == (_pages.length - 1))
                  ? Text("Mulai Sekarang",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                  : Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ]
          )
        ],
      ),
    );
  }
}

