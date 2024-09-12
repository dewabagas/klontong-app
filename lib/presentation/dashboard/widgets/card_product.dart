import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/constants/assets.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/utils/common_utils.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/shared/cards/card_general.dart';
import 'package:klontong_app/presentation/shared/others/shimmer_primary.dart';

class CardProduct extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? price;
  final String? stock;

  final Function()? onTap;

  const CardProduct({
    super.key,
    this.onTap,
    this.imageUrl,
    this.name,
    this.price,
    this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return CardGeneral(
      onTap: onTap,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r)),
              child: CachedNetworkImage(
                imageUrl: '$imageUrl',
                fit: BoxFit.cover,
                height: 100.h,
                placeholder: (context, url) => ShimmerPrimary(),
                errorWidget: (context, url, error) => Image.asset(
                  AppImages.imgNoImage,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            6.0.height,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(capitalizeEachWord('$name'),
                      style: TextStyles.semibold10),
                  4.0.height,
                  cardItem(
                      icon: Icons.discount, item: 'Harga', value: '$price'),
                  4.0.height,
                  cardItem(
                      icon: Icons.discount, item: 'Stock', value: '$stock'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  cardItem(
      {required IconData icon, required String item, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item,
          style: TextStyles.semibold10,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Icon(
        //       icon,
        //       color: AppColors.secondary,
        //       size: 16.w,
        //     ),
        //     4.0.width,
        //     Text(
        //       item,
        //       style: TextStyles.semibold10,
        //     ),
        //   ],
        // ),
        Text(value, style: TextStyles.regular10)
      ],
    );
  }
}
