part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoadInProgress extends ProductState {}
class ProductLoadFailed extends ProductState {}
class ProductLoadTimeOut extends ProductState {}
class ProductLoadSuccess extends ProductState {
  List<Product> products;

  ProductLoadSuccess({required this.products});
}
