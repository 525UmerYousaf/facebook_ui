import 'package:facebook_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/widgets.dart';
import 'screens.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null,
        // body: _screens[_selectedIndex],
        //  Although by above code i'm able to change the body
        //  according to each tab selected, but instead following
        //  approach is better.
        // body: TabBarView(
        //   physics: NeverScrollableScrollPhysics(),
        //  With above property now, I can only move screen when
        //  button is tapped but animation of swipping works.
        //   children: _screens,
        // ),
        //  By using above I can now scroll even by swapping left
        //  and right on the screens.
        //  Since, app being developed is for both mobile and desktop
        //  so, below approach is more better.
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        //  Benefit of using above property is bcz when user tap on any
        //  tab while scrolling then by using above property user can
        //  continue scrolling from point where user left, while with
        //  "TabBarView" the screen will be re-rendered & user will be
        //  back to top of screen each time user changes the tabs.
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
