import 'package:flutter/material.dart';
import 'package:iconnexz/VendorLandingPage/VendorLandingPage.dart';
import 'package:iconnexz/VendorManageService/CreateService.dart';
import 'package:iconnexz/VendorOrders/Orders.dart';
import 'package:iconnexz/VendorReports/Reports.dart';
import 'package:iconnexz/VendorVoucher/Voucher.dart';
import 'package:iconnexz/components/side_menu_mobile.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/components/sidebar_mobile.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:iconnexz/VendorDashboard/Dashboard.dart';
import 'package:iconnexz/VendorManageService/ManageService.dart';
import 'package:iconnexz/responsive.dart';
import 'package:provider/provider.dart';

import '../components/side_menu.dart';

class MainScreenReports extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MainScreenReports> {
  int navIndex = 7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: Sidenav(navIndex, (int index) {
        setState(() {
          navIndex = index;
        });
      }),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: Sidenav(navIndex, (int index) {
        setState(() {
          navIndex = index;
        });
      }),
              ),
              if (Responsive.isMobile(context))
              Container(
                width: 60,
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SidenavMobile(navIndex, (int index) {
        setState(() {
          navIndex = index;
        });
      }),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Reports(),
            ),
          ],
        ),
      ),
    );
  }
}
