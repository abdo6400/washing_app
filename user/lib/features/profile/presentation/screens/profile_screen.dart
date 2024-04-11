import 'package:car_washing/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/default_components/default_appbar.dart';
import '../components/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 249, 1),
        appBar: DefaultAppBar(
            addLang: false,
            appBarText: AppStrings.profile,
            addLeadingButton: true),
        body: Profilebody());
  }
}
