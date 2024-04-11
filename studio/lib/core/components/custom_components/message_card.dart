
import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';


class MessageCard extends StatelessWidget {
  final String sign;
  final String title;
  final String subTitle;
  const MessageCard(
      {super.key,
      required this.sign,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
        //  radius: (AppSize.s40 + 4).r,
          backgroundColor: AppColors.lightPrimary.withOpacity(0.3),
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
          //  radius: (AppSize.s40 - 6).r,
            child: Text(
              sign,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.white),
            ),
          ),
        ),
        SizedBox(
      //    height: AppSize.s28.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            children: [
              Text(
                title.tr(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                 //   fontSize: AppSize.s24.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueDarK),
              ),
              SizedBox(
              //  height: AppSize.s20.h,
              ),
              Text(
                subTitle.tr(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  //  fontSize: AppSize.s12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyMedi),
              ),
            ],
          ),
        )
      ],
    );
  }
}
