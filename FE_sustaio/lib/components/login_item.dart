import 'package:flutter/material.dart';
import 'package:gdsc_2024/utils/app_styles.dart';
import 'package:google_fonts/google_fonts.dart';

double deviceHeight = 0.0;
double deviceWidth = 0.0;

class LoginItem extends StatefulWidget {
  const LoginItem({Key? key}) : super(key: key);

  @override
  State<LoginItem> createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 0.07 * deviceHeight),
              _buildInputForm(context, usernameController),
              SizedBox(height: 0.01 * deviceHeight),
              _buildInputForm(context, passwordController, isPassword: true),
              _buildRowSupport(),
              _buildButton(),
              _buildTextNavigator(),
              SizedBox(height: 0.07 * deviceHeight),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputForm(BuildContext context, TextEditingController controller,
      {bool isPassword = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 0.8 * deviceWidth,
          height: 0.1 * deviceHeight,
          decoration: const BoxDecoration(
            color: Color(0xFFE6E8EC),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
              bottom: Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                obscureText: isPassword,
                decoration: InputDecoration(
                  labelText: isPassword ? 'Password' : 'Username',
                  suffixIcon: isPassword
                      ? Image.asset('assets/icons/Lock.png')
                      : Image.asset('assets/icons/mail.png'),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Container(
      height: 0.06 * deviceHeight,
      width: 0.76 * deviceWidth,
      decoration: const BoxDecoration(
        color: AppStyles.primaryColor1,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            print('Sign in button was pressed');
          },
          child: Text(
            "Sign in",
            style: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowSupport() {
    return Container(
      margin: EdgeInsets.only(
        top: 0.039 * deviceHeight,
        bottom: 0.06 * deviceHeight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildRememberPassword(),
          _buildForgotPassword(),
        ],
      ),
    );
  }

  Widget _buildRememberPassword() {
    return Row(
      children: [
        Checkbox(
          value: rememberUser,
          onChanged: (value) {
            setState(() {
              rememberUser = value!;
            });
          },
          activeColor: AppStyles
              .primaryColor1, // Change to your desired color when active
        ),
        Text(
          "Nhớ mật khẩu",
          style: AppStyles.Body1,
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return GestureDetector(
        onTap: () {
          print('Forget password button was pressed');
        },
        child: Text(
          "Quên mật khẩu ?",
          style: AppStyles.Body1.copyWith(
            color: AppStyles.primaryColor1,
          ),
        ));
  }
}

Widget _buildTextNavigator() {
  return Container(
    margin: EdgeInsets.only(top: 0.02 * deviceHeight),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account ?",
          style: AppStyles.Body1.copyWith(
            color: AppStyles.primaryColor1,
          ),
        ),
        GestureDetector(
          onTap: () {
            print('Sign up button was pressed');
          },
          child: const Text(
            " Sign up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
