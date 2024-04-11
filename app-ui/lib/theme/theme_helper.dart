import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer.withOpacity(1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.h),
          ),
          shadowColor: appTheme.indigoA1004c,
          elevation: 10,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.black90001,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray50001,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray800,
          fontSize: 16.fSize,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 13.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray60005,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.lightBlue400,
          fontSize: 48.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.purple500,
          fontSize: 32.fSize,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 24.fSize,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.deepPurple60001,
          fontSize: 13.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 10.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 20.fSize,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.gray60003,
          fontSize: 18.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray60003,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF9DCEFF),
    primaryContainer: Color(0XFFFF0404),
    secondaryContainer: Color(0XFF84DE8D),

    // Error colors
    errorContainer: Color(0XFF657FDA),
    onError: Color(0XFFFFBCA4),
    onErrorContainer: Color(0XFF090F47),

    // On colors(text colors)
    onPrimary: Color(0XFF202325),
    onPrimaryContainer: Color(0X19FFFFFF),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber300 => Color(0XFFFBD157);
  Color get amber600 => Color(0XFFFFB700);
  Color get amberA700 => Color(0XFFFFA904);
  Color get amberA70001 => Color(0XFFFCA70D);

  // Black
  Color get black900 => Color(0XFF090A0A);
  Color get black90001 => Color(0XFF000000);

  // Blue
  Color get blue200 => Color(0XFF92C9EE);
  Color get blue300 => Color(0XFF5DBBFF);
  Color get blue30001 => Color(0XFF7ABDE2);
  Color get blue400 => Color(0XFF4BA1F0);
  Color get blue700 => Color(0XFF006BE5);
  Color get blueA100 => Color(0XFF7BAEE1);
  Color get blueA200 => Color(0XFF5589F4);
  Color get blueA20001 => Color(0XFF458EFF);

  // BlueGraye
  Color get blueGray1007e => Color(0X7ED6D8E5);

  // BlueGray
  Color get blueGray200 => Color(0XFFADB3BC);
  Color get blueGray400 => Color(0XFF878C9F);
  Color get blueGray50 => Color(0XFFEFF1F5);
  Color get blueGray600 => Color(0XFF616E84);
  Color get blueGray700 => Color(0XFF50555C);
  Color get blueGray800 => Color(0XFF492E64);
  Color get blueGray900 => Color(0XFF2A0845);
  Color get blueGray90001 => Color(0XFF333333);
  Color get blueGray90002 => Color(0XFF303437);
  Color get blueGray90003 => Color(0XFF2D1937);

  // Cyan
  Color get cyan400 => Color(0XFF37B9C5);
  Color get cyan40001 => Color(0XFF36C9EA);
  Color get cyan90099 => Color(0X99004C66);

  // DeepOrange
  Color get deepOrange200 => Color(0XFFF7AF90);
  Color get deepOrange400 => Color(0XFFFA894A);

  // DeepPurple
  Color get deepPurple200 => Color(0XFFAD89E7);
  Color get deepPurple300 => Color(0XFF9D78D5);
  Color get deepPurple400 => Color(0XFF8059C5);
  Color get deepPurple600 => Color(0XFF6441A5);
  Color get deepPurple60001 => Color(0XFF613FA0);
  Color get deepPurple700 => Color(0XFF55378D);
  Color get deepPurpleA100 => Color(0XFFC58BF2);
  Color get deepPurpleA400 => Color(0XFF6525EE);

  // Gray
  Color get gray100 => Color(0XFFF5F4F6);
  Color get gray10001 => Color(0XFFF2F3F4);
  Color get gray10002 => Color(0XFFF3F3F3);
  Color get gray10003 => Color(0XFFF4F4F4);
  Color get gray10004 => Color(0XFFF1F3FA);
  Color get gray10005 => Color(0XFFEFF3FF);
  Color get gray10006 => Color(0XFFF0F2F6);
  Color get gray10007 => Color(0XFFF2F2F2);
  Color get gray200 => Color(0XFFE7E7E7);
  Color get gray300 => Color(0XFFDADADA);
  Color get gray30001 => Color(0XFFE6E6E6);
  Color get gray30002 => Color(0XFFE3E4E5);
  Color get gray400 => Color(0XFFC4C4C4);
  Color get gray50 => Color(0XFFF7F8F8);
  Color get gray500 => Color(0XFF9E9E9E);
  Color get gray50001 => Color(0XFFACA3A5);
  Color get gray50002 => Color(0XFFA09BA2);
  Color get gray50003 => Color(0XFF979C9E);
  Color get gray5001 => Color(0XFFF2F8FF);
  Color get gray600 => Color(0XFF808080);
  Color get gray60001 => Color(0XFF72777A);
  Color get gray60002 => Color(0XFF7C7381);
  Color get gray60003 => Color(0XFF776D6D);
  Color get gray60004 => Color(0XFF7E7B7B);
  Color get gray60005 => Color(0XFF7B6F72);
  Color get gray700 => Color(0XFF6C6868);
  Color get gray70001 => Color(0XFF5F696E);
  Color get gray70002 => Color(0XFF666666);
  Color get gray800 => Color(0XFF48434B);
  Color get gray80001 => Color(0XFF724539);
  Color get gray900 => Color(0XFF2B252C);
  Color get gray90001 => Color(0XFF111111);
  Color get gray90002 => Color(0XFF1D1517);
  Color get gray90003 => Color(0XFF2A2A2A);
  Color get gray90004 => Color(0XFF1E1C1C);
  Color get gray90005 => Color(0XFF1B141F);
  Color get gray90011 => Color(0X111D1617);

  // Grayf
  Color get gray503f => Color(0X3FFBFBFB);

  // Green
  Color get green300 => Color(0XFF7CDE86);
  Color get green500 => Color(0XFF43C12E);
  Color get green50001 => Color(0XFF41D641);
  Color get green800 => Color(0XFF1E8334);

  // Indigo
  Color get indigoA100 => Color(0XFF92A3FD);

  // IndigoAc
  Color get indigoA1004c => Color(0X4C95ADFE);

  // LightBlue
  Color get lightBlue100 => Color(0XFFB6E4FF);
  Color get lightBlue400 => Color(0XFF1BB0E3);
  Color get lightBlue40001 => Color(0XFF12BEF6);
  Color get lightBlue800 => Color(0XFF1C7EA8);
  Color get lightBlueA700 => Color(0XFF0070F0);

  // Lime
  Color get lime900 => Color(0XFFA05A3C);

  // Orange
  Color get orange200 => Color(0XFFE8BF89);
  Color get orange900 => Color(0XFFD05904);
  Color get orangeA700 => Color(0XFFFF6D04);

  // Pink
  Color get pink100 => Color(0XFFEEA4CE);
  Color get pink800 => Color(0XFF984A4A);

  // Purple
  Color get purple300 => Color(0XFFB26AEA);
  Color get purple50 => Color(0XFFF0E5F1);
  Color get purple500 => Color(0XFFA32EC1);
  Color get purple5001 => Color(0XFFFBEBFF);

  // Red
  Color get red100 => Color(0XFFF6CFCF);
  Color get red300 => Color(0XFFCA9671);
  Color get red30001 => Color(0XFFAF5F83);
  Color get red500 => Color(0XFFF93838);
  Color get red600 => Color(0XFFDD2E44);
  Color get redA700 => Color(0XFFFF0000);

  // Teal
  Color get teal200 => Color(0XFF93C9C7);
  Color get teal400 => Color(0XFF37AFA0);
  Color get teal900 => Color(0XFF00394C);
  Color get tealA400 => Color(0XFF29FF98);

  // WhiteAf
  Color get whiteA7003f => Color(0X3FFFFCFC);

  // Yellow
  Color get yellow700 => Color(0XFFF7B434);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();