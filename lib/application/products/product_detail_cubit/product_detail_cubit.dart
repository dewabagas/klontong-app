import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';
import 'package:klontong_app/domain/products/entities/product.dart';
import 'package:klontong_app/domain/products/interfaces/i_product_repository.dart';

part 'product_detail_state.dart';
part 'product_detail_cubit.freezed.dart';

@injectable
class ProductDetailCubit extends Cubit<ProductDetailState> {
  final IProductRepository iProductRepository;

  ProductDetailCubit(this.iProductRepository)
      : super(const ProductDetailState.initial());

  Future<void> getProductDetail(String id) async {
    try {
      emit(const ProductDetailState.loadInProgress());
      final data = await iProductRepository.getProductDetail(id);

      data.fold(
        (failure) => emit(ProductDetailState.loadFailure(failure)),
        (response) => emit(ProductDetailState.loadSuccess(response)),
      );
    } catch (e) {
      emit(ProductDetailState.loadFailure(
          ServerFailure(message: e.toString(), errorCode: 400)));
    }
  }
}
