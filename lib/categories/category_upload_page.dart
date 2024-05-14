import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_haven_admin/categories/widgets/category_upload_widget.dart';
import 'package:tech_haven_admin/categories/widgets/cutsom_button.dart';
import 'package:tech_haven_admin/controller/responsive_provider.dart';
import 'package:tech_haven_admin/core/common/widgets/header_widget.dart';
import 'package:tech_haven_admin/editAll/edit_all_data.dart';
import 'package:tech_haven_admin/main/responsive/responsive.dart';

class CategoryUploadPage extends StatelessWidget {
  const CategoryUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveProvider = Provider.of<ResponsiveProvider>(context);
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
              const CategoryUploadWidget(),
              height(context),
              CustomButton(
                isLoading: false,
                onPressedButton: () {
                  responsiveProvider.changePage(7);
                },
                buttonText: 'Edit Categories Details',
              ),
              height(context),
              // // BarGraphCard(),
              // height(context),
            ],
          ),
        )));
  }
}
