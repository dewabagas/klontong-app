import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';
import 'package:klontong_app/domain/core/entities/general_response.dart';
import 'package:klontong_app/domain/products/interfaces/i_product_repository.dart';

part 'delete_product_state.dart';
part 'delete_product_cubit.freezed.dart';

@injectable
class DeleteProductCubit extends Cubit<DeleteProductState> {
  final IProductRepository iProductRepository;

  DeleteProductCubit(this.iProductRepository)
      : super(const DeleteProductState.initial());

  Future<void> storeProduct(String id) async {
    try {
      emit(const DeleteProductState.loadInProgress());
      final data = await iProductRepository.deleteProduct(id);

      data.fold(
        (failure) => emit(DeleteProductState.loadFailure(failure)),
        (response) => emit(DeleteProductState.loadSuccess(response)),
      );
    } catch (e) {
      emit(DeleteProductState.loadFailure(
          ServerFailure(message: e.toString(), errorCode: 400)));
    }
  }
}
