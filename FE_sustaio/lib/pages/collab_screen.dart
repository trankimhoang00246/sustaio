import 'package:flutter/material.dart';
import 'package:gdsc_2024/components/app_bar.dart';
import 'package:gdsc_2024/model/collab_form.dart';
import 'package:gdsc_2024/pages/collabdetails_screen.dart';
import 'package:gdsc_2024/services/collab_service.dart';
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
              border: Border.all(
                color: AppStyles.primaryColor1,
                width: 1.0,
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
            _buildRecommendedTab(),

            // Content of Tab 2
            _buildNewProfileTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedTab() {
    return FutureBuilder<List<Collab>>(
      future: CollabService().getAllCollab(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Collab> collabList = snapshot.data ?? [];
          return _buildListCardToCollab(collabList, context);
        }
      },
    );
  }

  Widget _buildNewProfileTab() {
    // You can add similar logic to fetch data for the New Profile tab
    return Center(
      child: Text('Tab 2 Content'),
    );
  }

  Widget _buildListCardToCollab(List<Collab> collabList, BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: collabList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              // Fetch collab details by id
              Collab selectedCollab =
                  await CollabService().getCollabById(collabList[index].id);

              // Navigate to CollabDetailsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CollabDetailsScreen(collab: selectedCollab),
                ),
              );
            },
            child: CollabCard(collabCard: collabList[index]),
          );
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
