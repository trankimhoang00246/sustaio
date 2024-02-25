import 'package:flutter/material.dart';
import 'package:gdsc_2024/model/collab_form.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class CollabCard extends StatelessWidget {
  final Collab collabCard;

  const CollabCard({super.key, required this.collabCard});

  @override
  Widget build(BuildContext context) {
    bool _isTapped = false;
    return Container(
      height: 0.19 * MediaQuery.of(context).size.height,
      width: 0.9 * MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: _buildDecoration(),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(right: 22),
                child: Row(
                  children: [
                    _buildUserImage(context),
                    SizedBox(width: 15),
                    _buildTextContent(),
                  ],
                ),
              ),
              _buildBottomCard(),
            ],
          )),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(15.0),
        bottom: Radius.circular(12),
      ),
      border: Border.all(
        color: Colors.grey,
        width: 1.0,
      ),
    );
  }

  Widget _buildUserImage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            collabCard.userDto.avatarUrl,
            width: 0.1 * MediaQuery.of(context).size.height,
            height: 0.1 * MediaQuery.of(context).size.height,
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
            collabCard.userDto.name,
            style: AppStyles.Label,
            maxLines: 2, // Set your desired maximum number of lines
            overflow: TextOverflow.ellipsis, // Specify how to handle overflow
          ),
          Row(
            children: [
              Image.asset('assets/icons/discount.png'),
              Text(
                collabCard.userDto.categoryAccount,
                style: AppStyles.Body2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset('assets/icons/Group.png'),
              Text(
                collabCard.categoryDto.name,
                style: AppStyles.Body2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset('assets/icons/location.png'),
              Text(
                collabCard.address,
                style: AppStyles.Body2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Image.asset('assets/icons/Vector.png'),
              Text(
                '4.5 ',
                style: AppStyles.Subtitle,
              ),
              Text(
                '(240 reviews)',
                style: AppStyles.Body1.copyWith(
                  color: Color(0xFF3B3B3B),
                ),
              )
            ],
          ),
        ),
        if (collabCard.verified)
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Image.asset('assets/icons/Checked.png'),
          ),
      ],
    );
  }

  Widget _buildHeartIcon(bool _isTapped) {
    return GestureDetector(
      onTap: () {
        // Toggle the tapped state when the icon is pressed
        _isTapped = !_isTapped;
      },
      child: SizedBox(
        width: 24.0, // Set your desired width
        height: 24.0, // Set your desired height
        child: _isTapped
            ? Image.asset('assets/icons/like.png')
            : Image.asset('assets/icons/like-filled.png'),
      ),
    );
  }
}
