import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal_poc_dashboard/constants.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: ListTileTheme(
          selectedColor: Colors.red,
          textColor: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset('images/neulogic-trans.png', width: 120),
              SizedBox(
                height: 30.0,
              ),
              Divider(),
              SideMenuItem(
                  itemIcon: FontAwesomeIcons.home, itemText: 'Dashboard'),
              Divider(),
              SideMenuItem(
                  itemIcon: FontAwesomeIcons.moneyBill, itemText: 'Cash'),
              Divider(),
              SideMenuItem(
                  itemIcon: FontAwesomeIcons.solidFolderOpen,
                  itemText: 'Managed Portfolio'),
              Divider(),
              ExpansionTileItem(
                itemIcon: FontAwesomeIcons.briefcase,
                leadingText: 'Mutual Funds',
                subMenu1: 'Account',
                subMenu2: 'Statement',
                subMenu3: 'Subscription',
                subMenu4: 'Redemption',
              ),
              Divider(),
              SideMenuItem(
                  itemIcon: FontAwesomeIcons.fileContract,
                  itemText: 'Placement'),
              Divider(),
              ExpansionTileItem(
                itemIcon: FontAwesomeIcons.cogs,
                leadingText: 'Settings',
                subMenu1: 'My Profile',
                subMenu2: 'Security Question',
                subMenu3: 'Change Username',
                subMenu4: 'Change Pin',
              ),
              Divider(),
              SideMenuItem(
                  itemIcon: FontAwesomeIcons.fileSignature,
                  itemText: 'Terms and Conditions'),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpansionTileItem extends StatelessWidget {
  final IconData itemIcon;
  final String leadingText;
  final String subMenu1;
  final String subMenu2;
  final String subMenu3;
  final String subMenu4;

  ExpansionTileItem(
      {@required this.itemIcon,
      @required this.leadingText,
      @required this.subMenu1,
      this.subMenu2,
      this.subMenu3,
      this.subMenu4});

  //final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Theme(
      data: theme,
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        title: Text(leadingText, //'Settings',
            style: TextStyle(
                fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w300)
                    .fontFamily,
                fontSize: 13,
                color: kBgDarkColor)),
        leading: FaIcon(
          itemIcon, //FontAwesomeIcons.cogs,
          size: 15,
          color: kBadgeColor,
        ),
        children: [
          SideSubMenuItem(
              itemIcon: null, //FontAwesomeIcons.user,
              itemText: subMenu1), //'My Profile'),
          SideSubMenuItem(
              itemIcon: null, //FontAwesomeIcons.user,
              itemText: subMenu2), //'Security Question'),
          SideSubMenuItem(
              itemIcon: null, //FontAwesomeIcons.user,
              itemText: subMenu3), //'Change Username'),
          SideSubMenuItem(
              itemIcon: null, //FontAwesomeIcons.user,
              itemText: subMenu4), //'Change Pin'),
        ],
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  final IconData itemIcon;
  final String itemText;

  SideMenuItem({@required this.itemIcon, @required this.itemText});
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: ListTile(
        onTap: () {},
        //hoverColor: Colors.red,
        leading: FaIcon(
          itemIcon, //FontAwesomeIcons.home,
          size: 15,
          color: kBadgeColor,
        ),
        title: Text(
          itemText, //'Dashboard',
          style: TextStyle(
            fontFamily:
                GoogleFonts.montserrat(fontWeight: FontWeight.w300).fontFamily,
            fontSize: 13,
            color: kBgDarkColor,
          ),
        ),
      ),
    );
  }
}

class SideSubMenuItem extends StatelessWidget {
  final IconData itemIcon;
  final String itemText;

  SideSubMenuItem({this.itemIcon, @required this.itemText});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //hoverColor: Colors.red,
      tileColor: kSecondaryColor,
      // leading: FaIcon(
      //   itemIcon, //FontAwesomeIcons.home,
      //   size: 13,
      //   color: kBgDarkColor,
      // ),
      title: Text(
        itemText, //'Dashboard',
        style: TextStyle(
            fontFamily:
                GoogleFonts.montserrat(fontWeight: FontWeight.w300).fontFamily,
            fontSize: 11,
            color: kBgDarkColor),
      ),
    );
  }
}
