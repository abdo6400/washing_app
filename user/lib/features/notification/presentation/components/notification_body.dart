import 'package:car_washing/core/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../components/notification_card.dart';

class Notificationbody extends StatelessWidget {
  const Notificationbody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 15),
      children: [NotificationCard()],
    );
  }
}
