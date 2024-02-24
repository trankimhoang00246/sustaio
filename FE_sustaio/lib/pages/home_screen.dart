import 'package:flutter/material.dart';
import 'package:gdsc_2024/model/news.dart';
import 'package:gdsc_2024/pages/noti_screen.dart';
import 'package:gdsc_2024/utils/app_styles.dart';
import 'package:gdsc_2024/utils/data_news.dart';
import 'package:gdsc_2024/widgets/hot_news_card.dart';
import 'package:gdsc_2024/widgets/regular_news_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar(context),
      key: _scaffoldKey,
      drawer: buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildListHotNews(deviceHeight),
              _buildListRegularNews(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
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

  Widget _buildHeader() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: AppStyles.Heading4,
          ),
          Text(
            "News & Popular",
            style: AppStyles.Heading3,
          ),
        ],
      ),
    );
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

  Widget _buildListHotNews(double deviceHeight) {
    return SizedBox(
      height: 0.26 * deviceHeight,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return HotNewsCard(news: newsList[index]);
        },
      ),
    );
  }

  Widget _buildListRegularNews() {
    return Expanded(
      child: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return RegularNewsCard(news: newsList[index]);
        },
      ),
    );
  }
}
