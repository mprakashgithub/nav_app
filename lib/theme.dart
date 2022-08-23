class CustomThemeTab extends StatefulWidget {
  const CustomThemeTab({Key? key}) : super(key: key);

  @override
  _CustomThemeTabState createState() => _CustomThemeTabState();
}

class _CustomThemeTabState extends State<CustomThemeTab> {
  double? _height, _width;
  late ThemeProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = new ThemeProvider();
    print("initState called");
    _provider = Provider.of<ThemeProvider>(context, listen: false);
    print("initState 2");
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * 0.98;
    _height = MediaQuery.of(context).size.height * 0.70;
    return SingleChildScrollView(
        child: Container(
      height: _height,
      width: _width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SwitchListTile(
              title: Text(
                ViewStrings.txtDarkTheme,
                style: TextStyle(color: Theme.of(context).textSelectionColor),
              ),
              value: (_provider.mode == ThemeMode.dark) ? true : false,
              onChanged: (value) {
                setState(() {
                  ///  TOGGLING THEME
                  getThemeManager(context).toggleDarkLightTheme();

                  /// SAVING THEME MODE IN PREFERENCE
                  _provider.toggleMode();
                });
              }),

          /// CUSTOM THEMES BUTTON
          ListTile(
            title: Text(
              ViewStrings.txtCustomTheme,
              style: TextStyle(color: Theme.of(context).textSelectionColor),
            ),
            onTap: () {
              _openCustomThemePopup();
            },
          )
        ],
      ),
    ));
  }

  /// CUSTOM THEMES POPUP
  _openCustomThemePopup() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  /// THEME GRID LIST WIDGET
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                          ColorThemeManager.getThemesList().length,
                          (index) => InkWell(
                                onTap: () {
                                  /// SETTING SELECTED THEME
                                  getThemeManager(context)
                                      .selectThemeAtIndex(index);

                                  /// CLOSING POP-UP WINDOW
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(52.5),
                                          gradient: LinearGradient(
                                              colors: [
                                                ColorThemeManager
                                                        .getThemesList()[index]
                                                    .primaryColorDark,
                                                ColorThemeManager
                                                        .getThemesList()[index]
                                                    .backgroundColor,
                                              ],
                                              begin: const FractionalOffset(
                                                  0.0, 0.0),
                                              end: const FractionalOffset(
                                                  1.0, 0.0),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp)),
                                      width: 105,
                                      height: 105,
                                    ),
                                    Text(ViewStrings.themesArray[index])
                                  ],
                                ),
                              )),
                    ),
                  ),

                  /// CLOSE BUTTON
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(ViewStrings.txtCancel))
                ],
              ),
            ),
          );
        });
  }
}
