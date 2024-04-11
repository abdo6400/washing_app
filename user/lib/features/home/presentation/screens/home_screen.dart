import 'package:flutter/material.dart';

import '../../../../core/components/app_components/custom_search_bar.dart';
import '../../../../core/utils/app_values.dart';
import '../components/category_section.dart';
import '../components/offers_card.dart';
import '../components/popular_studios_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValues.screenHeight,
      width: AppValues.screenWidth,
      child: Column(
        children: [
          CustomSearchBar(
            function: () {},
          ),
          SizedBox(
            height: AppValues.sizeHeight * 10,
          ),
          const OffersCard(),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          const CategorySection(),
          const PopularStudiosSection()
        ],
      ),
    );
  }
}
