import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';

class StudioImagesSection extends StatelessWidget {
  const StudioImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.network(
            "https://th.bing.com/th/id/R.33d7dac202aa07db41f1ab8f97cd70a3?rik=Qd1r%2baM1EfYCfA&pid=ImgRaw&r=0",
            width: AppValues.sizeWidth * 100,
          ),
        ],
      ),
    );
  }
}
