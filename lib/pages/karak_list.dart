import 'dart:convert';
// import 'package:responsi_123190005/pages/karak_detail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class KarakList extends StatefulWidget {
  const KarakList({Key? key}) : super(key: key);

  @override
  _KarakListState createState() => _KarakListState();
}

class _KarakListState extends State<KarakList> {
  //_get berfungsi untuk menampung data dari internet nanti

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _fecthListChar();
  }

  //method untuk merequest/mengambil data dari internet
  final String apiUrl = "https://api.genshin.dev/characters/";

  Future<List<dynamic>> _fecthListChar() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //menghilangkan debug label
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          //membuat appbar dengan background putih dan membuat tulisan di tengah
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("Karakter"),
            centerTitle: true,
          ),
          body: Container(
              child: FutureBuilder<List<dynamic>>(
                  future: _fecthListChar(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        padding: const EdgeInsets.all(12),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              // onTap: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => KarakDetail(
                              //               charName: snapshot.data[index])));
                              // },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 24),
                                                  child: Image.network(
                                                    //menampilkan data gamabr
                                                    "https://api.genshin.dev/characters/${snapshot.data[index]}/icon",
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 4),
                                                      child: Text(
                                                        snapshot.data[index],
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )));
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 10,
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }))),
    );
  }
}
