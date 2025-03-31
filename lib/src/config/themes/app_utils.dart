part of 'themes.dart';

sealed class AppUtils {
  AppUtils._();

  static const kSpacer = Spacer();

  static const kGap = Gap(0);
  static const kGap4 = Gap(4);
  static const kGap6 = Gap(6);
  static const kGap8 = Gap(8);
  static const kGap12 = Gap(12);
  static const kGap20 = Gap(20);
  static const kGap24 = Gap(24);
  static const kGap40 = Gap(40);

  /// sliver gap
  static const kSliverGap4 = SliverGap(4);
  static const kSliverGap6 = SliverGap(6);
  static const kSliverGap8 = SliverGap(8);
  static const kSliverGap12 = SliverGap(12);
  static const kSliverGap20 = SliverGap(20);
  static const kSliverGap24 = SliverGap(24);
  static const kSliverGap40 = SliverGap(40);

  /// box
  static const kBox = SizedBox.shrink();
  static const kBoxWidth2 = SizedBox(width: 2);
  static const kBoxWidth4 = SizedBox(width: 4);
  static const kBoxWidth5 = SizedBox(width: 5);
  static const kBoxWidth6 = SizedBox(width: 6);
  static const kBoxWidth8 = SizedBox(width: 8);
  static const kBoxWidth10 = SizedBox(width: 10);
  static const kBoxWidth12 = SizedBox(width: 12);
  static const kBoxWidth14 = SizedBox(width: 14);
  static const kBoxWidth16 = SizedBox(width: 16);
  static const kBoxWidth20 = SizedBox(width: 20);
  static const kBoxWidth24 = SizedBox(width: 24);
  static const kBoxHeight2 = SizedBox(height: 2);
  static const kBoxHeight4 = SizedBox(height: 4);
  static const kBoxHeight6 = SizedBox(height: 6);
  static const kBoxHeight8 = SizedBox(height: 8);
  static const kBoxHeight10 = SizedBox(height: 10);
  static const kBoxHeight12 = SizedBox(height: 12);
  static const kBoxHeight16 = SizedBox(height: 16);
  static const kBoxHeight14 = SizedBox(height: 14);
  static const kBoxHeight20 = SizedBox(height: 20);
  static const kBoxHeight24 = SizedBox(height: 24);
  static const kBoxHeight32 = SizedBox(height: 32);
  static const kBoxHeight34 = SizedBox(height: 34);
  static const kBoxHeight36 = SizedBox(height: 36);
  static const kBoxHeight42 = SizedBox(height: 42);

  /// divider
  static const kDivider = Divider(height: 1);
  static const kDividerBlack07 = Divider(
    color: Color(0x12000000),
    height: 1,
  );

  /// padding
  static const kPadding0 = EdgeInsets.zero;
  static const kPaddingAll4 = EdgeInsets.all(4);
  static const kPaddingAll5 = EdgeInsets.all(5);
  static const kPaddingAll6 = EdgeInsets.all(6);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll10 = EdgeInsets.all(10);
  static const kPaddingAll12 = EdgeInsets.all(12);
  static const kPaddingAll16 = EdgeInsets.all(16);
  static const kPaddingAll24 = EdgeInsets.all(24);
  static const kPaddingHorizontal12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHorizontal32 = EdgeInsets.symmetric(horizontal: 32);
  static const kPaddingHor12Ver16 = EdgeInsets.symmetric(horizontal: 12, vertical: 16);
  static const kPaddingHor12Ver8 = EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const kPaddingHor12Ver10 = EdgeInsets.symmetric(horizontal: 12, vertical: 10);
  static const kPaddingHor12Ver4 = EdgeInsets.symmetric(horizontal: 12, vertical: 4);
  static const kPaddingHor32Ver20 = EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const kPaddingT20LRB16 = EdgeInsets.fromLTRB(20, 16, 16, 16);
  static const kPaddingBottom12 = EdgeInsets.fromLTRB(0, 0, 0, 12);
  static const kPaddingBottom16 = EdgeInsets.fromLTRB(0, 0, 0, 16);
  static const kPaddingBottom2 = EdgeInsets.fromLTRB(0, 0, 0, 2);
  static const kPaddingHor16T16B24 = EdgeInsets.fromLTRB(16, 16, 16, 78);
  static const kPaddingHor14Ver16 = EdgeInsets.symmetric(horizontal: 14, vertical: 16);
  static const kPaddingHor16Ver8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const kPaddingHor16Ver12 = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const kPaddingHor16Ver24 = EdgeInsets.symmetric(horizontal: 16, vertical: 24);
  static const kPaddingHor8Ver4 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const kPaddingVertical24 = EdgeInsets.symmetric(vertical: 24);

  static const kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const kPaddingAll16T8B0 = EdgeInsets.fromLTRB(16, 8, 16, 0);
  static const kPaddingAll16T8B8 = EdgeInsets.fromLTRB(16, 8, 16, 8);
  static const kPaddingLeft16Top0Right16Bottom12 = EdgeInsets.fromLTRB(16, 0, 16, 12);

  /// border radius
  static const kRadius = Radius.zero;
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius4 = BorderRadius.all(Radius.circular(4));
  static const kBorderRadius7 = BorderRadius.all(Radius.circular(7));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius9 = BorderRadius.all(Radius.circular(9));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kBorderRadius50 = BorderRadius.all(Radius.circular(50));
  static const kBorderRadius100 = BorderRadius.all(Radius.circular(100));

  static const kShapeRoundedNone = RoundedRectangleBorder();
  static const kShapeRoundedAll12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );
  static const kShapeRoundedAll10 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
  static const kShapeRoundedBottom12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(12),
      bottomLeft: Radius.circular(12),
    ),
  );
}
