import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:peternakan/model/galeri_model.dart';

// ignore: must_be_immutable
class GaleriPage extends StatelessWidget {
  var apiURL = 'apiternak.000webhostapp.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#eeeeee'),
        body: FutureBuilder<List>(
          future: Galeri().getGaleri(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(list: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Detail(list, index);
              }));
            },
            child: Container(
              height: 100,
              child: Card(
                elevation: 5.0,
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 10, 3),
                  title: Text(
                    list[index]['judul'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.brown,fontSize: 30),
                  ),
                  // subtitle: Text("Tanggal :${list[index]['tgl_berita']}"),
                  trailing: Image.network(
                    'http://apiternak.000webhostapp.com' + list[index]['gambar'],
                    fit: BoxFit.cover,
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  List list;
  int index;
  Detail(this.list, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list[index]['judul']),
        backgroundColor: HexColor('#393e46'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
              'http://apiternak.000webhostapp.com' + list[index]['gambar']),
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
                          list[index]['judul'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.brown,fontSize: 30),
                        ),
                      ),
                      // Text(list[index]['tgl_berita'])
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
              list[index]['isi'],
              softWrap: true,style: TextStyle(fontSize:25),
            ),
          )
        ],
      ),
    );
  }
}
