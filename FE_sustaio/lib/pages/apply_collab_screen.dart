import 'package:flutter/material.dart';
import 'package:gdsc_2024/model/collab_form.dart';
import 'package:gdsc_2024/services/collab_request_service.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class ApllyCollabScreen extends StatefulWidget {
  final Collab collab;

  const ApllyCollabScreen({
    Key? key, // Fix the parameter name to key
    required this.collab,
  }) : super(key: key); // Fix the super constructor

  @override
  State<ApllyCollabScreen> createState() => _ApllyCollabScreenState();
}

class _ApllyCollabScreenState extends State<ApllyCollabScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController describtionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    int _currentPage = 0;

    GlobalKey<FormState> _firstFormKey = GlobalKey<FormState>();
    GlobalKey<FormState> _secondFormKey = GlobalKey<FormState>();
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              _buildUserImage(context),
              _buildTextContent(),
            ],
          ),
          Material(
            elevation: 10,
            child: Container(
              width: deviceWidth,
              height: 0.75 * deviceHeight,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: PageView(
                controller: _pageController,
                // physics: NeverScrollableScrollPhysics(),
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildFirst(),
                  _buildSecond(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormBasic() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildInputField(
          nameController,
          'Họ và tên',
        ),
        _buildInputField(
          emailController,
          'Email',
        ),
        _buildInputField(
          addressController,
          'Địa chỉ',
        ),
        _buildInputField(
          phonenumberController,
          'Số điện thoại',
        ),
        _buildInputField(
          categoryController,
          'Lĩnh vực cây trồng',
        ),
      ],
    );
  }

  Widget _buildFormDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildButtonAddFile(),
        _buildInputField(
          titleController,
          'Tiêu đề',
        ),
        _buildDescField(
          describtionController,
          'Mô tả',
        )
      ],
    );
  }

  Widget _buildDescField(TextEditingController controller, String labelText) {
    return Container(
      width: 293,
      height: 212,
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mô tả'),
            TextField(
              controller: controller,
              maxLines: 7,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String labelText) {
    return Container(
      width: 293,
      height: 54,
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
          ),
        ),
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
            widget.collab.userDto.avatarUrl,
            width: 0.2 * MediaQuery.of(context).size.height,
            height: 0.2 * MediaQuery.of(context).size.height,
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
            widget.collab.content,
            style: AppStyles.Label,
            maxLines: 2, // Set your desired maximum number of lines
            overflow: TextOverflow.ellipsis, // Specify how to handle overflow
          ),
          Row(
            children: [
              Image.asset('assets/icons/discount.png'),
              Text(widget.collab.userDto.categoryAccount,
                  style: AppStyles.Body2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonAddFile() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Thêm tệp'),
    );
  }

  Widget _buildFirst() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin cơ bản',
            style: AppStyles.Heading3,
          ),
          SizedBox(height: 10),
          Text(
            'Điền dữ liệu cho hồ sơ. Quá trình này sẽ mất vài phút.',
            style: AppStyles.Body2,
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: _buildFormBasic(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSecond() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mô tả và minh chứng',
            style: AppStyles.Heading3,
          ),
          SizedBox(height: 10),
          Text(
            'Mô tả chi tiết và thêm minh chứng ̣̣̣̣̣( nếu có )',
            style: AppStyles.Body2,
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: _buildFormDetail(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonToNext(
    GlobalKey<FormState> formKey,
    PageController pageController,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          // if (formKey.currentState!.validate()) {
          //   pageController.nextPage(
          //     duration: Duration(milliseconds: 300),
          //     curve: Curves.easeInOut,
          //   );
          // }
          _submitForm();
        },
        child: Text(
          'Next',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    // Prepare your data for the API request
    Map<String, dynamic> requestData = {
      "fullName": nameController.text,
      "email": emailController.text,
      "phone": phonenumberController.text,
      "address": addressController.text,
      "description": describtionController.text,
      "photographicEvidenceUrl":
          'https://maynongnghiepbinhminh.com/wp-content/uploads/2022/08/de-an-co.jpg',
      "collabId": widget.collab.id
    };

    // Call the API using the provided function
    await CollabRequestService().postCollabRequest(requestData);
  }
}
