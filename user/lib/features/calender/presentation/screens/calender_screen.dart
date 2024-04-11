import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:car_washing/core/components/default_components/default_appbar.dart';
import 'package:car_washing/core/utils/app_strings.dart';
import 'package:car_washing/core/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../components/booked_card.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
      appBar: const DefaultAppBar(
          addLang: false,
          appBarText: AppStrings.calender,
          addLeadingButton: true),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.symmetric(
                horizontal: AppValues.marginWidth * 15,
                vertical: AppValues.marginHeight * 20),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.range,
              ),
              value: [DateTime(DateTime.now().year, DateTime.now().month, 19)],
              onValueChanged: (dates) => {},
            ),
          ),
          BookedCard()
        ],
      ),
    );
  }
}
