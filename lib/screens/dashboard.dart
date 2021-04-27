import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portal_poc_dashboard/responsive.dart';
import 'package:portal_poc_dashboard/screens/components/mainPanel.dart';
import 'package:portal_poc_dashboard/screens/components/mainPanelMobile.dart';
import 'package:portal_poc_dashboard/screens/components/rightPanel.dart';
import 'package:portal_poc_dashboard/screens/components/side_menu.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        desktop: Container(
          color: Color(0xFFF37505c).withOpacity(
              0.1), //Colors.blueGrey.withOpacity(0.3), //Color(0xFFFd5d9e5),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('images/background3.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: MyGlassContainer(
                    height: double.infinity,
                    width: double.infinity,
                    borderRadius: 10.0,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: MainPanel(),
                        ),
                        Expanded(
                          flex: 1,
                          child: RightPanel(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        mobile: Container(
          //color: Color(0xFFF37505c).withOpacity(0.3),
          child: MainPanelMobile(),
        ),
        tablet: Container(
          color: Color(0xFFF37505c).withOpacity(
              0.1), //Colors.blueGrey.withOpacity(0.3), //Color(0xFFFd5d9e5),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('images/background3.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: MyGlassContainer(
                    height: double.infinity,
                    width: double.infinity,
                    borderRadius: 10.0,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: MainPanel(),
                        ),
                        Expanded(
                          flex: 1,
                          child: RightPanel(),
                        ),
                      ],
                    ),
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
