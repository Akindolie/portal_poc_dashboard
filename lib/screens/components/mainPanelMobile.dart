import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:portal_poc_dashboard/barChart.dart';
import 'package:portal_poc_dashboard/cashBalances.dart';
import 'package:portal_poc_dashboard/constants.dart';
import 'package:portal_poc_dashboard/investments.dart';
import 'package:portal_poc_dashboard/pieChart.dart';
import 'package:portal_poc_dashboard/responsive.dart';
import 'package:portal_poc_dashboard/screens/components/side_menu.dart';

class MainPanelMobile extends StatefulWidget {
  @override
  _MainPanelMobileState createState() => _MainPanelMobileState();
}

class _MainPanelMobileState extends State<MainPanelMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    String now = DateFormat.yMMMMEEEEd().format(DateTime.now());
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 1.5;
    return Scaffold(
      backgroundColor: Colors.transparent,
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //color: Colors.green,
                      child: Row(
                        children: [
                          if (!Responsive.isDesktop(context))
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: kBadgeColor,
                                size: 30,
                              ),
                              onPressed: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                            ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dashboard',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: kTitleTextColor,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Welcome Aderemi!',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: kTextColor,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        now,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: SizedBox(
                  height: 150.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF37505c).withOpacity(0.1),
                        ),
                        child: MyGlassContainer(
                          borderRadius: 10,
                          height: MediaQuery.of(context).size.width - 60,
                          width: MediaQuery.of(context).size.width - 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CardIcon(
                                      icon: FontAwesomeIcons.wallet,
                                      backgroundColor: Color(0xFFFEB95A),
                                      iconColor: kTextColor),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Total Balance',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: kTextColor,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: SizedBox(
                                          width: 50,
                                          child: Divider(),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  'NGN58,146,350.34',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: kTextColor,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF37505c).withOpacity(0.1),
                        ),
                        //color: Colors.blue,
                        child: MyGlassContainer(
                          borderRadius: 10,
                          height: MediaQuery.of(context).size.width - 60,
                          width: MediaQuery.of(context).size.width - 70,
                          child: BarChartOne(),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        //color: Colors.green,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF37505c).withOpacity(0.1),
                        ),
                        child: MyGlassContainer(
                          borderRadius: 10,
                          height: MediaQuery.of(context).size.width - 60,
                          width: MediaQuery.of(context).size.width - 70,
                          child: PieChartSample2(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  //color: Colors.teal,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(4),
                        child: Text(
                          'Cash Balances',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: kTextColor,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF37505c).withOpacity(0.1),
                          ),
                          child: MyGlassContainer(
                            borderRadius: 10,
                            height: MediaQuery.of(context).size.width,
                            width: MediaQuery.of(context).size.width,
                            child: DataTableDemo(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  //color: Colors.yellow,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(4),
                        child: Text(
                          'Investments',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: kTextColor,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF37505c).withOpacity(0.1),
                          ),
                          child: MyGlassContainer(
                            borderRadius: 10,
                            height: MediaQuery.of(context).size.width,
                            width: MediaQuery.of(context).size.width,
                            child: DataTableInvestment(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardIcon extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;

  CardIcon({
    @required this.icon,
    @required this.backgroundColor,
    @required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        //width: 120,
        //height: 80,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          //shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 3.0, //extend the shadow
              offset: Offset(
                6.0, // Move to right 10  horizontally
                6.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: FaIcon(
          icon,
          size: 16,
          color: iconColor,
        ),
      ),
    );
  }
}

class MyGlassContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Widget child;

  MyGlassContainer(
      {@required this.borderRadius,
      @required this.height,
      @required this.width,
      this.child});
  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: width, //double.infinity,
      width: height, //double.infinity,
      isFrostedGlass: true,
      frostedOpacity: 0.05,
      blur: 10,
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.25),
          Colors.white.withOpacity(0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.60),
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(0.60),
        ],
        stops: [0.0, 0.45, 0.55, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
      child: child,
      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      borderColor: Colors.white.withOpacity(0.60),
    );
  }
}
