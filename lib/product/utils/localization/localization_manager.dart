import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// [LocalizationManager] sınıfı, uygulama içerisinde kullanılacak olan dil paketlerini yönetir.
/// [LocalizationManager] sınıfı, [EasyLocalization] sınıfından türetilir.
/// Bu sınıfın amacı localization paketini bir yerden yönetmek
/// ve kullanımın yapıldığı yerde ki kod karmaşasını azaltmaktır.
final class LocalizationManager extends EasyLocalization {
  /// [LocalizationManager] sınıfının yapıcı metodu.
  /// [child] parametresi ile translation işlemlerinin yapılacağı widget sarılır.
  /// [super] ile [EasyLocalization] sınıfının yapıcı metodu çağrılır.
  /// buraya [supportedLocales], [saveLocale], [startLocale], [path] parametreleri verilir.
  /// bunlar [EasyLocalization] sınıfının yapıcı metoduna verilmesi gereken parametrelerdir.
  /// [supportedLocales] parametresi ile desteklenen diller verilir.
  /// [saveLocale] parametresi ile dilin kaydedilip kaydedilmeyeceği belirtilir.
  /// [startLocale] parametresi ile başlangıç dilini belirtilir.
  /// [path] parametresi ile dil paketlerinin bulunduğu klasör belirtilir.
  LocalizationManager({required super.child, super.key})
      : super(
          supportedLocales: _supportedLocales,
          saveLocale: true,
          startLocale: Language.en.locale,
          path: _path,
        );

  /// [path] değişkeni, dil paketlerinin bulunduğu klasörün adını içerir.
  /// bu değişken, [EasyLocalization] sınıfının yapıcı metoduna verilmesi gereken parametrelerden biridir.
  /// bu değişken değiştirilmemelidir, bu yüzden const olarak tanımlanmıştır.
  static const String _path = 'assets/translations';

  /// [init] metodu, uygulama başlatıldığında çalıştırılması gereken metoddur.
  /// bu metot, [EasyLocalization] sınıfının [ensureInitialized] metodunu çalıştırır.
  /// bu metot, dil paketlerinin yüklenmesi için kullanılır.
  static Future<void> init() async {
    await EasyLocalization.ensureInitialized();
  }

  /// [supportedLocales] değişkeni, uygulama içerisinde kullanılacak olan dilleri içerir.
  /// bu değişken, [EasyLocalization] sınıfının yapıcı metoduna verilmesi gereken parametrelerden biridir.
  /// bu değişken değiştirilmemelidir, bu yüzden final olarak tanımlanmıştır.
  static final List<Locale> _supportedLocales = [
    Language.en.locale,
  ];
}

/// [Language] enum, uygulama içerisinde kullanılacak olan dilleri yönetir.
/// her dil için bir [Locale] nesnesi oluşturulur.
/// [Locale] nesnesi, dilin kodu ve ülke kodunu içerir.
/// Yazım hataları olmaması için [Locale] nesneleri [Language] enum sınıfı içerisinde oluşturulur.
enum Language {
  en(Locale('en', 'US')),
  ;

  const Language(this.locale);
  final Locale locale;
}
