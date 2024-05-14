import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_haven_admin/controller/responsive_provider.dart';
import 'package:tech_haven_admin/main/enddrawer/profile.dart';
import 'package:tech_haven_admin/main/responsive/responsive.dart';
import 'package:tech_haven_admin/main/drawer/menu.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResponsiveProvider>(
      builder: (context, value, child) {
        return Scaffold(
            key: value.scaffoldKey,
            drawer: !Responsive.isDesktop(context)
                ? const SizedBox(width: 250, child: Menu())
                : null,
            endDrawer: Responsive.isMobile(context)
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    // child: const Profile(),
                    child: const SizedBox(),
                  )
                : null,
            body: SafeArea(
              child: Row(
                children: [
                  if (Responsive.isDesktop(context))
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: const Menu()),
                    ),
                  Expanded(
                    flex: 8,
                    child: value.menu[value.currentCenterPage].page,
                  ),
                  if (!Responsive.isMobile(context))
                    const Expanded(
                      flex: 4,
                      child: Profile(),
                      // child: SizedBox(),
                    ),
                ],
              ),
            ));
      },
    );
  }
}
