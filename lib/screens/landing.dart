import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';

import 'package:playemo/widgets/bottom_bar_icons.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  bool playListSelected = false;
  bool wishListSelected = false;
  bool homeSelected = true;
  bool searchSelected = false;
  bool accountSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkThemeBackground,
      bottomNavigationBar: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24)
        ),
        elevation: 2,
        child: Container(
          width: width(context),
          height: 65,
          decoration: BoxDecoration(
            color: AppColor.darkThemeBackground,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24)
            )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomBarIcon(
                iconData: Icons.my_library_music,
                label: 'Playlist',
                selected: playListSelected,
                onTap: () {
                  setState(() {
                    playListSelected = true;
                    wishListSelected = false;
                    homeSelected = false;
                    searchSelected = false;
                    accountSelected = false;
                  });
                },
              ),
              BottomBarIcon(
                iconData: Icons.favorite,
                label: 'Wishlist',
                selected: wishListSelected,
                onTap: () {
                  setState(() {
                    playListSelected = false;
                    wishListSelected = true;
                    homeSelected = false;
                    searchSelected = false;
                    accountSelected = false;
                  });
                },
              ),
              BottomBarIcon(
                iconData: Icons.music_note,
                label: 'Home',
                selected: homeSelected,
                onTap: () {
                  setState(() {
                    playListSelected = false;
                    wishListSelected = false;
                    homeSelected = true;
                    searchSelected = false;
                    accountSelected = false;
                  });
                },
              ),
              BottomBarIcon(
                iconData: Icons.search,
                label: 'Search',
                selected: searchSelected,
                onTap: () {
                  setState(() {
                    playListSelected = false;
                    wishListSelected = false;
                    homeSelected = false;
                    searchSelected = true;
                    accountSelected = false;
                  });
                },
              ),
              BottomBarIcon(
                iconData: Icons.supervisor_account_sharp,
                label: 'Account',
                selected: accountSelected,
                onTap: () {
                  setState(() {
                    playListSelected = false;
                    wishListSelected = false;
                    homeSelected = false;
                    searchSelected = false;
                    accountSelected = true;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
