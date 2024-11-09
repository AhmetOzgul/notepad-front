import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff6b5a61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff302229),
      onPrimaryContainer: Color(0xffc1acb4),
      secondary: Color(0xff655c5f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff0e3e7),
      onSecondaryContainer: Color(0xff50484b),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff27261d),
      onTertiaryContainer: Color(0xffb4b1a5),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffef8f8),
      onSurface: Color(0xff1d1b1c),
      onSurfaceVariant: Color(0xff4d4548),
      outline: Color(0xff7f7478),
      outlineVariant: Color(0xffd0c3c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323030),
      inversePrimary: Color(0xffd7c1ca),
      primaryFixed: Color(0xfff4dce6),
      onPrimaryFixed: Color(0xff25181e),
      primaryFixedDim: Color(0xffd7c1ca),
      onPrimaryFixedVariant: Color(0xff52424a),
      secondaryFixed: Color(0xffecdfe3),
      onSecondaryFixed: Color(0xff201a1d),
      secondaryFixedDim: Color(0xffd0c3c7),
      onSecondaryFixedVariant: Color(0xff4d4548),
      tertiaryFixed: Color(0xffe6e3d5),
      onTertiaryFixed: Color(0xff1c1c14),
      tertiaryFixedDim: Color(0xffc9c7b9),
      onTertiaryFixedVariant: Color(0xff48473d),
      surfaceDim: Color(0xffded9d9),
      surfaceBright: Color(0xfffef8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f2f2),
      surfaceContainer: Color(0xfff2eced),
      surfaceContainerHigh: Color(0xffede7e7),
      surfaceContainerHighest: Color(0xffe7e1e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff6b5a61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff302229),
      onPrimaryContainer: Color(0xffeed6e0),
      secondary: Color(0xff494144),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7c7275),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff27261d),
      onTertiaryContainer: Color(0xffe0ddcf),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef8f8),
      onSurface: Color(0xff1d1b1c),
      onSurfaceVariant: Color(0xff494144),
      outline: Color(0xff665d60),
      outlineVariant: Color(0xff82787c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323030),
      inversePrimary: Color(0xffd7c1ca),
      primaryFixed: Color(0xff827078),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff68575f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7c7275),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff635a5d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff767569),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5e5c52),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded9d9),
      surfaceBright: Color(0xfffef8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f2f2),
      surfaceContainer: Color(0xfff2eced),
      surfaceContainerHigh: Color(0xffede7e7),
      surfaceContainerHighest: Color(0xffe7e1e1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff6b5a61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff302229),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff272023),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff494144),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff27261d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff292225),
      outline: Color(0xff494144),
      outlineVariant: Color(0xff494144),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323030),
      inversePrimary: Color(0xfffee6ef),
      primaryFixed: Color(0xff4e3e46),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff372930),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff494144),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff322b2e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff444339),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2e2d24),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded9d9),
      surfaceBright: Color(0xfffef8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f2f2),
      surfaceContainer: Color(0xfff2eced),
      surfaceContainerHigh: Color(0xffede7e7),
      surfaceContainerHighest: Color(0xffe7e1e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd7c1ca),
      surfaceTint: Color(0xffd7c1ca),
      onPrimary: Color(0xff3b2c33),
      primaryContainer: Color(0xff010000),
      onPrimaryContainer: Color(0xffa59199),
      secondary: Color(0xffd0c3c7),
      onSecondary: Color(0xff362e31),
      secondaryContainer: Color(0xff463e41),
      onSecondaryContainer: Color(0xffded2d5),
      tertiary: Color(0xffc9c7b9),
      onTertiary: Color(0xff313128),
      tertiaryContainer: Color(0xff000000),
      onTertiaryContainer: Color(0xff98968a),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff151313),
      onSurface: Color(0xffe7e1e1),
      onSurfaceVariant: Color(0xffd0c3c7),
      outline: Color(0xff998e92),
      outlineVariant: Color(0xff4d4548),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e1e1),
      inversePrimary: Color(0xff6b5a61),
      primaryFixed: Color(0xfff4dce6),
      onPrimaryFixed: Color(0xff25181e),
      primaryFixedDim: Color(0xffd7c1ca),
      onPrimaryFixedVariant: Color(0xff52424a),
      secondaryFixed: Color(0xffecdfe3),
      onSecondaryFixed: Color(0xff201a1d),
      secondaryFixedDim: Color(0xffd0c3c7),
      onSecondaryFixedVariant: Color(0xff4d4548),
      tertiaryFixed: Color(0xffe6e3d5),
      onTertiaryFixed: Color(0xff1c1c14),
      tertiaryFixedDim: Color(0xffc9c7b9),
      onTertiaryFixedVariant: Color(0xff48473d),
      surfaceDim: Color(0xff151313),
      surfaceBright: Color(0xff3b3839),
      surfaceContainerLowest: Color(0xff0f0e0e),
      surfaceContainerLow: Color(0xff1d1b1c),
      surfaceContainer: Color(0xff211f20),
      surfaceContainerHigh: Color(0xff2c292a),
      surfaceContainerHighest: Color(0xff373435),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdbc5ce),
      surfaceTint: Color(0xffd7c1ca),
      onPrimary: Color(0xff1f1319),
      primaryContainer: Color(0xff9f8b94),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd4c8cb),
      onSecondary: Color(0xff1b1517),
      secondaryContainer: Color(0xff998e91),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffcecbbe),
      onTertiary: Color(0xff17170f),
      tertiaryContainer: Color(0xff939185),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151313),
      onSurface: Color(0xfffff9f9),
      onSurfaceVariant: Color(0xffd4c8cb),
      outline: Color(0xffaba0a4),
      outlineVariant: Color(0xff8b8084),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e1e1),
      inversePrimary: Color(0xff54444b),
      primaryFixed: Color(0xfff4dce6),
      onPrimaryFixed: Color(0xff190e14),
      primaryFixedDim: Color(0xffd7c1ca),
      onPrimaryFixedVariant: Color(0xff413239),
      secondaryFixed: Color(0xffecdfe3),
      onSecondaryFixed: Color(0xff150f12),
      secondaryFixedDim: Color(0xffd0c3c7),
      onSecondaryFixedVariant: Color(0xff3c3437),
      tertiaryFixed: Color(0xffe6e3d5),
      onTertiaryFixed: Color(0xff12120a),
      tertiaryFixedDim: Color(0xffc9c7b9),
      onTertiaryFixedVariant: Color(0xff37372d),
      surfaceDim: Color(0xff151313),
      surfaceBright: Color(0xff3b3839),
      surfaceContainerLowest: Color(0xff0f0e0e),
      surfaceContainerLow: Color(0xff1d1b1c),
      surfaceContainer: Color(0xff211f20),
      surfaceContainerHigh: Color(0xff2c292a),
      surfaceContainerHighest: Color(0xff373435),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffd7c1ca),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffdbc5ce),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd4c8cb),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffefbed),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcecbbe),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffd4c8cb),
      outlineVariant: Color(0xffd4c8cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e1e1),
      inversePrimary: Color(0xff34262d),
      primaryFixed: Color(0xfff8e1ea),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffdbc5ce),
      onPrimaryFixedVariant: Color(0xff1f1319),
      secondaryFixed: Color(0xfff1e4e7),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd4c8cb),
      onSecondaryFixedVariant: Color(0xff1b1517),
      tertiaryFixed: Color(0xffeae7d9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffcecbbe),
      onTertiaryFixedVariant: Color(0xff17170f),
      surfaceDim: Color(0xff151313),
      surfaceBright: Color(0xff3b3839),
      surfaceContainerLowest: Color(0xff0f0e0e),
      surfaceContainerLow: Color(0xff1d1b1c),
      surfaceContainer: Color(0xff211f20),
      surfaceContainerHigh: Color(0xff2c292a),
      surfaceContainerHighest: Color(0xff373435),
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
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
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
