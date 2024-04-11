import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class StudioInformationSection extends StatelessWidget {
  const StudioInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
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
                  controller: null,
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.grey),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintText:
                        "Lorem ipsum dolor sit amet consectetur. Nibh risus urna enim orci at mauris. Maecenas urna tempus libero volutpat nunc massa eget.",
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
              title: AppStrings.brand,
              onSelect: () {},
              value: TimeOfDay.now(),
            ),
            SizedBox(
              width: AppValues.sizeWidth * 10,
            ),
            _Selecter(
              title: AppStrings.model,
              onSelect: () {},
              value: TimeOfDay.now(),
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
  static List<String> services = [
    "Polishing",
    "Tire",
    "Internal",
    "External",
    "Polishing",
    "Tire",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Services",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 17,
                fontWeight: FontWeight.w700,
                letterSpacing: AppValues.sizeWidth * 2,
              ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 200,
          child: GridView.builder(
              itemCount: services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: AppValues.sizeHeight * 50,
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemBuilder: ((context, index) => Row(
                    children: [
                      Checkbox(
                        value: true,
                        checkColor: AppColors.primary,
                        activeColor: AppColors.white,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: AppColors.greyBarel)),
                        onChanged: (checked) {},
                      ),
                      Text(
                        services[index],
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: AppValues.font * 15,
                                  fontWeight: FontWeight.w600,
                                ),
                      )
                    ],
                  ))),
        )
      ],
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
            onTap: () => showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ),
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
                      "${value.hour} :${value.minute}",
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
    return GestureDetector(
      onTap: () {},
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
    );
  }
}
