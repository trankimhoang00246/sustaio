import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today",
          style: TextStyle(
            fontSize: 28,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        Text(
          "News & Popular",
          style: TextStyle(
            fontSize: 28,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
