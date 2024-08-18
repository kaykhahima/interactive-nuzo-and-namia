import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// App theme class to provide light and dark themes for the app.
class AppTheme {
  static ThemeData theme = lightAppTheme;
  static ThemeData darkTheme = darkAppTheme;
}

/// Light theme for the app.
final ThemeData lightAppTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xffa1b140),
    primaryContainer: Color(0xffddea8c),
    secondary: Color(0xff5d6145),
    secondaryContainer: Color(0xffe2e5c2),
    tertiary: Color(0xff3b665b),
    tertiaryContainer: Color(0xffbdecde),
    appBarColor: Color(0xffe2e5c2),
    error: Color(0xffb00020),
  ),
  appBarStyle: FlexAppBarStyle.primary,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    defaultRadius: 12.0,
    inputDecoratorUnfocusedBorderIsColored: false,
    fabSchemeColor: SchemeColor.primary,
    chipSelectedSchemeColor: SchemeColor.primary,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.outline,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationBarUnselectedIconSchemeColor: SchemeColor.outline,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorOpacity: 1.00,
  ),
  keyColors: const FlexKeyColors(
    keepPrimary: true,
    keepSecondary: true,
    keepTertiary: true,
    keepPrimaryContainer: true,
    keepSecondaryContainer: true,
    keepTertiaryContainer: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // fontFamily: GoogleFonts.montserrat().fontFamily,
);

/// Dark theme for the app.
final ThemeData darkAppTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xffa1b140),
    primaryContainer: Color(0xff424b00),
    secondary: Color(0xffc6c9a7),
    secondaryContainer: Color(0xff45492f),
    tertiary: Color(0xffa2d0c2),
    tertiaryContainer: Color(0xff224e44),
    appBarColor: Color(0xff45492f),
    error: Color(0xffcf6679),
  ),
  tabBarStyle: FlexTabBarStyle.forAppBar,
  darkIsTrueBlack: true,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
    defaultRadius: 12.0,
    inputDecoratorBackgroundAlpha: 0,
    inputDecoratorUnfocusedBorderIsColored: false,
    fabSchemeColor: SchemeColor.primary,
    chipSelectedSchemeColor: SchemeColor.primary,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.outline,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationBarUnselectedIconSchemeColor: SchemeColor.outline,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorOpacity: 1.00,
  ),
  keyColors: const FlexKeyColors(
    keepPrimary: true,
    keepSecondary: true,
    keepTertiary: true,
    keepPrimaryContainer: true,
    keepSecondaryContainer: true,
    keepTertiaryContainer: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // fontFamily: GoogleFonts.montserrat().fontFamily,
);
