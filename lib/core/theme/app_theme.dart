import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData _theme = _buildTheme();

class AppTheme {
  static MaterialColor primaryColors = const MaterialColor(
    0xFF3F51B5,
    <int, Color>{
      50: Color(0xFFE8EAF6),
      100: Color(0xFFC5CAE9),
      200: Color(0xFF9FA8DA),
      300: Color(0xFF7986CB),
      400: Color(0xFF5C6BC0),
      500: Color(0xFF3F51B5),
      600: Color(0xFF3949AB),
      700: Color(0xFF303F9F),
      800: Color(0xFF283593),
      900: Color(0xFF1A237E),
    },
  );

  static var scaffoldBackground = const Color(0xFFFFFFFF);
  static var activeButtonFilledColor = const Color(0xFF7E55D7);
  static var normalCardBackground = Colors.white;
  static Color textTitleColor = Colors.black87;
  static Color textSubtitleColor = const Color(0xFF3D3D3D);
  static Color textAnswerColor = const Color(0xFF282626);
  static Color orangeShadow = const Color(0xFFD15137).withOpacity(0.27);
  static Color green = const Color(0xFF44D929);
  static Color red = const Color(0xFFE82441);
  Color textButtonColor = const Color(0xff5C38FF);
  Color secondaryColor = const Color(0xff000032);
  Color textSecondaryColor = const Color(0xff000000).withOpacity(0.3);
  static Color greyShadow = const Color(0xFFC1C1C1).withOpacity(0.25);
  static Color primaryColorShadow = const Color(0xFF3F51B5).withOpacity(0.40);
  static Color greyBackground = const Color(0xFFF1F1F1).withOpacity(0.27);
  static Color labelGrey = const Color(0xFF828282);
  static Color shimmerBackground = const Color(0xFFDBDBDB).withOpacity(0.25);
  static Color lightBlueContainerColor =
  const Color(0xFFEEEBFD).withOpacity(0.25);
  Color kDividerColor = const Color(0xffD9D9D9);
  Color kBlueColor = const Color(0xff000032);
  static double cardRadiusInt = 10;
  static BorderRadiusGeometry cardRadius =
  BorderRadius.all(Radius.circular(cardRadiusInt));
  static BorderRadius clipRadius =
  BorderRadius.all(Radius.circular(cardRadiusInt));

  static Color appTextColor = const Color(0xFF304999);
  static Color appTransparent = const Color(0x00000000);
  static Color appWhite = const Color(0xFFFFFFFF);
  static Color appGrey = const Color(0xFF707070);
  static Color appButton = const Color(0xFF85D5B2);
  static Color appTopBar= const Color(0xFFEDEEF2);
  static Color appRed = const Color(0xFFDB0000);
  static Color appLeftDrawer = const Color(0xFF39548B);
  static Color appProfileHint = const Color(0xFF4A4A4A);
  static Color appGreen= const Color(0xFF09923B);


  Gradient get appGradient => const LinearGradient(
    colors: [Color(0xFF304999), Color(0xFF39548B)],
    stops: [0, 1],
    begin: Alignment(-0.96, 0.28),
    end: Alignment(0.96, -0.28),
    // angle: 74,
    // scale: undefined,
  );

  ThemeData getThemeData(BuildContext context) {
    // TODO : handle context here. If not delete it
    return _theme;
  }
}

ThemeData _buildTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: base.colorScheme.copyWith(
      primary: const Color(0xFF304999),
      secondary: const Color(0xFF304999),
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: false,
      iconTheme: IconThemeData(color: Color(0xFF000000)),
      actionsIconTheme: IconThemeData(color: Color(0xFF000000)),
      foregroundColor: Color(0xFF000000),
    ),
    scaffoldBackgroundColor: AppTheme.scaffoldBackground,
    canvasColor: Colors.white,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
    cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        )),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      disabledElevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    textTheme: _buildTextTheme(base.textTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontFamily: 'Montserrat',
    ),
    headline2: base.headline2!.copyWith(
      fontFamily: 'Montserrat',
    ),
    headline3: base.headline3!.copyWith(
      fontFamily: 'Montserrat',
    ),
    headline4: base.headline4!.copyWith(
      fontFamily: 'Montserrat',
    ),
    headline5: base.headline5!.copyWith(
      fontFamily: 'Montserrat',
    ),
    headline6: base.headline6!.copyWith(
      fontFamily: 'Montserrat',
      fontSize: 26,
    ),
    subtitle1: base.subtitle1!.copyWith(
      fontFamily: 'Montserrat',
    ),
    subtitle2: base.subtitle2!.copyWith(
      fontFamily: 'Montserrat',
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontFamily: 'Montserrat',
    ),
    bodyText2: base.bodyText2!.copyWith(
      fontFamily: 'Montserrat',
    ),
    caption: base.caption!.copyWith(
      fontFamily: 'Montserrat',
    ),
    button: base.button!.copyWith(
      fontFamily: 'Montserrat',
    ),
    overline: base.overline!.copyWith(
      fontFamily: 'Montserrat',
    ),
  );
}
