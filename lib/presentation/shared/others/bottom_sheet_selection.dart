import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/domain/products/entities/product_category.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/shared/inputs/input_primary.dart';

class BottomSheetSelection extends StatefulWidget {
  final List<ProductCategory> itemList;
  final String title;

  const BottomSheetSelection(
      {super.key, required this.itemList, required this.title});

  @override
  _BottomSheetSelectionState createState() => _BottomSheetSelectionState();
}

class _BottomSheetSelectionState extends State<BottomSheetSelection> {
  TextEditingController searchController = TextEditingController();
  List<ProductCategory> _searchResult = [];

  @override
  void initState() {
    _searchResult = widget.itemList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF737373),
      height: screenHeight / 1.2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              24.0.height,
              Center(
                child: Container(
                    height: 4.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey2,
                        borderRadius: BorderRadius.circular(12.r))),
              ),
              16.0.height,
              Text(widget.title, style: TextStyles.medium16),
              16.0.height,
              InputPrimary(
                controller: searchController,
                hintText: 'Cari...',
                textInputAction: TextInputAction.search,
                textStyle: TextStyles.medium10,
                hintStyle:
                    TextStyles.medium10.copyWith(color: AppColors.lightText2),
                contentPadding: EdgeInsets.zero,
                prefixIcon:
                    Icon(Icons.search, size: 16.w, color: AppColors.lightText2),
                borderRadius: BorderRadius.circular(8.r),
                onChanged: (value) {
                  setState(() {
                    _searchResult = widget.itemList
                        .where((item) => item.categoryName!
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
              16.0.height,
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _searchResult.length,
                  separatorBuilder: (context, index) => const Divider(
                      color: AppColors.lightText2, thickness: 0.5),
                  itemBuilder: (context, index) {
                    final item = _searchResult[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context, item);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Text(
                          '${item.categoryName}',
                          style: TextStyles.regular14,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
