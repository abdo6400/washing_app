import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_values.dart';
import '../cubit/main_cubit.dart';

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValues.screenHeight * 0.08,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 100),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppValues.radius * 20),
                topRight: Radius.circular(AppValues.radius * 20))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 30,
              vertical: AppValues.paddingHeight * 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _BottomBarButton(
                page: 0,
                icon: AppImages.home,
              ),
              SizedBox(
                width: AppValues.sizeWidth * 40,
              ),
              const _BottomBarButton(
                page: 1,
                icon: AppImages.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBarButton extends StatelessWidget {
  final int page;
  final String icon;
  const _BottomBarButton({required this.page, required this.icon});

  @override
  Widget build(BuildContext context) {
    final bool isSelected = context.watch<MainCubit>().page == page;
    return GestureDetector(
        onTap: () => context.read<MainCubit>().changePage(page),
        child: Image.asset(
          icon,
          color: isSelected
              ? AppColors.primary
              : const Color.fromRGBO(112, 123, 129, 1),
        ));
  }
}
