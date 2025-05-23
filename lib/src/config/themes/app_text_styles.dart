part of 'themes.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  const ThemeTextStyles({
    required this.appBarTitle,
    required this.buttonStyle,
    required this.regularCaption2,
    required this.regularCaption1,
    required this.regularFootnote,
    required this.regularSubheadline,
    required this.regularCallout,
    required this.regularBody,
    required this.regularHeadline,
    required this.regularTitle1,
    required this.regularTitle2,
    required this.regularTitle3,
    required this.regularLargeTitle,
    required this.bodyCaption2,
    required this.bodyCaption1,
    required this.bodyFootnote,
    required this.bodySubheadline,
    required this.bodyCallout,
    required this.bodyBody,
    required this.bodyHeadline,
    required this.bodyTitle1,
    required this.bodyTitle2,
    required this.bodyTitle3,
    required this.bodyLargeTitle,
    required this.whiteFontSize18Weight600,
    required this.primary10FontSize14Weight700,
    required this.lightBlackFontSize14Weight500,
    required this.blackFontSize24Weight600,
    required this.onBackground50FontSize15Weight500,
  });

  final TextStyle appBarTitle;
  final TextStyle buttonStyle;
  final TextStyle regularCaption2;
  final TextStyle regularCaption1;
  final TextStyle regularFootnote;
  final TextStyle regularSubheadline;
  final TextStyle regularCallout;
  final TextStyle regularBody;
  final TextStyle regularHeadline;
  final TextStyle regularTitle1;
  final TextStyle regularTitle2;
  final TextStyle regularTitle3;
  final TextStyle regularLargeTitle;
  final TextStyle bodyCaption2;
  final TextStyle bodyCaption1;
  final TextStyle bodyFootnote;
  final TextStyle bodySubheadline;
  final TextStyle bodyCallout;
  final TextStyle bodyBody;
  final TextStyle bodyHeadline;
  final TextStyle bodyTitle1;
  final TextStyle bodyTitle2;
  final TextStyle bodyTitle3;
  final TextStyle bodyLargeTitle;
  final TextStyle whiteFontSize18Weight600;
  final TextStyle primary10FontSize14Weight700;
  final TextStyle lightBlackFontSize14Weight500;
  final TextStyle blackFontSize24Weight600;
  final TextStyle onBackground50FontSize15Weight500;

  static ThemeTextStyles light = ThemeTextStyles(
    appBarTitle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    blackFontSize24Weight600: const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    buttonStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    regularBody: const TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
    regularCallout: const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    regularCaption1: const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    regularCaption2: const TextStyle(
      color: Colors.black,
      fontSize: 11,
      fontWeight: FontWeight.w400,
    ),
    regularFootnote: const TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    regularHeadline: const TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    regularLargeTitle: const TextStyle(
      color: Colors.black,
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    regularSubheadline: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    regularTitle1: const TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    regularTitle2: const TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
    regularTitle3: const TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
    bodyBody: const TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
    bodyCallout: const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyCaption1: const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    bodyCaption2: const TextStyle(
      color: Colors.black,
      fontSize: 11,
      fontWeight: FontWeight.w400,
    ),
    bodyFootnote: const TextStyle(
      color: Colors.black,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    bodyHeadline: const TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    bodyLargeTitle: const TextStyle(
      color: Colors.black,
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    bodySubheadline: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    bodyTitle1: const TextStyle(
      color: Colors.black,
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    bodyTitle2: const TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    bodyTitle3: const TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
    whiteFontSize18Weight600: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    primary10FontSize14Weight700: TextStyle(
      color: colorLightScheme.primary,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    lightBlackFontSize14Weight500: const TextStyle(
      color: Color(0x802A2828),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    onBackground50FontSize15Weight500: TextStyle(
      color: colorLightScheme.onBackground,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );
  static ThemeTextStyles dark = ThemeTextStyles(
    appBarTitle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    blackFontSize24Weight600: const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    buttonStyle: const TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    regularBody: const TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
    regularCallout: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    regularCaption1: const TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    regularCaption2: const TextStyle(
      color: Colors.white,
      fontSize: 11,
      fontWeight: FontWeight.w400,
    ),
    regularFootnote: const TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    regularHeadline: const TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    regularLargeTitle: const TextStyle(
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    regularSubheadline: const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    regularTitle1: const TextStyle(
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    regularTitle2: const TextStyle(
      color: Colors.white,
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    regularTitle3: const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
    bodyBody: const TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
    bodyCallout: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyCaption1: const TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    bodyCaption2: const TextStyle(
      color: Colors.white,
      fontSize: 11,
      fontWeight: FontWeight.w400,
    ),
    bodyFootnote: const TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    bodyHeadline: const TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    bodyLargeTitle: const TextStyle(
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    bodySubheadline: const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    bodyTitle1: const TextStyle(
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    bodyTitle2: const TextStyle(
      color: Colors.white,
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    bodyTitle3: const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
    whiteFontSize18Weight600: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    primary10FontSize14Weight700: TextStyle(
      color: colorDarkScheme.primary,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    lightBlackFontSize14Weight500: const TextStyle(
      color: Color(0x802A2828),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    onBackground50FontSize15Weight500: TextStyle(
      color: colorLightScheme.onBackground,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? appBarTitle,
    TextStyle? buttonStyle,
    TextStyle? regularBody,
    TextStyle? regularCallout,
    TextStyle? regularCaption1,
    TextStyle? regularCaption2,
    TextStyle? regularFootnote,
    TextStyle? regularHeadline,
    TextStyle? regularLargeTitle,
    TextStyle? regularSubheadline,
    TextStyle? regularTitle1,
    TextStyle? regularTitle2,
    TextStyle? regularTitle3,
    TextStyle? bodyBody,
    TextStyle? bodyCallout,
    TextStyle? bodyCaption1,
    TextStyle? bodyCaption2,
    TextStyle? bodyFootnote,
    TextStyle? bodyHeadline,
    TextStyle? bodyLargeTitle,
    TextStyle? bodySubheadline,
    TextStyle? bodyTitle1,
    TextStyle? bodyTitle2,
    TextStyle? bodyTitle3,
    TextStyle? whiteFontSize18Weight600,
    TextStyle? primary10FontSize14Weight700,
    TextStyle? lightBlackFontSize14Weight500,
    TextStyle? blackFontSize24Weight600,
    TextStyle? onBackground50FontSize15Weight500,
  }) =>
      ThemeTextStyles(
        appBarTitle: appBarTitle ?? this.appBarTitle,
        buttonStyle: buttonStyle ?? this.buttonStyle,
        regularBody: regularBody ?? this.regularBody,
        regularCallout: regularCallout ?? this.regularCallout,
        regularCaption1: regularCaption1 ?? this.regularCaption1,
        regularCaption2: regularCaption2 ?? this.regularCaption2,
        regularFootnote: regularFootnote ?? this.regularFootnote,
        regularHeadline: regularHeadline ?? this.regularHeadline,
        regularLargeTitle: regularLargeTitle ?? this.regularLargeTitle,
        regularSubheadline: regularSubheadline ?? this.regularSubheadline,
        regularTitle1: regularTitle1 ?? this.regularTitle1,
        regularTitle2: regularTitle2 ?? this.regularTitle2,
        regularTitle3: regularTitle3 ?? this.regularTitle3,
        bodyBody: bodyBody ?? this.bodyBody,
        bodyCallout: bodyCallout ?? this.bodyCallout,
        bodyCaption1: bodyCaption1 ?? this.bodyCaption1,
        bodyCaption2: bodyCaption2 ?? this.bodyCaption2,
        bodyFootnote: bodyFootnote ?? this.bodyFootnote,
        bodyHeadline: bodyHeadline ?? this.bodyHeadline,
        bodyLargeTitle: bodyLargeTitle ?? this.bodyLargeTitle,
        bodySubheadline: bodySubheadline ?? this.bodySubheadline,
        bodyTitle1: bodyTitle1 ?? this.bodyTitle1,
        bodyTitle2: bodyTitle2 ?? this.bodyTitle2,
        bodyTitle3: bodyTitle3 ?? this.bodyTitle3,
        onBackground50FontSize15Weight500: onBackground50FontSize15Weight500 ?? this.onBackground50FontSize15Weight500,
        blackFontSize24Weight600: blackFontSize24Weight600 ?? this.blackFontSize24Weight600,
        whiteFontSize18Weight600: whiteFontSize18Weight600 ?? this.whiteFontSize18Weight600,
        primary10FontSize14Weight700: primary10FontSize14Weight700 ?? this.primary10FontSize14Weight700,
        lightBlackFontSize14Weight500: lightBlackFontSize14Weight500 ?? this.lightBlackFontSize14Weight500,
      );

  @override
  ThemeExtension<ThemeTextStyles> lerp(ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      appBarTitle: TextStyle.lerp(appBarTitle, other.appBarTitle, t)!,
      buttonStyle: TextStyle.lerp(buttonStyle, other.buttonStyle, t)!,
      regularBody: TextStyle.lerp(regularBody, other.regularBody, t)!,
      regularCallout: TextStyle.lerp(regularCallout, other.regularCallout, t)!,
      regularCaption1: TextStyle.lerp(regularCaption1, other.regularCaption1, t)!,
      regularCaption2: TextStyle.lerp(regularCaption2, other.regularCaption2, t)!,
      regularFootnote: TextStyle.lerp(regularFootnote, other.regularFootnote, t)!,
      regularHeadline: TextStyle.lerp(regularHeadline, other.regularHeadline, t)!,
      regularLargeTitle: TextStyle.lerp(regularLargeTitle, other.regularLargeTitle, t)!,
      regularSubheadline: TextStyle.lerp(regularSubheadline, other.regularSubheadline, t)!,
      regularTitle1: TextStyle.lerp(regularTitle1, other.regularTitle1, t)!,
      regularTitle2: TextStyle.lerp(regularTitle2, other.regularTitle2, t)!,
      regularTitle3: TextStyle.lerp(regularTitle3, other.regularTitle3, t)!,
      bodyBody: TextStyle.lerp(bodyBody, other.bodyBody, t)!,
      bodyCallout: TextStyle.lerp(bodyCallout, other.bodyCallout, t)!,
      bodyCaption1: TextStyle.lerp(bodyCaption1, other.bodyCaption1, t)!,
      bodyCaption2: TextStyle.lerp(bodyCaption2, other.bodyCaption2, t)!,
      bodyFootnote: TextStyle.lerp(bodyFootnote, other.bodyFootnote, t)!,
      bodyHeadline: TextStyle.lerp(bodyHeadline, other.bodyHeadline, t)!,
      bodyLargeTitle: TextStyle.lerp(bodyLargeTitle, other.bodyLargeTitle, t)!,
      blackFontSize24Weight600: TextStyle.lerp(blackFontSize24Weight600, other.blackFontSize24Weight600, t)!,
      bodySubheadline: TextStyle.lerp(bodySubheadline, other.bodySubheadline, t)!,
      bodyTitle1: TextStyle.lerp(bodyTitle1, other.bodyTitle1, t)!,
      bodyTitle2: TextStyle.lerp(bodyTitle2, other.bodyTitle2, t)!,
      bodyTitle3: TextStyle.lerp(bodyTitle3, other.bodyTitle3, t)!,
      onBackground50FontSize15Weight500:
          TextStyle.lerp(onBackground50FontSize15Weight500, other.onBackground50FontSize15Weight500, t)!,
      whiteFontSize18Weight600: TextStyle.lerp(whiteFontSize18Weight600, other.whiteFontSize18Weight600, t)!,
      primary10FontSize14Weight700:
          TextStyle.lerp(primary10FontSize14Weight700, other.primary10FontSize14Weight700, t)!,
      lightBlackFontSize14Weight500:
          TextStyle.lerp(lightBlackFontSize14Weight500, other.lightBlackFontSize14Weight500, t)!,
    );
  }
}
