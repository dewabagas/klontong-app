import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';
import 'package:klontong_app/domain/core/entities/general_response.dart';
import 'package:klontong_app/domain/products/interfaces/i_product_repository.dart';
import 'package:klontong_app/domain/products/requests/store_product_request.dart';

part 'store_product_state.dart';
part 'store_product_cubit.freezed.dart';

@injectable
class StoreProductCubit extends Cubit<StoreProductState> {
  final IProductRepository iProductRepository;

  StoreProductCubit(this.iProductRepository)
      : super(const StoreProductState.initial());

  Future<void> storeProduct(StoreProductRequest request) async {
    try {
      emit(const StoreProductState.loadInProgress());
      final data = await iProductRepository.storeProduct(request);

      data.fold(
        (failure) => emit(StoreProductState.loadFailure(failure)),
        (response) => emit(StoreProductState.loadSuccess(response)),
      );
    } catch (e) {
      emit(StoreProductState.loadFailure(
          ServerFailure(message: e.toString(), errorCode: 400)));
    }
  }
}
