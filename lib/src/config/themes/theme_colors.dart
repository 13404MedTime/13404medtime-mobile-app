part of 'themes.dart';

/// A set of colors for the entire app.
const colorLightScheme = ColorScheme.light(
  primary: Color(0xFF007BFF), // Bright blue for a fresh and clean look
  primaryContainer: Color(0xFF66B2FF), // Lighter blue for containers
  // onPrimary: Color(0xFFFFFFFF), // White text on primary
  // surface: Color(0xFFFFFFFF), // White surface
  // onSurface: Color(0xFF000000), // Black text on surface
  secondary: Color(0xFF6C757D), // Soft gray for secondary elements
  onSecondary: Color(0xFFFFFFFF), // White text on secondary
  error: Color(0xFFD32F2F), // Red for error
  // onError: Color(0xFFFFFFFF), // White text on error
  background: Color(0xFFF8F9FA), // Light gray background for a clean look
  // onBackground: Color(0xFF000000), // Black text on background
);

///
const colorDarkScheme = ColorScheme.dark(
  primary: Color(0xFF007BFF), // Bright blue for a fresh and clean look
  primaryContainer: Color(0xFF66B2FF), // Lighter blue for containers
  onPrimary: Color(0xFFFFFFFF), // White text on primary
  // surface: Color(0xFF121212), // Dark surface for dark mode
  // onSurface: Color(0xFFFFFFFF), // White text on surface
  secondary: Color(0xFF6C757D), // Soft gray for secondary elements
  onSecondary: Color(0xFFFFFFFF), // White text on secondary
  error: Color(0xFFD32F2F), // Red for error
  onError: Color(0xFFFFFFFF), // White text on error
  background: Color(0xFF1E1E1E), // Dark background for dark mode
  // onBackground: Color(0xFFFFFFFF), // White text on background
);

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.primary10,
    required this.primary20,
    required this.error10,
    required this.primaryContainer10,
    required this.secondary10,
    required this.onSurface20,
    required this.onBackground50,
    required this.disabledCard,
    required this.white20,
    required this.black,
    required this.black24,
    required this.divider,
    required this.darkGrey,
    required this.midGrey,
    required this.transparent,
    required this.grey,
    required this.lightGrey,
  });

  final Color primary10;
  final Color primary20;
  final Color error10;
  final Color primaryContainer10;
  final Color secondary10;
  final Color onSurface20;
  final Color onBackground50;
  final Color disabledCard;
  final Color white20;
  final Color black;
  final Color divider;
  final Color darkGrey;
  final Color midGrey;
  final Color transparent;
  final Color black24;
  final Color grey;
  final Color lightGrey;

  static const ThemeColors light = ThemeColors(
    primary10: Color(0x1A007BFF), // Light blue with transparency
    primary20: Color(0x33007BFF), // Darker blue with transparency
    primaryContainer10: Color(0x1A66B2FF), // Lighter blue for containers
    secondary10: Color(0x1A6C757D), // Soft gray with transparency
    error10: Color(0x1AE57373), // Light red for error
    onSurface20: Color(0x33949494), // On surface color with transparency
    onBackground50: Color(0x802A2828), // On background color with transparency
    disabledCard: Color(0xFFEDEFF2), // Light gray for disabled cards
    white20: Color(0x33FFFFFF), // White with transparency
    black: Color(0xFF000000), // Solid black
    black24: Color(0xFF242424), // Dark gray
    divider: Color(0xFFF0F0F0), // Light gray for dividers
    darkGrey: Color(0xFF3C464E), // Dark gray
    midGrey: Color(0xFF667085), // Medium gray
    transparent: Color(0x00FFFFFF), // Fully transparent
    grey: Color(0xFF717171), // Standard gray
    lightGrey: Color(0xFF66686C), // Light gray
  );

  static const ThemeColors dark = ThemeColors(
    primary10: Color(0x1A007BFF), // Light blue with transparency
    primary20: Color(0x33007BFF), // Darker blue with transparency
    primaryContainer10: Color(0x1A66B2FF), // Lighter blue for containers
    secondary10: Color(0x1A6C757D), // Soft gray with transparency
    error10: Color(0x1AE57373), // Light red for error
    onSurface20: Color(0x33949494), // On surface color with transparency
    onBackground50: Color(0x802A2828), // On background color with transparency
    disabledCard: Color(0xFFEDEFF2), // Light gray for disabled cards
    white20: Color(0x33FFFFFF), // White with transparency
    black: Color(0xFF000000), // Solid black
    black24: Color(0xFF242424), // Dark gray
    divider: Color(0xFFF0F0F0), // Light gray for dividers
    darkGrey: Color(0xFF3C464E), // Dark gray
    midGrey: Color(0xFF667085), // Medium gray
    transparent: Color(0x00FFFFFF), // Fully transparent
    grey: Color(0xFF717171), // Standard gray
    lightGrey: Color(0xFF66686C), // Light gray
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    final Color? primary10,
    final Color? primary20,
    final Color? primaryContainer10,
    final Color? secondary10,
    final Color? error10,
    final Color? onSurface20,
    final Color? onBackground50,
    final Color? disabledCard,
    final Color? white20,
    final Color? black,
    final Color? black24,
    final Color? divider,
    final Color? darkGrey,
    final Color? midGrey,
    final Color? transparent,
    final Color? grey,
    final Color? lightGrey,
  }) =>
      ThemeColors(
        primary10: primary10 ?? this.primary10,
        primary20: primary20 ?? this.primary20,
        primaryContainer10: primaryContainer10 ?? this.primaryContainer10,
        secondary10: secondary10 ?? this.secondary10,
        error10: error10 ?? this.error10,
        onSurface20: onSurface20 ?? this.onSurface20,
        onBackground50: onBackground50 ?? this.onBackground50,
        disabledCard: disabledCard ?? this.disabledCard,
        white20: white20 ?? this.white20,
        black: black ?? this.black,
        black24: black24 ?? this.black24,
        divider: divider ?? this.divider,
        darkGrey: darkGrey ?? this.darkGrey,
        midGrey: midGrey ?? this.midGrey,
        transparent: transparent ?? this.transparent,
        grey: grey ?? this.grey,
        lightGrey: lightGrey ?? this.lightGrey,
      );

  @override
  ThemeExtension<ThemeColors> lerp(ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      primary10: Color.lerp(primary10, other.primary10, t)!,
      primary20: Color.lerp(primary20, other.primary20, t)!,
      primaryContainer10: Color.lerp(primaryContainer10, other.primaryContainer10, t)!,
      secondary10: Color.lerp(secondary10, other.secondary10, t)!,
      error10: Color.lerp(error10, other.error10, t)!,
      onSurface20: Color.lerp(onSurface20, other.onSurface20, t)!,
      onBackground50: Color.lerp(onBackground50, other.onBackground50, t)!,
      disabledCard: Color.lerp(disabledCard, other.disabledCard, t)!,
      white20: Color.lerp(white20, other.white20, t)!,
      black: Color.lerp(black, other.black, t)!,
      black24: Color.lerp(black24, other.black24, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      midGrey: Color.lerp(midGrey, other.midGrey, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
    );
  }
}
