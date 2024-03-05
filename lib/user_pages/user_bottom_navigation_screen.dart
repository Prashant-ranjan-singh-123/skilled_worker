import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:developer';
// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:v_bhartiya/user_pages/landing_page.dart';
import 'package:v_bhartiya/user_pages/billing_screen.dart';
import 'package:v_bhartiya/user_pages/user_notification_screen.dart';
import 'package:v_bhartiya/user_pages/user_profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// class MainScreenUser extends StatefulWidget {
//   @override
//   State<MainScreenUser> createState() => _MainScreenUserState();
// }
//
// class _MainScreenUserState extends State<MainScreenUser> {
//   final _pageController = PageController(initialPage: 0);
//   final _controller = NotchBottomBarController(index: 0);
//   int maxCount = 4;
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   final List<Widget> bottomBarPages = [
//     const LandingPage(),
//     const UserNotification(),
//     BillingScreen(),
//     UserProfile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Theme.of(context).colorScheme.primary,
//       statusBarBrightness: Brightness.dark,
//       statusBarIconBrightness: Brightness.dark,
//     ));
//
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         children: List.generate(
//           bottomBarPages.length,
//               (index) => bottomBarPages[index],
//         ),
//       ),
//       bottomNavigationBar: bottomBarPages.length <= maxCount
//           ? Align(
//         alignment: Alignment.bottomCenter,
//         child: AnimatedNotchBottomBar(
//           notchBottomBarController: _controller,
//           color: Theme.of(context).colorScheme.primary,
//           showLabel: false,
//           notchColor: Theme.of(context).colorScheme.surface,
//           removeMargins: false,
//           bottomBarWidth: MediaQuery.of(context).size.width,
//           durationInMilliSeconds: 250,
//           showShadow: true,
//           bottomBarItems: [
//             BottomBarItem(
//               inActiveItem: Padding(
//                 padding: const EdgeInsets.only(bottom: 4.0),
//                 child: Icon(
//                   Icons.home_filled,
//                   color: Theme.of(context).colorScheme.background,
//                 ),
//               ),
//               activeItem: Icon(
//                 Icons.home_filled,
//                 color: Theme.of(context).colorScheme.background,
//               ),
//               itemLabel: 'Page 1',
//             ),
//             BottomBarItem(
//               inActiveItem: Padding(
//                 padding: EdgeInsets.only(bottom: 4.0),
//                 child: Icon(
//                   Icons.notifications,
//                   color: Theme.of(context).colorScheme.background,
//                 ),
//               ),
//               activeItem: Icon(
//                 Icons.notifications,
//                 color: Theme.of(context).colorScheme.background,
//               ),
//               itemLabel: 'Page 2',
//             ),
//             BottomBarItem(
//               inActiveItem: Padding(
//                 padding: EdgeInsets.only(bottom: 4.0),
//                 child: Icon(
//                   Icons.payment_rounded,
//                   color: Theme.of(context).colorScheme.background,
//                 ),
//               ),
//               activeItem: Icon(
//                 Icons.payment_rounded,
//                 color: Theme.of(context).colorScheme.background,
//               ),
//               itemLabel: 'Page 3',
//             ),
//             BottomBarItem(
//               inActiveItem: Padding(
//                 padding: EdgeInsets.only(bottom: 4.0),
//                 child: Icon(
//                   Icons.face,
//                   color: Theme.of(context).colorScheme.background,
//                 ),
//               ),
//               activeItem: Icon(
//                 Icons.face,
//                 color: Theme.of(context).colorScheme.background,
//               ),
//               itemLabel: 'Page 4',
//             ),
//           ],
//           onTap: (index) {
//             log('current selected index $index');
//             _pageController.jumpToPage(index);
//           },
//           kIconSize: 1.2,
//           kBottomRadius: 6,
//         ),
//       )
//           : null,
//     );
//   }
// }


class MainScreenUser extends StatefulWidget {
  const MainScreenUser({super.key});

  @override
  State<MainScreenUser> createState() => _MainScreenUserState();
}

class _MainScreenUserState extends State<MainScreenUser> {
  int index = 2;
  final screen = [
    const LandingPage(),
    const UserNotification(),
    BillingScreen(),
    UserProfile(),
  ];
  Color bottomNavBarBack= Colors.black;
  Color bottomNavBarIconActive= Colors.black;
  Color bottomNavBarIcon= Colors.white30;
  Color bottomNavBarActiveBox= Colors.white;
  Color bottomNavBarText = Colors.white;
  Color tabBackgroundColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.home, size: 30),
      const Icon(Icons.notifications, size: 30),
      const Icon(Icons.payment_rounded, size: 30),
      const Icon(Icons.face, size: 30)
    ];
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      extendBody: true,
      body: screen[index],
      // Center(
      //   child: Text(
      //     '$index',
      //     style: const TextStyle(
      //         fontSize: 110, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      // ),

      // bottomNavigationBar:
      // CurvedNavigationBar(
      //   // navigationBar colors
      //   color: Theme.of(context).colorScheme.primary,
      //   //selected times colors
      //   buttonBackgroundColor: Theme.of(context).colorScheme.background,
      //   backgroundColor: Colors.transparent,
      //   animationCurve: Curves.bounceOut,
      //   animationDuration: Duration(milliseconds: 400),
      //   items: items,
      //   height: 60,
      //   index: index,
      //   onTap: (index) => setState(
      //         () => this.index = index,
      //   ),
      // ),


        bottomNavigationBar: GNav(
          gap: 8,
            backgroundColor: Colors.black,
            tabBackgroundColor: tabBackgroundColor,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconColor: bottomNavBarIcon,
                iconActiveColor: bottomNavBarIconActive,
                textColor: bottomNavBarText,
              ),
              GButton(
                icon: Icons.heart_broken,
                text: 'Likes',
                iconColor: bottomNavBarIcon,
                iconActiveColor: bottomNavBarIconActive,
                textColor: bottomNavBarText,
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                iconColor: bottomNavBarIcon,
                iconActiveColor: bottomNavBarIconActive,
                textColor: bottomNavBarText,
              ),
              GButton(
                icon: Icons.verified_user,
                text: 'Profile',
                iconColor: bottomNavBarIcon,
                iconActiveColor: bottomNavBarIconActive,
                textColor: bottomNavBarText,
              )
            ]
        )
    );
  }
}