import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:peternakan/model/kamus_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class KamusPage extends StatefulWidget {
  @override
  _KamusPageState createState() => _KamusPageState();
}

class _KamusPageState extends State<KamusPage> {
  List<Kamus> dataKamus = List<Kamus>();
  List<Kamus> displayKamus = List<Kamus>();
  Future<List<Kamus>> getKamus() async {
    final response = await http
        .get(Uri.http('apiternak.000webhostapp.com', 'get_kamus.php'));
    var jsonData = json.decode(response.body);
    List<Kamus> kamus = [];
    for (var u in jsonData) {
      // Kamus kamu = Kamus(u['id'], u['judul'], u['title']);

      kamus.add(Kamus.fromJson(u));
    }
    // print(kamus.length);
    return kamus;
  }

  @override
  void initState() {
    getKamus().then((value) {
      setState(() {
        dataKamus.addAll(value);
        displayKamus = dataKamus;
        for (var map in displayKamus) {
          print(map);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) {
        return index == 0 ? _searchBar() : _listItem(index - 1);
      },
      itemCount: displayKamus.length + 1,
    ));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            displayKamus = dataKamus.where((value) {
              var valueTitle = value.judul.toLowerCase();
              return valueTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailKamus(displayKamus, index);
        }));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                displayKamus[index].judul,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailKamus extends StatelessWidget {
  List list;
  int index;
  DetailKamus(this.list, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list[index].judul),
        backgroundColor: HexColor('#393e46'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          list[index].judul,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                              fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.brown,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Text(
              list[index].isi,
              softWrap: true,
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
