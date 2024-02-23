import 'package:flutter/material.dart';
import 'package:gdsc_2024/pages/collab_screen.dart';
import 'package:gdsc_2024/pages/home_screen.dart';
import 'package:gdsc_2024/pages/messages_screen.dart';
import 'package:gdsc_2024/pages/request_screen.dart';
import 'package:gdsc_2024/pages/noti_screen.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class HomeBackground extends StatefulWidget {
  const HomeBackground({Key? key}) : super(key: key);

  @override
  State<HomeBackground> createState() => _HomeBackgroundState();
}

class _HomeBackgroundState extends State<HomeBackground> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;
  int _currentIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: buildDrawer(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset('assets/images/logo.png'),
      centerTitle: true,
      leading: IconButton(
        icon: Image.asset('assets/icons/menu.png'),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
            );
          },
          icon: Image.asset('assets/icons/noti.png'),
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      items: [
        _buildBottomNavigationBarItem(
          'Home',
          'assets/icons/home.png',
          0,
        ),
        _buildBottomNavigationBarItem(
          'Collab',
          'assets/icons/search-collab.png',
          1,
        ),
        _buildBottomNavigationBarItem(
          'Messages',
          'assets/icons/message-text.png',
          2,
        ),
        _buildBottomNavigationBarItem(
          'Request',
          'assets/icons/clipboard-tick.png',
          3,
        ),
      ],
      selectedItemColor: AppStyles.primaryColor1,
      unselectedItemColor: AppStyles.neutralColor7,
      showUnselectedLabels: true,
    );
  }

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      children: [
        HomeScreen(),
        CollabScreen(),
        MessagesScreen(),
        RequestScreen(),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String label, String iconPath, int index) {
    return BottomNavigationBarItem(
      icon: ColorFiltered(
        colorFilter: ColorFilter.mode(
          _isSelected(index)
              ? AppStyles.primaryColor1
              : AppStyles.neutralColor7,
          BlendMode.srcIn,
        ),
        child: Image.asset(iconPath),
      ),
      label: label,
    );
  }

  bool _isSelected(int index) {
    return _currentIndex == index;
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Handle item 1 tap
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item 2 tap
            },
          ),
          // Add more list items as needed
        ],
      ),
    );
  }
}
