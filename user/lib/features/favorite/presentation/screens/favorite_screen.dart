import 'package:flutter/material.dart';
import '../../../../core/components/default_components/default_appbar.dart';
import '../../../../core/utils/app_strings.dart';
import '../components/favorite_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 249, 1),
        appBar: DefaultAppBar(
            addLang: false,
            appBarText: AppStrings.favourite,
            addLeadingButton: true),
        body: Favoritebody());
  }
}
