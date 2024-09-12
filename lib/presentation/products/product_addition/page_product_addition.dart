import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klontong_app/application/products/store_product_cubit/store_product_cubit.dart';
import 'package:klontong_app/application/products/update_product_cubit/update_product_cubit.dart';
import 'package:klontong_app/domain/products/entities/product.dart';
import 'package:klontong_app/domain/products/entities/product_category.dart';
import 'package:klontong_app/domain/products/requests/store_product_request.dart';
import 'package:klontong_app/injection.dart';
import 'package:klontong_app/presentation/core/constants/strings.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/common_utils.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';
import 'package:klontong_app/presentation/shared/buttons/button_primary.dart';
import 'package:klontong_app/presentation/shared/cards/card_dashed.dart';
import 'package:klontong_app/presentation/shared/cards/card_general.dart';
import 'package:klontong_app/presentation/shared/inputs/input_primary.dart';
import 'package:klontong_app/presentation/shared/others/app_snack_bar.dart';
import 'package:klontong_app/presentation/shared/others/bottom_sheet_selection.dart';
import 'package:klontong_app/presentation/shared/others/custom_bottom_sheet.dart';
import 'package:klontong_app/presentation/shared/pages/page_wrapper.dart';

class PageProductAddition extends StatefulWidget {
  final Product? product;
  const PageProductAddition({super.key, this.product});

  @override
  State<PageProductAddition> createState() => _PageProductAdditionState();
}

class _PageProductAdditionState extends State<PageProductAddition> {
  XFile? _image;
  bool isPickingLogo = true;
  late BuildContext buildContext;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController supplierNameController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  int? selectedCategory;
  bool get isUpdateMode => widget.product != null;

  List<ProductCategory> categoryList = [
    ProductCategory(categoryId: 1, categoryName: 'Minuman'),
    ProductCategory(categoryId: 2, categoryName: 'Makanan'),
    ProductCategory(categoryId: 3, categoryName: 'Makanan Ringan'),
    ProductCategory(categoryId: 4, categoryName: 'Kecantikan'),
    ProductCategory(categoryId: 5, categoryName: 'Kesehatan'),
    ProductCategory(categoryId: 6, categoryName: 'Minyak Goreng'),
  ];

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectedImage =
        await _picker.pickImage(source: source, imageQuality: 50);

    setState(() {
      _image = selectedImage;
    });
  }

  @override
  void initState() {
    super.initState();

    // Pre-fill form fields if editing a product
    if (isUpdateMode) {
      nameController.text = widget.product!.name ?? '';
      descriptionController.text = widget.product!.description ?? '';
      skuController.text = widget.product!.sku ?? '';
      supplierNameController.text = widget.product!.supplierName ?? '';
      stockController.text = widget.product!.stock?.toString() ?? '';
      unitController.text = widget.product!.unit ?? '';
      weightController.text = widget.product!.weight?.toString() ?? '';
      priceController.text = widget.product!.price?.toString() ?? '';
      categoryController.text = widget.product!.categoryName ?? '';
      selectedCategory = widget.product!.categoryId;

      // Load the existing image if available
      if (widget.product!.image != null) {
        _image = XFile(widget.product!.image!);
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    skuController.dispose();
    supplierNameController.dispose();
    stockController.dispose();
    unitController.dispose();
    weightController.dispose();
    priceController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  void _showImageSourceActionSheet(BuildContext context, bool isLogo) {
    setState(() {
      isPickingLogo = isLogo;
    });

    CustomBottomSheet.showAutoHeightBottomSheet(
      context: context,
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text('Kamera', style: TextStyles.regular12),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text('Galeri', style: TextStyles.regular12),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectItem(BuildContext context, List<ProductCategory> itemList,
      String title, Function(ProductCategory) onSelected) async {
    final ProductCategory? selectedItem =
        await showModalBottomSheet<ProductCategory>(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (BuildContext buildContext) {
        return BottomSheetSelection(
          itemList: itemList,
          title: title,
        );
      },
    );

    if (selectedItem != null) {
      onSelected(selectedItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<StoreProductCubit>(
            create: (context) => getIt<StoreProductCubit>(),
          ),
          BlocProvider<UpdateProductCubit>(
            create: (context) => getIt<UpdateProductCubit>(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<StoreProductCubit, StoreProductState>(
              listener: (context, state) {
                state.maybeMap(
                    loadInProgress: (value) => EasyLoading.show(),
                    loadSuccess: (value) {
                      EasyLoading.dismiss();
                      AppSnackBar.showSuccess(
                          context, 'Berhasil Mendaftarkan Produk');
                      GoRouter.of(context)
                          .pushReplacement(RoutePaths.dashboard);
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
                      AppSnackBar.showSuccess(
                          context, AppStrings.updateSuccess);
                      GoRouter.of(context)
                          .pushReplacement(RoutePaths.dashboard);
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
          child: Builder(builder: (context) {
            buildContext = context;
            return Stack(
              children: [
                PageWrapper(
                  appBarTitle: isUpdateMode ? 'Ubah Produk' : 'Tambah Produk',
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        children: [
                          _buildImageSection(
                            _image,
                            'Unggah Gambar',
                            widget.product?.image,
                            () => _showImageSourceActionSheet(context, true),
                          ),
                          16.0.height,
                          InputPrimary(
                            controller: nameController,
                            title: 'Nama Produk',
                            hintText: 'Nama Produk',
                            filled: true,
                            filledColor: AppColors.white,
                          ),
                          16.0.height,
                          InputPrimary(
                            controller: descriptionController,
                            title: 'Deskripsi Produk',
                            hintText: 'Deskripsi Produk',
                            filled: true,
                            filledColor: AppColors.white,
                            maxLine: 3,
                          ),
                          16.0.height,
                          InputPrimary(
                            controller: skuController,
                            title: 'SKU',
                            hintText: 'SKU',
                            filled: true,
                            filledColor: AppColors.white,
                          ),
                          16.0.height,
                          InputPrimary(
                            controller: supplierNameController,
                            title: 'Nama Supplier',
                            hintText: 'Nama Supplier',
                            filled: true,
                            filledColor: AppColors.white,
                          ),
                          16.0.height,
                          Row(
                            children: [
                              Expanded(
                                child: InputPrimary(
                                  controller: stockController,
                                  title: 'Stok',
                                  hintText: 'Stok',
                                  filled: true,
                                  filledColor: AppColors.white,
                                ),
                              ),
                              8.0.width,
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => _selectItem(
                                    context,
                                    categoryList,
                                    'Pilih Kategori',
                                    (selectedItem) {
                                      selectedCategory =
                                          selectedItem.categoryId;
                                      categoryController.text =
                                          '${selectedItem.categoryName}';
                                    },
                                  ),
                                  child: AbsorbPointer(
                                    child: InputPrimary(
                                      controller: categoryController,
                                      filled: true,
                                      filledColor: AppColors.white,
                                      title: 'Kategori Produk',
                                      hintText: 'Kategori Produk',
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          16.0.height,
                          Row(
                            children: [
                              Expanded(
                                child: InputPrimary(
                                  controller: weightController,
                                  title: 'Berat',
                                  hintText: 'Berat',
                                  filled: true,
                                  filledColor: AppColors.white,
                                ),
                              ),
                              8.0.width,
                              Expanded(
                                child: InputPrimary(
                                  controller: priceController,
                                  title: 'Harga',
                                  hintText: 'Harga',
                                  filled: true,
                                  filledColor: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          100.0.height
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CardGeneral(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.r),
                        topRight: Radius.circular(18.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    child: ButtonPrimary(
                      title: isUpdateMode ? 'Ubah' : 'Simpan',
                      onPressed: () {
                        final request = StoreProductRequest(
                          id: generateProductId(),
                          categoryId: selectedCategory,
                          categoryName: categoryController.text,
                          name: nameController.text,
                          description: descriptionController.text,
                          sku: skuController.text,
                          supplierName: supplierNameController.text,
                          stock: int.tryParse(stockController.text),
                          unit: unitController.text,
                          weight: double.tryParse(weightController.text),
                          price: double.tryParse(priceController.text),
                          image: isUpdateMode
                              ? widget.product?.image
                              : 'https://www.its.ac.id/tmesin/wp-content/uploads/sites/22/2022/07/no-image.png',
                        );
                        if (isUpdateMode) {
                          buildContext
                              .read<UpdateProductCubit>()
                              .updateProduct('${widget.product?.id}', request);
                        } else {
                          buildContext
                              .read<StoreProductCubit>()
                              .storeProduct(request);
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
        ));
  }

  Widget _buildImageSection(
    XFile? image,
    String labelText,
    String? imageUrl,
    VoidCallback onTap,
  ) {
    return Stack(
      children: [
        // Jika ada gambar dari file (_image) atau URL (widget.pen?.photo)
        image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.file(
                  File(image.path),
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : (imageUrl != null && imageUrl.isNotEmpty)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      imageUrl,
                      height: 200.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : InkWell(
                    onTap: onTap,
                    child: CardDashed(
                      width: double.infinity,
                      height: 127.h,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.file_upload_outlined,
                                color: AppColors.grey2, size: 46.w),
                            Text(labelText,
                                style: TextStyles.medium12
                                    .copyWith(color: AppColors.grey2))
                          ],
                        ),
                      ),
                    ),
                  ),
        if (image != null || imageUrl != null)
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 20,
                child: Icon(Icons.edit, color: Colors.white, size: 20),
              ),
            ),
          ),
      ],
    );
  }
}
