import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/product_detailrepo.dart';
import 'productdetail_event.dart';
import 'productdetail_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc({required this.repository}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is FetchProduct) {
        emit(ProductLoading());

        try {
          final product = await repository.fetchProduct();
          emit(ProductLoaded(product: product));
        } catch (error) {
          emit(ProductError(message: 'Failed to fetch product: $error'));
        }
      } else if (event is UpdateProduct) {
        // Logic to update product
      } else if (event is DeleteProduct) {
        // Logic to delete product
      }
    });

  }

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProduct) {
      yield ProductLoading();
      try {
        final product = await repository.fetchProduct();
        yield ProductLoaded(product: product);
      } catch (e) {
        yield ProductError(message: 'Failed to fetch product');
      }
    }
  }
}
