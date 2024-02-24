import 'package:flutter/material.dart';
import 'package:gdsc_2024/components/app_bar.dart';
import 'package:gdsc_2024/utils/app_styles.dart';
import 'package:gdsc_2024/utils/data_collab.dart';
import 'package:gdsc_2024/widgets/collab_card.dart';

class CollabScreen extends StatelessWidget {
  const CollabScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TitleAppbar(title: 'Collab'),
          actions: [
            _buildIconSearch(),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Recommended'),
              Tab(text: 'New Profile'),
            ],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // Set border for the selected tab
              border: Border.all(
                color: AppStyles.primaryColor1, // Border color
                width: 1.0, // Width of the border
              ),
            ),
            labelColor: AppStyles.primaryColor1,
            unselectedLabelColor: Color(0xffB4B4C3),
            labelStyle: AppStyles.Body1,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        body: TabBarView(
          children: [
            // Content of Tab 1
            _buildListCardToCollab(),

            // Content of Tab 2
            Center(
              child: Text('Tab 2 Content'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListCardToCollab() {
    return Expanded(
      child: ListView.builder(
        itemCount: collabList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                print("This card was tapped");
              },
              child: CollabCard(collabCard: collabList[index]));
        },
      ),
    );
  }

  Widget _buildIconSearch() {
    return IconButton(
      onPressed: () {},
      icon: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65),
        ),
        child: Image.asset('assets/icons/search.png'),
      ),
    );
  }
}
