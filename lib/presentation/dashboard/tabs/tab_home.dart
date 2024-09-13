import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klontong_app/application/products/products_bloc/products_bloc.dart';
import 'package:klontong_app/injection.dart';
import 'package:klontong_app/presentation/core/constants/assets.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/common_utils.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/dashboard/widgets/card_product.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';
import 'package:klontong_app/presentation/shared/buttons/button_primary.dart';
import 'package:klontong_app/presentation/shared/inputs/input_primary.dart';
import 'package:klontong_app/presentation/shared/others/empty_list.dart';
import 'package:klontong_app/presentation/shared/others/shimmer_primary.dart';
import 'package:klontong_app/presentation/shared/pages/page_list_wrapper.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  late TextEditingController _searchController;
  late BuildContext buildContext;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) =>
          getIt<ProductsBloc>()..add(const ProductsEvent.getProducts()),
      child: PageListWrapper(
        appBarTitle: 'The Klontonk',
        hasBack: false,
        header: searchHeader(context),
        child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 24.h),
            // padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            return state.map(
                initial: (value) => shimmerLoader(),
                loadInProgress: (value) => shimmerLoader(),
                loadSuccess: (value) {
                  log('loadSuccess ${value.filteredList}');
                  if (value.filteredList?.isEmpty == true) {
                    return const EmptyList();
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: value.filteredList?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.8,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = value.filteredList![index];
                        return CardProduct(
                          onTap: () => GoRouter.of(context)
                              .push(RoutePaths.productDetail, extra: data.id),
                          imageUrl: data.image,
                          name: '${data.name}',
                          price: 'Rp. ${formatRupiah(data.price!.toInt())}',
                          stock: '${data.stock} ${data.unit}',
                          weight: '${data.weight} Kg',
                        );
                      },
                    );
                  }
                },
                loadFailure: (value) {
                  return SizedBox();
                });
          },
        )),
      ),
    );
  }

  shimmerLoader() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.8,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return const ShimmerPrimary(
          child: CardProduct(
            imageUrl: AppImages.imgEmpty,
            name: 'Name',
            price: 'Rp. xxx.xxx',
            stock: '10 Pcs',
            weight: '1 Kg',
          ),
        );
      },
    );
  }

  searchHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: InputPrimary(
              hintText: 'Cari Data . . .',
              textInputAction: TextInputAction.search,
              textStyle: TextStyles.bold10,
              hintStyle:
                  TextStyles.bold10.copyWith(color: AppColors.lightText2),
              contentPadding: EdgeInsets.zero,
              prefixIcon:
                  Icon(Icons.search, size: 16.w, color: AppColors.lightText2),
              filled: true,
              filledColor: AppColors.backgroundGrey,
              borderColor: AppColors.backgroundGrey,
              borderRadius: BorderRadius.circular(8.r),
              controller: _searchController,
              onChanged: (value) {},
            ),
          ),
          16.0.width,
          ButtonPrimary(
            title: 'Tambah',
            textStyle: TextStyles.semibold10.copyWith(color: AppColors.white),
            width: 75.w,
            onPressed: () {
              GoRouter.of(context).push(RoutePaths.productAddition);
            },
          ),
        ],
      ),
    );
  }
}
