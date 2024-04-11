import 'dart:io';

import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:car_studio/core/utils/commons.dart';
import 'package:car_studio/features/authentication/domain/entities/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/default_components/default_error_card.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../cubit/authentication_cubit.dart';

class StudioInformationSection extends StatelessWidget {
  const StudioInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.description.tr(context),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 17,
                fontWeight: FontWeight.w700,
                letterSpacing: AppValues.sizeWidth * 2,
              ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            color: AppColors.greySoft2,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 15,
                    vertical: AppValues.paddingHeight * 10),
                child: TextField(
                  scrollPadding: EdgeInsets.zero,
                  controller:
                      context.read<AuthenticationCubit>().studioDescriptiopn,
                  onTapOutside: (event) => context.closeKeyboard(),
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.grey),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintText: "",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.greyBarel),
                  ),
                ))),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        Row(
          children: [
            _Selecter(
              title: AppStrings.openTime,
              onSelect: (value) =>
                  context.read<AuthenticationCubit>().setOpenTime(value),
              value: context.watch<AuthenticationCubit>().openTime,
            ),
            SizedBox(
              width: AppValues.sizeWidth * 10,
            ),
            _Selecter(
              title: AppStrings.closeTime,
              onSelect: (value) =>
                  context.read<AuthenticationCubit>().setCloseTime(value),
              value: context.watch<AuthenticationCubit>().closeTime,
            ),
          ],
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        const _ServicesSection(),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
        const _CarWashingImageButton(),
        SizedBox(
          height: AppValues.sizeHeight * 30,
        ),
      ],
    );
  }
}

class _ServicesSection extends StatelessWidget {
  const _ServicesSection();
  @override
  Widget build(BuildContext context) {
    final Services? services = context.watch<AuthenticationCubit>().services;
    return services == null
        ? DefaultErrorCard(
            erroMessage: AppStrings.someThingWentWrong,
            height: AppValues.screenHeight / 2,
            function: () => context.read<AuthenticationCubit>().getServices(),
            title: AppStrings.error,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.services.tr(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: AppValues.sizeWidth * 2,
                    ),
              ),
              Wrap(
                spacing: AppValues.sizeWidth*10,
                runSpacing: 2,
                children: services.results.services
                    .map((e) => _Service(service: e))
                    .toList(),
              )
            ],
          );
  }
}

class _Service extends StatelessWidget {
  final Service service;
  const _Service({required this.service});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: context.read<AuthenticationCubit>().isChecked(service.id),
              checkColor: AppColors.primary,
              activeColor: AppColors.white,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.greyBarel)),
              onChanged: (checked) {
                if (checked!) {
                  context
                      .read<AuthenticationCubit>()
                      .addService(service.id, "0");
                } else {
                  context.read<AuthenticationCubit>().removeService(service.id);
                }
              },
            ),
            Text(
              service.type,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: AppValues.font * 15,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(
              width: AppValues.sizeWidth * 10,
            ),
            SizedBox(
                width: AppValues.sizeWidth * 60,
                height: AppValues.sizeHeight * 30,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  onChanged: (value) => context
                      .read<AuthenticationCubit>()
                      .updatePrice(service.id, value),
                )),
          ],
        );
      },
    );
  }
}

class _Selecter extends StatelessWidget {
  final String title;
  final TimeOfDay value;
  final Function onSelect;
  const _Selecter({
    required this.title,
    required this.onSelect,
    required this.value,
  });

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
          GestureDetector(
            onTap: () async {
              TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              onSelect(time);
            },
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
                      "${value.hour} : ${value.minute} "
                      " ${value.period.name} ",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.greyBarel),
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CarWashingImageButton extends StatelessWidget {
  const _CarWashingImageButton();

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
        Expanded(
          child: GestureDetector(
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
                Expanded(
                  child: Text(
                    AppStrings.uploadCarWashStudioImages.tr(context),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 18,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
