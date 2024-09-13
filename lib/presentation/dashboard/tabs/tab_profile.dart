import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klontong_app/application/auths/logout_cubit/logout_cubit.dart';
import 'package:klontong_app/domain/core/constants/preference_constants.dart';
import 'package:klontong_app/domain/core/helpers/preference_helper.dart';
import 'package:klontong_app/injection.dart';
import 'package:klontong_app/presentation/core/constants/assets.dart';
import 'package:klontong_app/presentation/core/constants/strings.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/dashboard/widgets/button_profile.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';
import 'package:klontong_app/presentation/shared/others/app_snack_bar.dart';
import 'package:klontong_app/presentation/shared/others/custom_dialog_confirmation.dart';
import 'package:klontong_app/presentation/shared/others/shimmer_primary.dart';
import 'package:klontong_app/presentation/shared/pages/page_wrapper.dart';
import 'package:package_info_plus/package_info_plus.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  late BuildContext buildContext;
  String _appVersion = '';
  String _buildNumber = '';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
      _buildNumber = packageInfo.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogoutCubit>(
      create: (context) => getIt<LogoutCubit>(),
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
          state.maybeMap(
              loadInProgress: (value) => EasyLoading.show(),
              loadSuccess: (value) async {
                EasyLoading.dismiss();
                AppSnackBar.showSuccess(context, 'Logout Success');

                await removeAllValuesPreference();
                await addBoolToPreference(
                    key: PreferenceConstants.isLoggedIn, value: false);
                GoRouter.of(context).pushReplacement(RoutePaths.login);
              },
              loadFailure: (value) {
                EasyLoading.dismiss();
                AppSnackBar.showError(context,
                    value.failure?.message ?? AppStrings.errorMessageGeneral);
              },
              orElse: () {});
        },
        builder: (context, state) {
          buildContext = context;
          return PageWrapper(
            hasBack: false,
            appBarTitle: 'Profile',
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    children: [
                      Text('Pengaturan', style: TextStyles.bold14),
                      20.0.height,
                      ButtonProfile(
                          title: 'Keluar Aplikasi',
                          icon: AppIcons.icLogout,
                          onTap: () => showLogoutPopup()),
                      20.0.height,
                      Center(
                        child: Text(
                          '$_appVersion ($_buildNumber)',
                          style: TextStyles.regular12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  profileHeaderLoader() {
    return ShimmerPrimary(
      height: 205.h,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r)),
    );
  }

  void showLogoutPopup() {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialogConfirmation(
            title: 'Keluar Aplikasi',
            message: 'Apakah anda yakin ingin keluar?',
            positiveText: 'Logout',
            negativeText: 'Cancel',
            actionNegative: () {
              Navigator.pop(context);
            },
            actionPositiveButton: () async {
              buildContext.read<LogoutCubit>().logout();
            },
          );
        });
  }
}
