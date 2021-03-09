import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:peternakan/Pages/BeritaPage.dart';

import 'GaleriPage.dart';
import 'KamusPage.dart';
import 'LoginPage.dart';

class PageControl extends StatefulWidget {
  @override
  _PageControlState createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {
  int currentIndex = 0;
  final List<Widget> _listMenu = [
    BeritaPage(),
    GaleriPage(),
    KamusPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Farm's App"),
          backgroundColor: HexColor('#393e46'),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                })
          ],
        ),
        backgroundColor: HexColor('#eeeeee'),
        body: _listMenu[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: HexColor('#393e46'),
          unselectedItemColor: HexColor('#eeeeee'),
          selectedItemColor: HexColor('#00adb5'),
          onTap: onTabTapped,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.agriculture), label: 'Berita'),
            BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Galeri'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Kamus')
          ],
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

// class PageWidget extends StatelessWidget {
//   final state;
//   PageWidget(this.state);
//   @override
//   Widget build(BuildContext context) {
//     if (state == "Berita") {
//       return Scaffold(
//         backgroundColor: HexColor('#eeeeee'),
//       );
//     } else if (state == "Galeri") {
//       return Scaffold(
//         backgroundColor: HexColor('#eeeeee'),
//       );
//     } else {
//       return Scaffold(
//         backgroundColor: HexColor('#eeeeee'),
//       );
//     }
//   }
// }
