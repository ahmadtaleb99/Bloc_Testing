

import 'dart:async';

import 'package:untitled/Model/Product.dart';
import 'package:untitled/networking.dart';

class ProductService {
  NetworkingHelper _networkingHelper = NetworkingHelper();


  Future<List<Product>> getAllProducts() async {
      var json = await _networkingHelper.getData(
          'https://fakestoreapi.com/products');
      return Product.productsFromJson(json);
    }

  }
