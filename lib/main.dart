import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_parking/ratepark/annonce/annonce.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'index.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;

  Stream<SmartParkingFirebaseUser> userStream;
  SmartParkingFirebaseUser initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = smartParkingFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 1),
          () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
    _themeMode = mode;
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'smart parking',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: SpinKitCubeGrid(
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 50,
          ),
        ),
      )
          : currentUser.loggedIn
          ? NavBarPage()
          : MainWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    // f had tableau kayn les éléments ta3 nav bar
    final tabs = {
      'HomePage': HomePageWidget(),
      'Réclamations': ReclamationWidget(),
      'affichage ' : annonceWidget(),
      'profilePage': ProfilePageWidget(),

    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.of(context).customColor1,
        selectedItemColor: Color(0xFF8C61FF),
        unselectedItemColor: FlutterFlowTheme.of(context).gray200,
        selectedBackgroundColor: Color(0x00000000),
        borderRadius: 8,
        itemBorderRadius: 8,
        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        width: double.infinity,
        elevation: 0,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 0
                      ? FontAwesomeIcons.searchLocation
                      : FontAwesomeIcons.searchLocation,
                  color: currentIndex == 0
                      ? FlutterFlowTheme.of(context).secondaryColor
                      : Color.fromRGBO(203, 203, 203, 1),
                  size: currentIndex == 0 ? 35 : 30,
                ),
                Text(
                  '•',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 1
                      ? Icons.add_box_rounded
                      : Icons.add_box_rounded,
                  color: currentIndex == 1
                      ? FlutterFlowTheme.of(context).secondaryColor
                      : FlutterFlowTheme.of(context).tertiaryColor,
                  size: currentIndex == 1 ? 35 : 30,
                ),
                Text(
                  '•',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 1
                        ? FlutterFlowTheme.of(context).secondaryColor
                        : FlutterFlowTheme.of(context).tertiaryColor,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 2
                      ? Icons.announcement
                      : Icons.announcement,
                  color: currentIndex == 2
                      ? FlutterFlowTheme.of(context).secondaryColor
                      : FlutterFlowTheme.of(context).tertiaryColor,
                  size: currentIndex == 2 ? 35 : 30,
                ),
                Text(
                  '•',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 2
                        ? FlutterFlowTheme.of(context).secondaryColor
                        : FlutterFlowTheme.of(context).tertiaryColor,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 2
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: currentIndex == 2
                      ? FlutterFlowTheme.of(context).secondaryColor
                      : FlutterFlowTheme.of(context).tertiaryColor,
                  size: currentIndex == 2 ? 35 : 30,
                ),
                Text(
                  '•',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 2
                        ? FlutterFlowTheme.of(context).secondaryColor
                        : FlutterFlowTheme.of(context).tertiaryColor,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}