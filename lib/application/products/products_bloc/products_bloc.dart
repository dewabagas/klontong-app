import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';
import 'package:klontong_app/domain/products/entities/product.dart';
import 'package:klontong_app/domain/products/interfaces/i_product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final IProductRepository iProductRepository;

  ProductsBloc(this.iProductRepository) : super(const ProductsState.initial()) {
    on<_GetProducts>((event, emit) async {
      try {
        emit(const ProductsState.loadInProgress());

        final data = await iProductRepository.getProducts();
        data.fold(
          (l) => emit(ProductsState.loadFailure(l)),
          (r) => emit(ProductsState.loadSuccess(
            products: r,
            filteredList: r,
            searchQuery: '',
          )),
        );
      } catch (e) {
        emit(ProductsState.loadFailure(
            ServerFailure(message: e.toString(), errorCode: 400)));
      }
    });

    on<_SearchProducts>((event, emit) {
      final currentState = state;
      if (currentState is _LoadSuccess) {
        final query = event.query.toLowerCase();
        final filteredList = currentState.products?.where((data) {
          return data.supplierName?.toLowerCase().contains(query) == true ||
              data.name?.toLowerCase().contains(query) == true;
        }).toList();
        emit(ProductsState.loadSuccess(
          products: currentState.products,
          filteredList: filteredList,
          searchQuery: event.query,
        ));
      }
    });
  }
}
