import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import '/core/utils/app_colors.dart';
import '/core/utils/app_images.dart';

class DefaultCachedNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconSize;
  final double? padding;
  final String imageUrl;
  final BoxFit? fit;

  const DefaultCachedNetworkImage(
      {Key? key,
      this.height,
      required this.imageUrl,
      this.width,
      required this.fit,
      this.iconSize,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != ''
        ? CachedNetworkImage(
            fit: fit,
            width: width,
            height: height,
            imageUrl: imageUrl,
            // progressIndicatorBuilder: (context, url, downloadProgress) {
            //   return Padding(
            //     padding: EdgeInsets.all(padding ?? 50.sp),
            //     child: Center(
            //         child: DefaultLoadingIndicator(
            //       value: downloadProgress.downloaded.toDouble(),
            //     )),
            //   );
            // },

            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Padding(
                padding: EdgeInsets.all(padding ?? 35.sp),
                child: Image.asset(
                  AppImages.appLogo,
                  height: iconSize ?? 75.sp,
                  color: AppColors.primary,
                )),
          )
        : Padding(
            padding: EdgeInsets.all(padding ?? 35.sp),
            child: Image.asset(
              AppImages.appLogo,
              height: iconSize ?? 75.sp,
              color: AppColors.primary,
            ),
          );
  }
}

class DefaultImageFile extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconSize;
  final double? padding;
  final XFile? imageFile;
  final BoxFit? fit;
  final String? imageUrl;

  const DefaultImageFile({
    Key? key,
    this.height,
    required this.imageFile,
    this.width,
    required this.fit,
    this.iconSize,
    this.padding,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return Image.network(
        imageUrl!,
        fit: fit,
        width: width,
        height: height,
      );
    } else if (imageFile != null) {
      return Image.file(
        File(imageFile!.path),
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(padding ?? 35.sp),
        child: Image.asset(
          AppImages.appLogo,
          height: iconSize ?? 75.sp,
          color: AppColors.primary,
        ),
      );
    }

    // return imageFile != null
    //     ? Image.file(
    //         File(imageFile!.path),
    //         fit: fit,
    //         width: width,
    //         height: height,
    //       )
    //     : Padding(
    //         padding: EdgeInsets.all(padding ?? 35.sp),
    //         child: Image.asset(
    //           AppImages.lock,
    //           height: iconSize ?? 75.sp,
    //           color: darkOrLightColor(AppColors.primary, AppColors.darkGrey),
    //         ),
    //       );
  }
}
