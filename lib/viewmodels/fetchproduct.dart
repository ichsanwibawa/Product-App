import 'package:makeup_app/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'dart:async';
import 'dart:convert';

Future<List<product>> fetchElectronics(http.Client client) async {
  final response =
  await client.get(Uri.parse('https://fakestoreapi.com/products/category/electronics?limit=5'));
  return compute(parseproduct, response.body);
}

Future<List<product>> fetchMenclothing(http.Client client) async {
  final response =
  await client.get(Uri.parse('https://fakestoreapi.com/products/category/men'+"'"+'s clothing?limit=5'));
  return compute(parseproduct, response.body);
}

// Future<List<product>> fetchWomenclothing(http.Client client) async {
//   final response =
//   await client.get(Uri.parse('https://fakestoreapi.com/products/category/woman'+"'"+'s clothing?limit=5'));
//   return compute(parseproduct, response.body);
// }

Future<List<product>> fetchJewelery(http.Client client) async {
  final response =
  await client.get(Uri.parse('https://fakestoreapi.com/products/category/jewelery?limit=5'));
  return compute(parseproduct, response.body);
}

List<product> parseproduct(String responseBody) {
  final parsed =
  jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<product>((json) => product.fromJson(json)).toList();
}