import 'package:flutter/material.dart';
import 'package:makeup_app/models/product.dart';
import 'package:makeup_app/viewmodels/fetchproduct.dart';
import 'package:http/http.dart' as http;
import 'package:makeup_app/views/lists/Electronics.dart';
import 'package:makeup_app/views/lists/Menclothing.dart';
// import 'package:makeup_app/views/lists/Womanclothing.dart';
import 'package:makeup_app/views/lists/Jewelery.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Products',
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFFF397B),
              automaticallyImplyLeading: true,
              title: Text(
                'Product App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(color: Color(0xFF353535), borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TabBar(
                        indicator: BoxDecoration(color: Color(0xFFFF397B), borderRadius: BorderRadius.circular(5)),
                        tabs: <Widget>[
                          Tab(
                            text: 'Electronics',
                          ),
                          Tab(
                            text: 'Men Clothing',
                          ),
                          // Tab(
                          //   text: 'Women Clothing',
                          // ),
                          Tab(
                            text: 'Jewelery',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    // height: ,
                    child: TabBarView(
                        children: <Widget>[
                          Center(
                            child: FutureBuilder<List<product>>(
                              future: fetchElectronics(http.Client()),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) print(snapshot.error);
                                return snapshot.hasData
                                    ? Electronics(Product: snapshot.data!)
                                    : Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                          Center(
                            child: FutureBuilder<List<product>>(
                              future: fetchMenclothing(http.Client()),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) print(snapshot.error);
                                return snapshot.hasData
                                    ? Menclothing(Product: snapshot.data!)
                                    : Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                          // Center(
                          //   child: FutureBuilder<List<product>>(
                          //     future: fetchWomenclothing(http.Client()),
                          //     builder: (context, snapshot) {
                          //       if (snapshot.hasError) print(snapshot.error);
                          //       return snapshot.hasData
                          //           ? Womanclothing(Product: snapshot.data!)
                          //           : Center(
                          //         child: CircularProgressIndicator(),
                          //       );
                          //     },
                          //   ),
                          // ),
                          Center(
                            child: FutureBuilder<List<product>>(
                              future: fetchJewelery(http.Client()),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) print(snapshot.error);
                                return snapshot.hasData
                                    ? Jewelery(Product: snapshot.data!)
                                    : Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
