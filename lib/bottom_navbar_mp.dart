import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  // const BottomNavBar({ Key? key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[Home(), Favorites(), Chat2(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageList[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.redAccent[400],
            currentIndex: pageIndex,
            onTap: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                      "assets/images/android/drawable-ldpi/home_on_ic.png"),
                  icon: Image.asset(
                      "assets/images/android/drawable-ldpi/home_off_ic.png"),
                  label: StringConst.home),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                      "assets/images/android/drawable-ldpi/favorites_on_ic.png"),
                  icon: Image.asset(
                      "assets/images/android/drawable-ldpi/favorites_off_ic.png"),
                  label: StringConst.favorites),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                      "assets/images/android/drawable-ldpi/chat_on_ic.png"),
                  icon: Image.asset(
                      "assets/images/android/drawable-ldpi/chat_off_ic.png"),
                  label: StringConst.chat),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                      "assets/images/android/drawable-ldpi/profile_on_ic.png"),
                  icon: Image.asset(
                      "assets/images/android/drawable-ldpi/profile_off_ic.png"),
                  label: StringConst.profile),
            ]));
  }
}
