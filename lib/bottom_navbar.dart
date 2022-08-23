import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

 late AppNavigatorProvider _provider;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();

    _scaffoldKey = GlobalKey();

    _provider = AppNavigatorProvider();
    _provider.setSelectedScreenIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppNavigatorProvider>(
      create: (context) => _provider,
      child: Consumer<AppNavigatorProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              leadingButton: IconButton(
                icon: Icons.menuIcon,
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              title: provider.getHeader(),
              appbarActionButtons: [
                /// BLUETOOTH BUTTON
                IconButton(
                    onPressed: () {
                      _openBluetoothDialog(context);
                    },
                    icon: ViewIcons.bluetoothIcon),

                /// BATTERY BUTTON
                IconButton(
                    onPressed: () {
                      _openBatteryDialog(context);
                    },
                    icon: ViewIcons.batteryFullIcon),

                /// MORE BUTTON
                IconButton(
                    onPressed: () {
                      _openMoreDialog(context);
                    },
                    icon: ViewIcons.moreIcon)
              ],
            ),
            drawer: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: AppDrawer(provider: provider)),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColorDark,
              currentIndex: provider.selectedScreenIndex,
              selectedItemColor: Theme.of(context).accentColor,
              unselectedItemColor: Theme.of(context).bottomAppBarColor,
              items: [
                // USER TAB
                BottomNavigationBarItem(
                    icon: ViewIcons.userIcon, label: ViewStrings.txtUser),

                // COUNTER TAB
                BottomNavigationBarItem(
                    icon: ViewIcons.counterIcon, label: ViewStrings.txtCounter),

                // SETTING TAB
                BottomNavigationBarItem(
                    icon: ViewIcons.settingIcon, label: ViewStrings.txtSetting),
              ],
              onTap: (position) {
                provider.setSelectedScreenIndex(position);
              },
            ),
            body: ViewNavigator.bottomBarScreens[provider.selectedScreenIndex],
          );
        },
      ),
    );
  }

  ///BLUETOOTH DIALOG
  _openBluetoothDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: 150,
              child: Center(child: Text("connected")),
            ),
          );
        });
  }

  ///BATTERY DIALOG
  _openBatteryDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: 150,
              child: Center(child: Text("status")),
            ),
          );
        });
  }

  ///MORE_VERT DIALOG
  _openMoreDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: 150,
              child: Center(child: Text("list item 1")),
            ),
          );
        });
  }