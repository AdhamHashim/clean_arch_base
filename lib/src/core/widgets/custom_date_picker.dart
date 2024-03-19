import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/language/languages.dart';
import '../navigation/navigator.dart';
import '../res/color_manager.dart';

Future<DateTime?> showCustomDatePicker(
    {required TextEditingController controller, String? dateFormat}) async {
  DateTime? pickedDate = await showDatePicker(
    locale: Languages.currentLanguage!.locale,
    context: Go.navigatorKey.currentContext!,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    lastDate: DateTime.now(),
    // lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
              primary: ColorManager.primary, // <-- SEE HERE
              onPrimary: ColorManager.white, // <-- SEE HERE
              onSurface: ColorManager.primary),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: ColorManager.primary, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  if (pickedDate != null) {
    String formattedDate = DateFormat(dateFormat ?? 'EEE, M/d/y',
            Languages.currentLanguage!.locale.languageCode)
        .format(pickedDate); // use your desired date format
    controller.text = formattedDate;
  }
  return pickedDate;
}
