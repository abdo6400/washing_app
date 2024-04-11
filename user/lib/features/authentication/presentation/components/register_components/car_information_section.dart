import 'dart:io';

import 'package:awesome_select/awesome_select.dart';
import 'package:car_washing/config/database/api/end_points.dart';
import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/core/components/default_components/default_error_card.dart';
import 'package:car_washing/core/utils/app_colors.dart';
import 'package:car_washing/core/utils/app_values.dart';
import 'package:car_washing/features/authentication/domain/entities/car_types.dart';
import 'package:car_washing/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_strings.dart';

class CarInformationSection extends StatelessWidget {
  const CarInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    CarTypes? carTypes = context.watch<AuthenticationCubit>().carTypes;
    final cubit = context.watch<AuthenticationCubit>();
    return carTypes == null
        ? DefaultErrorCard(
            erroMessage: AppStrings.someThingWentWrong,
            function: () => context.read<AuthenticationCubit>().getCarTypes(),
            title: AppStrings.error,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _VchicleSection(carTypes.results.cars),
              Row(
                children: [
                  _Selecter(
                    title: AppStrings.brand,
                    items: carTypes.results.cars[cubit.vehicleTypeIndex].brands
                        .map((e) => S2Choice<String>(
                            value: e.brandName, title: e.brandName))
                        .toList(),
                    onSelect: (value) => context
                        .read<AuthenticationCubit>()
                        .changeBrandValue(value),
                    subTitle: cubit.brand ?? AppStrings.selectBrand.tr(context),
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 10,
                  ),
                  _Selecter(
                    title: AppStrings.model,
                    items: carTypes.results.cars[cubit.vehicleTypeIndex].brands
                        .firstWhere((element) =>
                            element.brandName ==
                            (cubit.brand ?? element.brandName))
                        .models
                        .map((e) => S2Choice<String>(value: e, title: e))
                        .toList(),
                    onSelect: (value) => context
                        .read<AuthenticationCubit>()
                        .changeModelValue(value),
                    subTitle: cubit.model ?? AppStrings.selectModel.tr(context),
                  ),
                ],
              ),
              SizedBox(
                height: AppValues.sizeHeight * 20,
              ),
              Row(
                children: [
                  _CarPlateInput(
                    title: AppStrings.carPlate,
                    subTitle: " g h k | 123",
                    controller: context.read<AuthenticationCubit>().carPlate,
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 10,
                  ),
                  _Selecter(
                    title: AppStrings.carColor,
                    onSelect: () async {
                      Color color = await showColorPickerDialog(
                          context, AppColors.green,
                          pickersEnabled: {
                            ColorPickerType.both: true,
                            ColorPickerType.primary: true,
                            ColorPickerType.accent: true,
                            ColorPickerType.bw: true,
                            ColorPickerType.custom: true,
                            ColorPickerType.wheel: true
                          },
                          colorCodeHasColor: true,
                          actionButtons: const ColorPickerActionButtons(
                              dialogOkButtonType:
                                  ColorPickerActionButtonType.outlined,
                              dialogCancelButtonType:
                                  ColorPickerActionButtonType.outlined));
                      // ignore: use_build_context_synchronously
                      context
                          .read<AuthenticationCubit>()
                          .changeColorValue(color);
                    },
                    subTitle:
                        cubit.carColor ?? AppStrings.selectColor.tr(context),
                  ),
                ],
              ),
              SizedBox(
                height: AppValues.sizeHeight * 40,
              ),
              const _CarImageButton(),
              SizedBox(
                height: AppValues.sizeHeight * 30,
              ),
            ],
          );
  }
}

class _VchicleSection extends StatelessWidget {
  final List<Car> cars;
  const _VchicleSection(this.cars);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.vehicleType.tr(context),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 17,
                fontWeight: FontWeight.w700,
                letterSpacing: AppValues.sizeWidth * 2,
              ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
        SizedBox(
          height: AppValues.sizeHeight * 85,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding:
                  EdgeInsets.symmetric(vertical: AppValues.paddingHeight * 5),
              itemBuilder: (context, index) {
                return _VehicleTypeCard(cars[index].logo, index);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: AppValues.sizeWidth * 20,
                );
              },
              itemCount: cars.length),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
      ],
    );
  }
}

class _VehicleTypeCard extends StatelessWidget {
  final String image;
  final int index;
  const _VehicleTypeCard(this.image, this.index);

  @override
  Widget build(BuildContext context) {
    final bool isSelected =
        context.watch<AuthenticationCubit>().vehicleTypeIndex == index;
    return GestureDetector(
      onTap: () =>
          context.read<AuthenticationCubit>().changeVehicleIndex(index),
      child: Card(
        margin: EdgeInsets.zero,
        color: isSelected ? AppColors.lightPrimary : AppColors.white,
        shadowColor: AppColors.black,
        elevation: 0.5,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.sizeWidth * 8,
              vertical: AppValues.sizeHeight * 10),
          child: Image.network(
            EndPoints.images + image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class _Selecter extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<S2Choice<String>>? items;
  final Function onSelect;
  const _Selecter(
      {required this.title,
      this.items,
      required this.onSelect,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.tr(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: AppValues.sizeWidth * 2,
                ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 10,
          ),
          items == null
              ? GestureDetector(
                  onTap: () => onSelect(),
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    color: AppColors.greySoft2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppValues.paddingWidth * 10,
                          vertical: AppValues.paddingHeight * 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppColors.grey.withOpacity(0.7)),
                          ),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                )
              : SmartSelect<String?>.single(
                  selectedValue: subTitle,
                  choiceItems: items,
                  modalTitle: title.tr(context),
                  modalType: S2ModalType.bottomSheet,
                  choiceType: S2ChoiceType.chips,
                  choiceGrouped: false,
                  choiceDirection: Axis.vertical,
                  onChange: (selected) => onSelect(selected.value),
                  tileBuilder: (context, state) => GestureDetector(
                    onTap: () => state.showModal(),
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      color: AppColors.greySoft2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppValues.paddingWidth * 10,
                            vertical: AppValues.paddingHeight * 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              subTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: AppColors.grey.withOpacity(0.7)),
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class _CarPlateInput extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextEditingController controller;
  const _CarPlateInput(
      {required this.title, required this.subTitle, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.tr(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: AppValues.sizeWidth * 2,
                ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 10,
          ),
          Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: AppColors.greySoft2,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 10,
                      vertical: AppValues.paddingHeight * 5),
                  child: TextField(
                    scrollPadding: EdgeInsets.zero,
                    controller: controller,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.greyBarel),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: subTitle,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.grey.withOpacity(0.7)),
                    ),
                  ))),
        ],
      ),
    );
  }
}

class _CarImageButton extends StatelessWidget {
  const _CarImageButton();

  @override
  Widget build(BuildContext context) {
    final images = context.watch<AuthenticationCubit>().images;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 50,
          width: images.isEmpty ? 0 : AppValues.sizeWidth * 50,
          child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) => Image.file(
                    File(images[index].path),
                    height: AppValues.sizeHeight * 50,
                    width: AppValues.sizeWidth * 50,
                  )),
        ),
        GestureDetector(
          onTap: () => context.read<AuthenticationCubit>().addImage(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: AppValues.font * 35,
                  ),
                  Positioned(
                    bottom: AppValues.sizeHeight,
                    right: -AppValues.sizeWidth * 5,
                    child: GestureDetector(
                      child: CircleAvatar(
                          radius: AppValues.radius * 8,
                          backgroundColor: AppColors.black,
                          child: Icon(
                            Icons.arrow_upward,
                            color: AppColors.white,
                            size: AppValues.font * 8,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: AppValues.sizeWidth * 10,
              ),
              Text(
                AppStrings.uploadYourCarImages.tr(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 18,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
