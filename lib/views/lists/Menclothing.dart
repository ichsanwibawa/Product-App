import 'package:flutter/material.dart';
import 'package:makeup_app/models/product.dart';
import 'package:makeup_app/views/details/DetailMenclothing.dart';


class Menclothing extends StatelessWidget {

  final List<product> Product;
  const Menclothing({Key? key, required this.Product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: Product.length,
      itemBuilder: (context, index){
        return Container(
          child: Row(
            children: [
              Expanded(
                  child : Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailMenclothing(Product: Product[index]),
                          ),
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15, 15, 15, 15),
                          child: Container(
                            width: 90,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    "${Product[index].image}",
                                    width: 90,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: Container(
                                    width: 220,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Product[index].title,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                        //   child: Text(
                                        //     Product[index].rating,
                                        //     style: TextStyle(
                                        //       fontWeight: FontWeight.w300,
                                        //     ),
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(0, 15, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.monetization_on,
                                                color: Color(0xFFFF397B),
                                                size: 18,
                                              ),
                                              // Padding(
                                              //   padding:
                                              //   EdgeInsetsDirectional
                                              //       .fromSTEB(
                                              //       5, 0, 0, 0),
                                              //   child: Text(
                                              //     'USD ${Product[index].price}',
                                              //     style: TextStyle(
                                              //       fontSize: 14,
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(0, 3, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.category,
                                                color: Color(0xFFFF397B),
                                                size: 18,
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    5, 0, 0, 0),
                                                child: Text(
                                                  Product[index].category,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        );
      },
    );
  }
}