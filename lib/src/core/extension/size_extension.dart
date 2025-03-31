part of 'extension.dart';

extension SizeExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600 && (Platform.isAndroid || Platform.isIOS);

  bool get isTablet => MediaQuery.of(this).size.width > 600 && (Platform.isAndroid || Platform.isIOS);

  double get doubleToWidth => isMobile ? MediaQuery.of(this).size.width : (MediaQuery.of(this).size.width - 48) / 2;

  EdgeInsets get kMargin16 => EdgeInsets.only(
        top: MediaQuery.of(this).padding.top,
        left: isMobile ? 16 : 200,
        right: isMobile ? 16 : 200,
        bottom: MediaQuery.of(this).padding.bottom,
      );

  EdgeInsets get kMarginBottom16 => EdgeInsets.only(
        bottom: MediaQuery.of(this).padding.bottom,
        left: isMobile ? 16 : 200,
        right: isMobile ? 16 : 200,
      );

  Size get kSize => MediaQuery.of(this).size;

  Size get sizeOf => MediaQuery.sizeOf(this);

  EdgeInsets get viewInsetsOf => MediaQuery.viewInsetsOf(this);

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension OrientationExtension on Orientation {
  bool get isPortrait => this == Orientation.portrait;
}
