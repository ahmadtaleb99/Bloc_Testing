import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/Model/Product.dart';
import 'package:untitled/ProductService.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductService _service = ProductService();

  ProductBloc() : super(ProductInitial()) {
    on<ProductsRequested>(_getProducts);
  }

  void _getProducts(ProductsRequested event, Emitter<ProductState> emit) async {
    emit(ProductLoadInProgress());
    try {
      var products = await _service.getAllProducts();
      print('rosadoasdopaskdpaskdpkasd $products');
      if (products != null) {
        emit(ProductLoadSuccess(products: products));
      } else
        emit(ProductLoadFailed());
    } on TimeoutException {
      emit(ProductLoadTimeOut());
    }
    // catch (e) {
    //   emit(ProductLoadTimeOut());
    // }
  }
}
