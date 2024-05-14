import 'package:flutter/material.dart';
import 'package:tech_haven_admin/categories/category_upload_page.dart';
import 'package:tech_haven_admin/customers/cutomers_page.dart';
import 'package:tech_haven_admin/editAll/edit_all_data.dart';
import 'package:tech_haven_admin/home/home_page.dart';
import 'package:tech_haven_admin/manageproducts/manage_products_page.dart';
import 'package:tech_haven_admin/model/menu_modal.dart';
import 'package:tech_haven_admin/orders/orders_page.dart';
import 'package:tech_haven_admin/uploadbanner/upload_banner_page.dart';
import 'package:tech_haven_admin/vendors/vendors_page.dart';
import 'package:tech_haven_admin/main/enddrawer/profile.dart';

class ResponsiveProvider extends ChangeNotifier {
  int currentCenterPage = 0;
  List<MenuModel> menu = [
    MenuModel(
        icon: 'assets/svg/home.svg',
        title: "Home",
        page: const HomePage(),
        endDrawer: const SizedBox()),
    MenuModel(
        icon: 'assets/svg/profile.svg',
        title: "Vendors",
        page: const VendorsPage(),
        endDrawer: const SizedBox()),
    MenuModel(
        icon: 'assets/svg/profile.svg',
        title: "Customers",
        page: const CustomersPage(),
        endDrawer: const SizedBox()),
    MenuModel(
        icon: 'assets/svg/setting.svg',
        title: "Orders",
        page: const OrdersPage(),
        endDrawer: const SizedBox()),
    MenuModel(
        icon: 'assets/svg/history.svg',
        title: "Upload Categories",
        page: const CategoryUploadPage(),
        endDrawer: const SizedBox()),
    MenuModel(
        icon: 'assets/svg/signout.svg',
        title: "Upload Brand and Banner",
        page: const UploadBannerPage(),
        endDrawer: const SizedBox()),
    MenuModel(
        icon: 'assets/svg/signout.svg',
        title: "Products",
        page: const ManageProductsPage(),
        endDrawer: const SizedBox()),
    MenuModel(
        icon: 'assets/svg/signout.svg',
        title: "Edit All",
        page: const EditAllDataPage(),
        endDrawer: const SizedBox()),
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
    notifyListeners();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
    notifyListeners();
  }

  void openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
    notifyListeners();
  }

  void closeEndDrawer() {
    scaffoldKey.currentState!.closeEndDrawer();
    notifyListeners();
  }

  void changePage(int index) {
    currentCenterPage = index;
    notifyListeners();
  }
}
