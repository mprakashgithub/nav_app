Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// INITIALIZING FIREBASE
  await Firebase.initializeApp();

  ///   INITIALIZING THEME MANAGER USED FOR APP THEME
  await ThemeManager.initialise();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  late ThemeProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = ThemeProvider();
    _provider.getAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => _provider,
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          if (provider.mode != null) {
            return ThemeBuilder(
                themes: ColorThemeManager.getThemesList(),
                builder: (context, regularTheme, darkTheme, themeMode) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: ViewStrings.APP_NAME,
                    theme: regularTheme,
                    themeMode: provider.mode,
                    darkTheme: ColorThemeManager.darkTheme,
                    initialRoute: '/',
                    onGenerateRoute: ViewNavigator.generateRoute,
                  );
                });
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
