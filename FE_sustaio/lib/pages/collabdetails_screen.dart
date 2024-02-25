import 'package:flutter/material.dart';
import 'package:gdsc_2024/model/collab_form.dart';
import 'package:gdsc_2024/pages/apply_collab_screen.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class CollabDetailsScreen extends StatelessWidget {
  final Collab collab;

  const CollabDetailsScreen({
    Key? key, // Correct the parameter name to key
    required this.collab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Image.asset('assets/images/avtBr.png'),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: h * 0.4,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 0.6 * h,
              width: w,
              color: Colors.white,
              child: ListView(
                children: [
                  _buildDiscr(),
                  _buildAddDiscr(),
                  _buildConnectInfor(),
                ],
              ),
            ),
          ),
          Positioned(
            top: h * 0.29,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserImage(context),
                  _buildTextContent(),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0, right: 0, bottom: 0, child: _buildButtonApply(context)),
        ],
      ),
    );
  }

  Widget _buildUserImage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.network(
            collab.userDto.avatarUrl,
            width: 0.12 * MediaQuery.of(context).size.height,
            height: 0.12 * MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            collab.userDto.name,
            style: AppStyles.Heading3,
            maxLines: 2, // Set your desired maximum number of lines
            overflow: TextOverflow.ellipsis, // Specify how to handle overflow
          ),
          Row(
            children: [
              Image.asset('assets/icons/discount.png'),
              Text(
                collab.userDto.categoryAccount,
                style: AppStyles.Subtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscr() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mô tả',
            style: AppStyles.Heading3,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            collab.descEnterprise,
            style: AppStyles.Body1,
            maxLines: 7,
          ),
        ],
      ),
    );
  }

  Widget _buildAddDiscr() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/Groupfill.png'),
              Text(collab.categoryDto.name, style: AppStyles.Subtitle),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Image.asset('assets/icons/locationfill.png'),
              Text(collab.address, style: AppStyles.Subtitle),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/Contact.png'),
          )
        ],
      ),
    );
  }

  Widget _buildConnectInfor() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nội dung liên kết',
            style: AppStyles.Heading3,
          ),
          SizedBox(height: 15),
          Text(
            '\u2022 Asperger syndrome/Autism',
            style: AppStyles.Body1,
          ),
          Text(
            '\u2022 Tourette syndrome',
            style: AppStyles.Body1,
          ),
          Text(
            '\u2022 Diabetes',
            style: AppStyles.Body1,
          ),
          Text(
            '\u2022 Behavior challenged',
            style: AppStyles.Body1,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonApply(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 0.1 * MediaQuery.of(context).size.height,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ApllyCollabScreen(
                    collab: collab,
                  ),
                ),
              );
            },
            child: Text('Apply'),
          ),
        ),
      ),
    );
  }
}
