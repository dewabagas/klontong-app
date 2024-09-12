import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klontong_app/presentation/core/constants/assets.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/dashboard/tabs/tab_about.dart';
import 'package:klontong_app/presentation/dashboard/tabs/tab_home.dart';
import 'package:klontong_app/presentation/dashboard/tabs/tab_profile.dart';

class PageDashboard extends StatefulWidget {
  final int bottomNavIndex;

  const PageDashboard({super.key, this.bottomNavIndex = 2});

  @override
  State<PageDashboard> createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard>
    with TickerProviderStateMixin {
  late int _bottomNavIndex;

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = [
    {
      'active': BottomBar.icAboutActive,
      'inactive': BottomBar.icAboutInactive,
      'title': 'About'
    },
    {
      'active': BottomBar.icProfileActive,
      'inactive': BottomBar.icProfileInactive,
      'title': 'Account'
    },
  ];

  final List<Widget> tabScreens = [
    const TabAbout(),
    const TabProfile(),
    const TabHome(),
  ];

  @override
  void initState() {
    super.initState();

    _bottomNavIndex = widget.bottomNavIndex;

    _fabAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _borderRadiusAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    fabCurve = CurvedAnimation(
        parent: _fabAnimationController,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn));
    borderRadiusCurve = CurvedAnimation(
        parent: _borderRadiusAnimationController,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn));

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation =
        Tween<double>(begin: 0, end: 1).animate(borderRadiusCurve);

    _hideBottomBarAnimationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);

    Future.delayed(
        const Duration(seconds: 1), () => _fabAnimationController.forward());
    Future.delayed(const Duration(seconds: 1),
        () => _borderRadiusAnimationController.forward());
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: NotificationListener<ScrollNotification>(
          child: tabScreens[_bottomNavIndex]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary.withOpacity(0.1),
        elevation: 0,
        child: SvgPicture.asset(BottomBar.icHome, width: 30.w, height: 30.w),
        onPressed: () {
          setState(() {
            _bottomNavIndex = 2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final iconPath = isActive
              ? iconList[index]['active']
              : iconList[index]['inactive'];
          final title = iconList[index]['title'] as String;
          final color = isActive ? AppColors.primary : AppColors.neutral;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath!, width: 24.w, height: 24.w),
              4.0.height,
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(title,
                      maxLines: 1,
                      style: TextStyles.medium10.copyWith(color: color)))
            ],
          );
        },
        backgroundColor: AppColors.white,
        activeIndex: _bottomNavIndex,
        splashColor: AppColors.white,
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 200,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        height: 80.h,
        elevation: 0,
        borderWidth: 0,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
        shadow: BoxShadow(
          offset: const Offset(0, 0),
          blurRadius: 4,
          spreadRadius: 0,
          color: const Color(0xFF3A3A3A).withOpacity(0.25),
        ),
      ),
    );
  }
}
