import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final void Function(String?)? onSave;
  final Function(String)? onChange;
  final Function()? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final String? label;
  final String? hint;
  final IconData? prefix;
  final IconData? suffix;
  final Function()? suffixPressed;
  final bool isClickable = true;
  final bool readOnly;
  final int maxLines;
  final double? radius;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  const DefaultTextFormField(
      {super.key,
      required this.controller,
      required this.type,
      this.onSave,
      this.onChange,
      this.onTap,
      this.validate,
      this.hint,
      this.label,
      this.prefix,
      this.suffix,
      this.readOnly = false,
      this.suffixPressed,
      this.isPassword = false,
      this.maxLines = 1,
      this.contentPadding,
      this.textColor,
      this.hintColor = AppColors.greyBarel,
      this.color,
      this.backgroundColor,
      this.radius = 16,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: margin,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!.r)),
      child: TextFormField(
        maxLines: maxLines,
        onTapOutside: (event) => context.closeKeyboard(),
        cursorColor: AppColors.primary,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onSaved: onSave,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        readOnly: readOnly,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            //  fontSize: AppSize.s16.sp,
            fontWeight: FontWeight.w400,
            color: textColor ?? AppColors.black),
        decoration: InputDecoration(
          prefixIconColor: AppColors.black,
          enabledBorder: InputBorder.none,
          contentPadding: contentPadding,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.error),
          ),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          labelText: label != null ? label!.tr(context) : null,
          labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              // fontSize: AppSize.s18.sp,
              color: textColor ?? AppColors.hintColor.withOpacity(0.6)),
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              //  fontSize: AppSize.s18.sp,
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColors.hintColor),
          hintText: hint != null
              ? AppLocalizations.of(context)!.translate(hint!) ?? hint
              : null,
          floatingLabelStyle: const TextStyle(color: AppColors.blueLight),
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                  color: textColor ?? AppColors.primary,
                )
              : null,
          suffixIcon: suffix != null
              ? GestureDetector(
                  onTap: suffixPressed,
                  child: Icon(
                    suffix,
                    color: textColor ?? AppColors.hintColor,
                    //  size: AppSize.s28.sp,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
