import 'package:flutter/material.dart';

import '../../../../core/components/default_components/default_appbar.dart';
import '../../../../core/utils/app_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
        appBar: const DefaultAppBar(
            addLang: false,
            appBarText: AppStrings.settings,
            addLeadingButton: true),
        body: Container());
  }
}
