import 'package:flutter/material.dart';
import 'package:tech_haven_admin/core/common/widgets/header_widget.dart';
import 'package:tech_haven_admin/main/responsive/responsive.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({
    super.key,
    // required this.scaffoldKey,
  });
  // final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    SizedBox height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              const Header(),
              height(context),
              // const ActivityDetailsCard(),
              height(context),
              // LineChartCard(),
              height(context),
              // BarGraphCard(),
              height(context),
            ],
          ),
        )));
  }
}
