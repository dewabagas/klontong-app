import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/constants/preference_constants.dart';
import 'package:klontong_app/domain/core/helpers/preference_helper.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  Future<void> initSplash() async {
    try {
      emit(const SplashState.loadInProgress());

      final isLoggedIn =
          await getBoolValuesPreference(key: PreferenceConstants.isLoggedIn) ??
              false;

      if (isLoggedIn) {
        emit(const SplashState.loadSuccess(RoutePaths.dashboard));
      } else {
        emit(const SplashState.loadSuccess(RoutePaths.login));
      }
    } catch (e) {
      emit(const SplashState.loadFailure());
    }
  }
}
