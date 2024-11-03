import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278190080),
      surfaceTint: Color(4285225569),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281344553),
      onPrimaryContainer: Color(4290882740),
      secondary: Color(4284832863),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293977063),
      onSecondaryContainer: Color(4283451467),
      tertiary: Color(4278190080),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280755741),
      onTertiaryContainer: Color(4290032037),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294899960),
      onSurface: Color(4280097564),
      onSurfaceVariant: Color(4283254088),
      outline: Color(4286542968),
      outlineVariant: Color(4291871687),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281479216),
      inversePrimary: Color(4292329930),
      primaryFixed: Color(4294237414),
      onPrimaryFixed: Color(4280621086),
      primaryFixedDim: Color(4292329930),
      onPrimaryFixedVariant: Color(4283581002),
      secondaryFixed: Color(4293713891),
      onSecondaryFixed: Color(4280293917),
      secondaryFixedDim: Color(4291871687),
      onSecondaryFixedVariant: Color(4283254088),
      tertiaryFixed: Color(4293321685),
      onTertiaryFixed: Color(4280032276),
      tertiaryFixedDim: Color(4291413945),
      onTertiaryFixedVariant: Color(4282926909),
      surfaceDim: Color(4292794841),
      surfaceBright: Color(4294899960),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505202),
      surfaceContainer: Color(4294110445),
      surfaceContainerHigh: Color(4293781479),
      surfaceContainerHighest: Color(4293386721),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278190080),
      surfaceTint: Color(4285225569),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281344553),
      onPrimaryContainer: Color(4293842656),
      secondary: Color(4282990916),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286345845),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278190080),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280755741),
      onTertiaryContainer: Color(4292926927),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294899960),
      onSurface: Color(4280097564),
      onSurfaceVariant: Color(4282990916),
      outline: Color(4284898656),
      outlineVariant: Color(4286740604),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281479216),
      inversePrimary: Color(4292329930),
      primaryFixed: Color(4286738552),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4285028191),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286345845),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284701277),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285953385),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284374098),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794841),
      surfaceBright: Color(4294899960),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505202),
      surfaceContainer: Color(4294110445),
      surfaceContainerHigh: Color(4293781479),
      surfaceContainerHighest: Color(4293386721),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278190080),
      surfaceTint: Color(4285225569),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281344553),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280754211),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282990916),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278190080),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280755741),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294899960),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280885797),
      outline: Color(4282990916),
      outlineVariant: Color(4282990916),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281479216),
      inversePrimary: Color(4294895343),
      primaryFixed: Color(4283317830),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281805104),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282990916),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281477934),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282663737),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281216292),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794841),
      surfaceBright: Color(4294899960),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505202),
      surfaceContainer: Color(4294110445),
      surfaceContainerHigh: Color(4293781479),
      surfaceContainerHighest: Color(4293386721),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292329930),
      surfaceTint: Color(4292329930),
      onPrimary: Color(4282068019),
      primaryContainer: Color(4278255616),
      onPrimaryContainer: Color(4289040793),
      secondary: Color(4291871687),
      onSecondary: Color(4281740849),
      secondaryContainer: Color(4282793537),
      onSecondaryContainer: Color(4292793045),
      tertiary: Color(4291413945),
      onTertiary: Color(4281413928),
      tertiaryContainer: Color(4278190080),
      onTertiaryContainer: Color(4288190090),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279571219),
      onSurface: Color(4293386721),
      onSurfaceVariant: Color(4291871687),
      outline: Color(4288253586),
      outlineVariant: Color(4283254088),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386721),
      inversePrimary: Color(4285225569),
      primaryFixed: Color(4294237414),
      onPrimaryFixed: Color(4280621086),
      primaryFixedDim: Color(4292329930),
      onPrimaryFixedVariant: Color(4283581002),
      secondaryFixed: Color(4293713891),
      onSecondaryFixed: Color(4280293917),
      secondaryFixedDim: Color(4291871687),
      onSecondaryFixedVariant: Color(4283254088),
      tertiaryFixed: Color(4293321685),
      onTertiaryFixed: Color(4280032276),
      tertiaryFixedDim: Color(4291413945),
      onTertiaryFixedVariant: Color(4282926909),
      surfaceDim: Color(4279571219),
      surfaceBright: Color(4282071097),
      surfaceContainerLowest: Color(4279176718),
      surfaceContainerLow: Color(4280097564),
      surfaceContainer: Color(4280360736),
      surfaceContainerHigh: Color(4281084202),
      surfaceContainerHighest: Color(4281807925),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292593102),
      surfaceTint: Color(4292329930),
      onPrimary: Color(4280226585),
      primaryContainer: Color(4288646036),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292135115),
      onSecondary: Color(4279964951),
      secondaryContainer: Color(4288253585),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4291742654),
      onTertiary: Color(4279703311),
      tertiaryContainer: Color(4287861125),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279571219),
      onSurface: Color(4294965753),
      onSurfaceVariant: Color(4292135115),
      outline: Color(4289437860),
      outlineVariant: Color(4287332484),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386721),
      inversePrimary: Color(4283712587),
      primaryFixed: Color(4294237414),
      onPrimaryFixed: Color(4279832084),
      primaryFixedDim: Color(4292329930),
      onPrimaryFixedVariant: Color(4282462777),
      secondaryFixed: Color(4293713891),
      onSecondaryFixed: Color(4279570194),
      secondaryFixedDim: Color(4291871687),
      onSecondaryFixedVariant: Color(4282135607),
      tertiaryFixed: Color(4293321685),
      onTertiaryFixed: Color(4279374346),
      tertiaryFixedDim: Color(4291413945),
      onTertiaryFixedVariant: Color(4281808685),
      surfaceDim: Color(4279571219),
      surfaceBright: Color(4282071097),
      surfaceContainerLowest: Color(4279176718),
      surfaceContainerLow: Color(4280097564),
      surfaceContainer: Color(4280360736),
      surfaceContainerHigh: Color(4281084202),
      surfaceContainerHighest: Color(4281807925),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965753),
      surfaceTint: Color(4292329930),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4292593102),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965753),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292135115),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294900717),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291742654),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279571219),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965753),
      outline: Color(4292135115),
      outlineVariant: Color(4292135115),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386721),
      inversePrimary: Color(4281607725),
      primaryFixed: Color(4294500842),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4292593102),
      onPrimaryFixedVariant: Color(4280226585),
      secondaryFixed: Color(4294042855),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292135115),
      onSecondaryFixedVariant: Color(4279964951),
      tertiaryFixed: Color(4293584857),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291742654),
      onTertiaryFixedVariant: Color(4279703311),
      surfaceDim: Color(4279571219),
      surfaceBright: Color(4282071097),
      surfaceContainerLowest: Color(4279176718),
      surfaceContainerLow: Color(4280097564),
      surfaceContainer: Color(4280360736),
      surfaceContainerHigh: Color(4281084202),
      surfaceContainerHighest: Color(4281807925),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
