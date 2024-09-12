import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';
import 'package:klontong_app/domain/core/entities/general_response.dart';
import 'package:klontong_app/domain/products/interfaces/i_product_repository.dart';
import 'package:klontong_app/domain/products/requests/store_product_request.dart';

part 'update_product_state.dart';
part 'update_product_cubit.freezed.dart';

@injectable
class UpdateProductCubit extends Cubit<UpdateProductState> {
  final IProductRepository iProductRepository;

  UpdateProductCubit(this.iProductRepository)
      : super(const UpdateProductState.initial());

  Future<void> updateProduct(String id, StoreProductRequest request) async {
    try {
      emit(const UpdateProductState.loadInProgress());
      final data = await iProductRepository.updateProduct(id, request);

      data.fold(
        (failure) => emit(UpdateProductState.loadFailure(failure)),
        (response) => emit(UpdateProductState.loadSuccess(response)),
      );
    } catch (e) {
      emit(UpdateProductState.loadFailure(
          ServerFailure(message: e.toString(), errorCode: 400)));
    }
  }
}
