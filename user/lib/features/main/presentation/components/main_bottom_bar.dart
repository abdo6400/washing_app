import 'package:car_washing/core/utils/app_colors.dart';
import 'package:car_washing/core/utils/app_images.dart';
import 'package:car_washing/features/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_values.dart';

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValues.screenHeight * 0.13,
      child: CustomPaint(
        size: Size(
            AppValues.screenWidth, (AppValues.screenHeight * 0.1).toDouble()),
        painter: _RPSCustomPainter(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 30,
              vertical: AppValues.paddingHeight * 30),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
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
                    icon: AppImages.favorite,
                  ),
                ],
              ),
              Row(
                children: [
                  const _BottomBarButton(
                    page: 3,
                    icon: AppImages.notification,
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 40,
                  ),
                  const _BottomBarButton(
                    page: 4,
                    icon: AppImages.profile,
                  ),
                ],
              )
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

class _RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3244320, size.height * 0.2433628);
    path_0.cubicTo(
        size.width * 0.1781040,
        size.height * 0.2539823,
        size.width * 0.04717413,
        size.height * 0.1268434,
        0,
        size.height * 0.06194690);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.06194690);
    path_0.cubicTo(
        size.width * 0.9279040,
        size.height * 0.2345133,
        size.width * 0.7383173,
        size.height * 0.2389381,
        size.width * 0.6809067,
        size.height * 0.2389381);
    path_0.cubicTo(
        size.width * 0.6234987,
        size.height * 0.2389381,
        size.width * 0.6128160,
        size.height * 0.2654867,
        size.width * 0.6128160,
        size.height * 0.3407080);
    path_0.cubicTo(
        size.width * 0.6128160,
        size.height * 0.4159292,
        size.width * 0.6250267,
        size.height * 0.6210478,
        size.width * 0.5540720,
        size.height * 0.6504425);
    path_0.cubicTo(
        size.width * 0.4152213,
        size.height * 0.7079646,
        size.width * 0.3881067,
        size.height * 0.5530973,
        size.width * 0.3858480,
        size.height * 0.4557522);
    path_0.cubicTo(
        size.width * 0.3831787,
        size.height * 0.3407080,
        size.width * 0.3898533,
        size.height * 0.2433628,
        size.width * 0.3244320,
        size.height * 0.2433628);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white;

    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
