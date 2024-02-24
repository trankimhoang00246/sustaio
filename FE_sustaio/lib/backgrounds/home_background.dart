import 'package:flutter/material.dart';
import 'package:gdsc_2024/pages/collab_screen.dart';
import 'package:gdsc_2024/pages/home_screen.dart';
import 'package:gdsc_2024/pages/messages_screen.dart';
import 'package:gdsc_2024/pages/request_screen.dart';
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
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BottomNavigationBar(
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
        unselectedItemColor: AppStyles.neutralColor7,
        selectedItemColor: AppStyles.primaryColor1,
        showUnselectedLabels: true,
        elevation: 10,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String label, String iconPath, int index) {
    return BottomNavigationBarItem(
      label: label,
      icon: ImageIcon(
        AssetImage(iconPath),
        color: _currentIndex == index
            ? AppStyles.primaryColor1
            : AppStyles.neutralColor7,
      ),
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

  bool _isSelected(int index) {
    return _currentIndex == index;
  }
}
