import 'package:meta/meta.dart';

abstract class ProductEvent {}

class FetchProduct extends ProductEvent {}

class UpdateProduct extends ProductEvent {

}

class DeleteProduct extends ProductEvent {

}