import 'package:flutter/material.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class OnboardingBackground extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;

  OnboardingBackground({
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildHeaders(context),
        _buildCircleOnRight(),
        _buildCircleOnLeft(),
        _buildLogo(),
        _buildIcon(),
      ],
    );
  }

  Widget _buildHeaders(BuildContext context) {
    return ClipPath(
      clipper: OnbClipper(context),
      child: Container(
        color: AppStyles.primaryColor1,
      ),
    );
  }

  Widget _buildCircleOnRight() {
    return Positioned(
      left: -0.22 * deviceWidth,
      top: 0.06 * deviceHeight,
      child: CustomPaint(
        size: Size(
          0.44 * deviceWidth,
          0.21 * deviceHeight,
        ),
        painter: CircleLeft(),
      ),
    );
  }

  Widget _buildCircleOnLeft() {
    return Positioned(
      left: 0.78 * deviceWidth,
      top: 0.32 * deviceHeight,
      child: CustomPaint(
        size: Size(
          0.44 * deviceWidth,
          0.21 * deviceHeight,
        ),
        painter: CircleRight(),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 0.25 * deviceHeight),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Logo(),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/Pines.png'),
            ],
          ),
        ],
      ),
    );
  }
}

class OnbClipper extends CustomClipper<Path> {
  final BuildContext context;

  OnbClipper(this.context);

  @override
  Path getClip(Size size) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double desiredWidth = deviceWidth;
    double desiredHeight = deviceHeight * 0.6;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(desiredWidth, 0);
    path.lineTo(desiredWidth, desiredHeight);
    path.cubicTo(
      desiredWidth * 0.8303256,
      desiredHeight * 0.9124108,
      desiredWidth * 0.6986667,
      desiredHeight,
      desiredWidth * 0.4800000,
      desiredHeight,
    );
    path.cubicTo(
      desiredWidth * 0.3470641,
      desiredHeight * 0.9929379,
      desiredWidth * 0.3087718,
      desiredHeight * 0.9607715,
      desiredWidth * 0.2253333,
      desiredHeight * 0.8677355,
    );
    path.cubicTo(
      desiredWidth * 0.1157890,
      desiredHeight * 0.8521984,
      desiredWidth * 0.06153154,
      desiredHeight * 0.8321263,
      0,
      desiredHeight * 0.7404810,
    );
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CircleLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffFFD482).withOpacity(1.0);

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width,
        height: size.height,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircleRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff67AEB6).withOpacity(1.0);

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width,
        height: size.height,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Text(
      'Subtaio',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Wendy One',
        fontSize: 0.077 * deviceHeight,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 1.0,
      ),
    );
  }
}
