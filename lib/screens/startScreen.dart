import 'package:flutter/material.dart';
import 'package:superchat/screens/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class startScreen extends StatelessWidget {
  const startScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: 'logo',
              child: Padding(
                padding: const EdgeInsets.only(top: 98.0),
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 150),
            child: Text(
              "The Gen Z chatapp",
              style: GoogleFonts.sigmarOne(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
              child: Text(
                'We don"t need your data like others ,so relax and enjoy !',
                style: GoogleFonts.cabin(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              )),
          // Expanded(
          //   flex: 3,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         "We dont need your data ,so relax !",
          //         style: GoogleFonts.handlee(
          //             fontWeight: FontWeight.w600, fontSize: 20,color: Color(0xff16213E)),
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             " No Email ",
          //             style: GoogleFonts.lora(fontSize: 10,color: Color(0xff282A3A)),
          //           ),
          //           Image.asset('assets/gmail.png', width: 30, height: 30),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "No Phone ",
          //             style: GoogleFonts.lora(fontSize: 10,color: Color(0xff282A3A)),
          //           ),
          //           Image.asset('assets/call.png', width: 30, height: 30),
          //         ],
          //       ),
          //       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //         Text(
          //           "No oAuth ",
          //           style: GoogleFonts.lora(fontSize: 10,color: Color(0xff282A3A)),
          //         ),
          //         Image.asset('assets/facebook.png', width: 30, height: 30),
          //       ])
          //     ],
          //   ),
          // ),
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 65.0,
                width: 155.0,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      "Lets Go! ",
                      style: GoogleFonts.sigmarOne(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffFFBF00),
                    Color(0xff86B86B),
                  ]),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(55),
                    bottomLeft: Radius.circular(55),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
