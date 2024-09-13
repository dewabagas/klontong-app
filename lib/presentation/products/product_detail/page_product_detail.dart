import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klontong_app/application/products/delete_product_cubit/delete_product_cubit.dart';
import 'package:klontong_app/application/products/product_detail_cubit/product_detail_cubit.dart';
import 'package:klontong_app/application/products/update_product_cubit/update_product_cubit.dart';
import 'package:klontong_app/injection.dart';
import 'package:klontong_app/presentation/core/constants/assets.dart';
import 'package:klontong_app/presentation/core/constants/strings.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/common_utils.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';
import 'package:klontong_app/presentation/shared/buttons/button_primary.dart';
import 'package:klontong_app/presentation/shared/others/app_snack_bar.dart';
import 'package:klontong_app/presentation/shared/others/custom_dialog_confirmation.dart';
import 'package:klontong_app/presentation/shared/others/shimmer_primary.dart';

class PageProductDetail extends StatefulWidget {
  const PageProductDetail({super.key});

  @override
  State<PageProductDetail> createState() => _PageProductDetailState();
}

class _PageProductDetailState extends State<PageProductDetail> {
  late BuildContext buildContext;
  @override
  Widget build(BuildContext context) {
    final String productId = GoRouterState.of(context).extra! as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductDetailCubit>(
          create: (context) =>
              getIt<ProductDetailCubit>()..getProductDetail(productId),
        ),
        BlocProvider<DeleteProductCubit>(
          create: (context) => getIt<DeleteProductCubit>(),
        ),
        BlocProvider<UpdateProductCubit>(
          create: (context) => getIt<UpdateProductCubit>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<DeleteProductCubit, DeleteProductState>(
            listener: (context, state) {
              state.maybeMap(
                  loadInProgress: (value) => EasyLoading.show(),
                  loadSuccess: (value) {
                    EasyLoading.dismiss();
                    AppSnackBar.showSuccess(context, AppStrings.deleteSuccess);
                    GoRouter.of(context).push(RoutePaths.dashboard);
                  },
                  loadFailure: (value) {
                    EasyLoading.dismiss();
                    AppSnackBar.showError(
                        context,
                        value.failure?.message ??
                            AppStrings.errorMessageGeneral);
                  },
                  orElse: () {});
            },
          ),
          BlocListener<UpdateProductCubit, UpdateProductState>(
            listener: (context, state) {
              state.maybeMap(
                  loadInProgress: (value) => EasyLoading.show(),
                  loadSuccess: (value) {
                    EasyLoading.dismiss();
                    AppSnackBar.showSuccess(context, AppStrings.updateSuccess);
                    GoRouter.of(context).push(RoutePaths.dashboard);
                  },
                  loadFailure: (value) {
                    EasyLoading.dismiss();
                    AppSnackBar.showError(
                        context,
                        value.failure?.message ??
                            AppStrings.errorMessageGeneral);
                  },
                  orElse: () {});
            },
          ),
        ],
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            buildContext = context;
            return state.map(
                initial: (value) => const SizedBox(),
                loadInProgress: (value) => const SizedBox(),
                loadSuccess: (value) {
                  return Stack(
                    children: [
                      DraggableHome(
                          title: Text('${value.response?.name}',
                              style: TextStyles.medium14),
                          alwaysShowLeadingAndAction: true,
                          leading: InkWell(
                              onTap: () => GoRouter.of(context).pop(),
                              child: const Icon(Icons.arrow_back,
                                  color: AppColors.white)),
                          backgroundColor: AppColors.white,
                          headerWidget: CachedNetworkImage(
                            imageUrl: '${value.response?.image}',
                            width: double.infinity,
                            height:
                                300.h, // Set the desired height for the image
                            fit: BoxFit.cover,
                            placeholder: (context, url) => ShimmerPrimary(),
                            errorWidget: (context, url, error) => Image.asset(
                              AppImages.imgNoImage,
                              width: 100.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          body: [
                            Container(
                              color: AppColors.white,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rp${formatPrice(value.response!.price!)}',
                                    style: TextStyles.semibold16,
                                    textAlign: TextAlign.start,
                                  ),
                                  10.0.height,
                                  Row(
                                    children: [
                                      // Icon(Icons.menu_book,
                                      //     color: AppColors.lightText1),
                                      // 8.0.width,
                                      Expanded(
                                        child: Text(
                                          '${value.response?.name}',
                                          style: TextStyles.medium12,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            16.0.height,
                            Container(
                                height: 10.h, color: AppColors.backgroundGrey),
                            16.0.height,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: cardItem(
                                          title: 'Stok',
                                          subtitle:
                                              '${value.response?.stock} ${value.response?.unit}')),
                                  10.0.width,
                                  Expanded(
                                      child: cardItem(
                                          title: 'Berat',
                                          subtitle:
                                              '${value.response?.weight} Kg')),
                                  10.0.width,
                                  Expanded(
                                      child: cardItem(
                                          title: 'Supplier',
                                          subtitle:
                                              '${value.response?.supplierName}')),
                                ],
                              ),
                            ),
                            16.0.height,
                            Container(
                                height: 10.h, color: AppColors.backgroundGrey),
                            16.0.height,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Details', style: TextStyles.semibold12),
                                  10.0.height,
                                  detailItem(
                                      icon: Icons.factory_outlined,
                                      title: 'Supplier',
                                      subtitle: value.response?.supplierName),
                                  6.0.height,
                                  detailItem(
                                      icon: Icons.numbers,
                                      title: 'SKU',
                                      subtitle: value.response?.sku),
                                  6.0.height,
                                  detailItem(
                                      icon: Icons.fastfood_outlined,
                                      title: 'Kategori',
                                      subtitle: value.response?.categoryName),
                                ],
                              ),
                            )
                          ]),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 14.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  color:
                                      const Color(0xFF3A3A3A).withOpacity(0.25),
                                )
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ButtonPrimary(
                                      title: 'Hapus',
                                      onPressed: () {
                                        showDeleteDialog(
                                            '${value.response?.id}');
                                      })),
                              6.0.width,
                              Expanded(
                                  child: ButtonPrimary(
                                      activeColor: AppColors.white,
                                      borderWidth: 1,
                                      borderColor: AppColors.primary,
                                      textColor: AppColors.primary,
                                      title: 'Ubah',
                                      onPressed: () {
                                        GoRouter.of(context).pushReplacement(
                                          RoutePaths.productAddition,
                                          extra: {'product': value.response},
                                        );
                                      })),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                loadFailure: (value) {
                  return SizedBox();
                });
          },
        ),
      ),
    );
  }

  void showDeleteDialog(String id) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialogConfirmation(
            title: 'Hapus Data',
            message: 'Apakah anda yakin ingin menghapus data ini?',
            positiveText: 'Ya',
            negativeText: 'Batal',
            actionNegative: () {
              Navigator.pop(context);
            },
            actionPositiveButton: () async {
              buildContext.read<DeleteProductCubit>().deleteProduct(id);
            },
          );
        });
  }

  cardItem({String? title, String? subtitle}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.backgroundGrey),
      child: Column(
        children: [
          Text('$title', style: TextStyles.regular10),
          4.0.height,
          Text('$subtitle', style: TextStyles.semibold12),
        ],
      ),
    );
  }

  detailItem({IconData? icon, String? title, String? subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 20.w),
        6.0.width,
        Expanded(
          flex: 2,
          child: Text(
            '$title',
            style: TextStyles.regular10,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        6.0.width,
        Expanded(
          flex: 3,
          child: Text(
            '$subtitle',
            style: TextStyles.semibold10,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
