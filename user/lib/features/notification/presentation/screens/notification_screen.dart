import 'package:car_washing/features/notification/presentation/components/notification_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/default_components/default_appbar.dart';
import '../../../../core/utils/app_strings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 249, 1),
        appBar: DefaultAppBar(
            addLang: false,
            appBarText: AppStrings.notifications,
            addLeadingButton: true),
        body: Notificationbody());
  }
}
