import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: ViewStrings.tabIndex == null ? 0 : ViewStrings.tabIndex,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).primaryColorDark,
              elevation: 0,
              flexibleSpace: Column(
                children: [
                  TabBar(
                    indicatorWeight: 1,
                    indicatorColor: Theme.of(context).accentColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Theme.of(context).accentColor,
                    unselectedLabelColor: Theme.of(context).bottomAppBarColor,
                    labelStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(
                        color: Theme.of(context).bottomAppBarColor,
                        fontWeight: FontWeight.w600),
                    tabs: <Widget>[
                      const Tab(
                        text: ViewStrings.txtCustomThemeTab,
                      ),
                      const Tab(
                        text: ViewStrings.txtIconTab,
                      ),
                      const Tab(
                        text: ViewStrings.txtInstructionsTab,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: ViewNavigator.settingTabBarScreens),
      ),
    );
  }
}
