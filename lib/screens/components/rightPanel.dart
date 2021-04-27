import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal_poc_dashboard/constants.dart';
import 'package:portal_poc_dashboard/screens/components/side_menu.dart';
import 'package:portal_poc_dashboard/transaction.dart';

class RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget leadingItemDecider(String type) {
      if (type == 'Credit') {
        return TransactionListIcon(
          backgroundColor: kTopUpBackgroundColor,
          iconColor: kTopUpIconColor,
          icon: FontAwesomeIcons.angleUp,
        );
      } else {
        return TransactionListIcon(
          backgroundColor: kDebitBackgroundColor,
          iconColor: kDebitIconColor,
          icon: FontAwesomeIcons.angleDown,
        );
      }
    }

    List<Transaction> myTransactions = [
      Transaction(
        amount: '121.00',
        currency: 'NGN',
        description: 'One hundred and Twenty One Naira ONLY',
        date: '20-JAN-2020',
        icon: FontAwesomeIcons.userFriends,
        type: 'Credit',
      ),
      Transaction(
        amount: '124.00',
        currency: 'NGN',
        description: 'REVERSAL: One hundred and Twenty One Naira ONLY',
        date: '20-JAN-2020',
        icon: FontAwesomeIcons.userFriends,
        type: 'Credit',
      ),
      Transaction(
        amount: '121.00',
        currency: 'NGN',
        description: 'REVERSAL: One hundred and Twenty One Naira ONLY',
        date: '20-JAN-2020',
        icon: FontAwesomeIcons.userFriends,
        type: 'Debit',
      ),
      Transaction(
        amount: '121.00',
        currency: 'NGN',
        description: 'REVERSAL: One hundred and Twenty One Naira ONLY',
        date: '20-JAN-2020',
        icon: FontAwesomeIcons.userFriends,
        type: 'Credit',
      ),
      Transaction(
        amount: '121.00',
        currency: 'NGN',
        description: 'REVERSAL: One hundred and Twenty One Naira ONLY',
        date: '20-JAN-2020',
        icon: FontAwesomeIcons.userFriends,
        type: 'Debit',
      )
    ];
    return Container(
      //color: Colors.red,
      //padding: EdgeInsets.all(3.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'KYC Status:',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Active',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircle,
                          size: 11.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.bell,
                  size: 15.0,
                  color: Colors.black,
                ),
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 22.0,
                    backgroundImage: AssetImage(
                      'images/avatar2.jpg',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 11,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      //color: Colors.tealAccent,
                      child: Column(
                        children: [
                          SubHeadingText(
                            text: 'Current User',
                          ),
                          UserExpansionTileItem(
                              itemIcon: FontAwesomeIcons.userFriends,
                              leadingText:
                                  '000045-OLATUJOYE Anthony Oluwasegun',
                              subMenu1: '000025-OLATUJOYE Fred Tola'),
                        ],
                      ),
                    ),
                    //SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        //height: 10,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey[200], width: 0.5),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          'Last Login: April 22ND, 2021 06:16:40 PM',
                          textAlign: TextAlign.center,
                          //textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      //color: Colors.blue[200],
                      child: Row(
                        children: [
                          QuickLinksItem(
                            backgroundColor: kTopUpBackgroundColor,
                            label: 'Top Up',
                            icon: FontAwesomeIcons.plusCircle,
                            iconColor: kTopUpIconColor,
                          ),
                          QuickLinksItem(
                            backgroundColor: kNewSubscriptionBackgroundColor,
                            label: 'New Subscription',
                            icon: FontAwesomeIcons.briefcase,
                            iconColor: kNewSubscriptionIconColor,
                          ),
                          QuickLinksItem(
                            backgroundColor: kCashStatementBackgroundColor,
                            label: 'Cash Statement',
                            icon: FontAwesomeIcons.fileContract,
                            iconColor: kCashStatementIconColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //color: Colors.blue[200],
                      child: Row(
                        children: [
                          QuickLinksItem(
                            backgroundColor: kPlacementBackgroundColor,
                            label: 'New Placement',
                            icon: FontAwesomeIcons.fileSignature,
                            iconColor: kPlacementIconColor,
                          ),
                          QuickLinksItem(
                            backgroundColor: kDebitBackgroundColor,
                            label: 'Live Trading',
                            icon: FontAwesomeIcons.chartLine,
                            iconColor: kDebitIconColor,
                          ),
                          QuickLinksItem(
                            backgroundColor: kOpenAccountBackgroundColor,
                            label: 'Open an Account',
                            icon: FontAwesomeIcons.handshake,
                            iconColor: kOpenAccountIconColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        children: [
                          SubHeadingText(
                            text: 'Cash Transactions',
                          ),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: myTransactions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: leadingItemDecider(
                                  myTransactions[index].type,
                                ),

                                // FaIcon(
                                //   myTransactions[index].icon,
                                //   color: Colors.red,
                                //   size: 16,
                                // ),
                                title: Text(
                                  myTransactions[index].description,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w400)
                                        .fontFamily,
                                    color: kTitleTextColor,
                                  ),
                                ),
                                subtitle: Text(myTransactions[index].date,
                                    style: TextStyle(
                                      fontSize: 9,
                                    )),
                                trailing: Text(
                                  myTransactions[index].currency +
                                      ' ' +
                                      myTransactions[index].amount,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w400)
                                        .fontFamily,
                                    color: kTitleTextColor,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuickLinksItem extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final String label;

  QuickLinksItem(
      {@required this.icon,
      @required this.backgroundColor,
      @required this.iconColor,
      @required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          onPressed: () {},
          child: Column(
            children: [
              Container(
                //width: 200,
                //height: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  // border: Border.all(
                  //   color: kTopUpBackgroundColor,
                  // ),
                  shape: BoxShape.circle,
                ),
                child: FaIcon(
                  icon,
                  size: 15,
                  color: iconColor,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontFamily:
                      GoogleFonts.montserrat(fontWeight: FontWeight.w300)
                          .fontFamily,
                  color: kTextColor,
                ),
              ),
            ],
          )),
    );
  }
}

class TransactionListIcon extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;

  TransactionListIcon({
    @required this.icon,
    @required this.backgroundColor,
    @required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 200,
      //height: 100,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        // border: Border.all(
        //   color: kTopUpBackgroundColor,
        // ),
        shape: BoxShape.circle,
      ),
      child: FaIcon(
        icon,
        size: 12,
        color: iconColor,
      ),
    );
  }
}

class SubHeadingText extends StatelessWidget {
  final String text;

  SubHeadingText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(25, 15, 10, 0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        //textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 12,
          color: kTitleTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class UserExpansionTileItem extends StatelessWidget {
  final IconData itemIcon;
  final String leadingText;
  final String subMenu1;

  UserExpansionTileItem({
    @required this.itemIcon,
    @required this.leadingText,
    @required this.subMenu1,
  });

  //final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200], width: 0.5),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Theme(
          data: theme,
          child: ExpansionTile(
            //expandedCrossAxisAlignment: CrossAxisAlignment.end,
            //backgroundColor: Colors.red,
            title: Text(leadingText, //'Settings',
                style: TextStyle(
                    fontFamily:
                        GoogleFonts.montserrat(fontWeight: FontWeight.w300)
                            .fontFamily,
                    fontSize: 11,
                    color: kBgDarkColor)),
            leading: FaIcon(
              itemIcon, //FontAwesomeIcons.cogs,
              size: 12,
              color: kBadgeColor,
            ),
            children: [
              SideSubMenuItem(
                  itemIcon: null, //FontAwesomeIcons.user,
                  itemText: subMenu1), //'My Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
