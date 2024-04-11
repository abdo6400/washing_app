import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../app/service_locator.dart';
import '../../../config/database/cache/cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit()
      : super( ChangeLocaleState(Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final currentLangCode = sl<CacheHelper>().getCachedLanguage();
    emit(ChangeLocaleState(Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await sl<CacheHelper>().cacheLanguage(langCode);
    currentLangCode = langCode;

    emit(ChangeLocaleState(Locale(currentLangCode)));
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);
  void toArabic() => _changeLang(AppStrings.arabicCode);
}
