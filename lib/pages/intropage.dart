import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homescreen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(
                top: 140, bottom: 40, right: 80, left: 80),
            child: Image.asset('lib/images/avocado.png'),
          ),

          // we deliver groceries to your doorstep
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "We Deliver groceries at your Doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 48, fontWeight: FontWeight.w600),
            ),
          ),

          // fresh item everyday
          const Text(
            'Fresh Item Everyday',
          ),

          const SizedBox(
            height: 60,
          ),
          // get started button
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctc) => const HomeScreen())),
            child: Container(
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[500],
              ),
              padding: const EdgeInsets.all(24),
              child: Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
