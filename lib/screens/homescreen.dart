import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superchat/contants/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_ripple/flutter_ripple.dart';
import 'package:superchat/screens/chatScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum topicsAvailable {
  noOne,
  javascript,
  music,
  flutter,
  sports,
  food,
  java,
  python
}

topicsAvailable selectedTopic = topicsAvailable.noOne;

bool iconSelected = false;
bool javas = false;
bool kotlins = false;
bool pythons = false;
bool reacts = false;
bool javascripts = false;
bool flutters = false;
bool nodejss = false;
late int passcheck;

// Languages Selectedlanguage = Languages.none;
double onoffsize = 65;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? controller2;
  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0,
  );

  @override
  void initState() {
    // animationcontroller =
    //     AnimationController(vsync: this, duration: const Duration(seconds: 80));
    // animationcontroller.repeat();
    super.initState();
    controller = AnimationController(vsync: this);
    controller2 = AnimationController(vsync: this);
    controller!.repeat(
      // min: 0.0,
      // max: 1.0,
      period: const Duration(seconds: 70),
      // reverse: true,
    );
    controller2!.repeat(
      // min: 0.0,
      // max: 1.0,
      period: const Duration(seconds: 90),
      // reverse: true,
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  void passValue() {
    if (selectedTopic == topicsAvailable.python) {
      passcheck = 6;
    } else if (selectedTopic == topicsAvailable.java) {
      passcheck = 4;
    } else if (selectedTopic == topicsAvailable.javascript) {
      passcheck = 3;
    } else if (selectedTopic == topicsAvailable.food) {
      passcheck = 5;
    } else if (selectedTopic == topicsAvailable.sports) {
      passcheck = 2;
    } else if (selectedTopic == topicsAvailable.flutter) {
      passcheck = 1;
    } else if (selectedTopic == topicsAvailable.music) {
      passcheck = 7;
    } else {
      passcheck = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(
      scheme: 'https',
      host: 'gaurangmishragm7.com',
    );
    return Material(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MaskVerse',
                style: GoogleFonts.carterOne(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Hero(
                tag: 'logo',
                child: FlutterRipple(
                  rippleColor: Color(0xffFCC72C),
                  radius: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Image.asset(
                      'assets/logoin.png',
                      height: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
          elevation: 10,
          backgroundColor: const Color(0xff112B3C),
        ),
        // AppBar(
        //   toolbarHeight: 60,
        //   backgroundColor: backgroundColor,
        //   elevation: 20,
        //   title: Text('MaskVerse'),
        // ),
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('Select a category to chat',
                    style: GoogleFonts.rubikBubbles(
                        color: Colors.white, fontSize: 20)),
              ),
            ),
            // const SizedBox(
            //   height: 100,
            // ),
            Expanded(
              flex: 3,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: <Widget>[
                        FlutterRipple(
                          child: Container(),
                          rippleColor: Colors.green.withOpacity(0.1),
                          radius: 100,
                        ),
                        DottedBorder(
                          color: Colors.white,
                          borderType: BorderType.Circle,
                          dashPattern: const [15],
                          radius: const Radius.circular(22),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              width: 75,
                              height: 85,
                              decoration: const BoxDecoration(
                                  // color: const Color(0xFF0C7D0D).withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(220))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DottedBorder(
                      color: Colors.white,
                      borderType: BorderType.Circle,
                      dashPattern: const [15],
                      radius: const Radius.circular(12),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: const BoxDecoration(
                              // color: const Color(0xFF0C7D0D).withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(220))),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: turnsTween.animate(controller2!),
                      child: Transform.translate(
                        offset: const Offset(60, -40),
                        child: GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('I got Java Click');
                            }
                            setState(() {
                              selectedTopic = topicsAvailable.java;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: selectedTopic == topicsAvailable.java
                                    ? seletedColor
                                    : bgcallcolor),
                            height: 75.0,
                            width: 75.0,
                            child: Image.asset('assets/java.png'),
                          ),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: turnsTween.animate(controller2!),
                      child: Transform.translate(
                        offset: const Offset(-10, 70),
                        child: GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('I got Python Click');
                            }
                            setState(() {
                              selectedTopic = topicsAvailable.python;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: selectedTopic == topicsAvailable.python
                                    ? seletedColor
                                    : bgcallcolor),
                            height: 75.0,
                            width: 75.0,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('assets/mentalhealth.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: turnsTween.animate(controller2!),
                      child: Transform.translate(
                        offset: const Offset(-60, -40),
                        child: GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('I got Food Click');
                            }
                            setState(() {
                              selectedTopic = topicsAvailable.food;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: selectedTopic == topicsAvailable.food
                                    ? seletedColor
                                    : bgcallcolor),
                            height: 80.0,
                            width: 80.0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset('assets/food.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: controller!,
                      child: Transform.translate(
                        offset: const Offset(-150, 0),
                        child: GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('I got Music Click');
                            }
                            setState(() {
                              selectedTopic = topicsAvailable.music;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: selectedTopic == topicsAvailable.music
                                    ? seletedColor
                                    : bgcallcolor),
                            height: 75.0,
                            width: 75.0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset('assets/music.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: controller!,
                      child: Transform.translate(
                        offset: const Offset(150, -0),
                        child: GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('I got Sports Click');
                            }
                            setState(() {
                              selectedTopic = topicsAvailable.sports;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: selectedTopic == topicsAvailable.sports
                                    ? seletedColor
                                    : bgcallcolor),
                            height: 75.0,
                            width: 75.0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset('assets/soccer.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: controller!,
                      child: Transform.translate(
                        offset: const Offset(0, -150),
                        child: GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('I got Flutter Click');
                            }
                            setState(() {
                              selectedTopic = topicsAvailable.flutter;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: selectedTopic == topicsAvailable.flutter
                                    ? seletedColor
                                    : bgcallcolor),
                            height: 75.0,
                            width: 75.0,
                            child: Image.asset('assets/flutter.png'),
                          ),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: controller!,
                      child: Transform.translate(
                        offset: const Offset(0, 150),
                        child: GestureDetector(
                          child: GestureDetector(
                            onTap: () {
                              if (kDebugMode) {
                                print('I got Javascript Click');
                              }
                              setState(() {
                                selectedTopic = topicsAvailable.javascript;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(40)),
                                  color: selectedTopic ==
                                          topicsAvailable.javascript
                                      ? seletedColor
                                      : bgcallcolor),
                              height: 75.0,
                              width: 75.0,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset('assets/study.png',height: 75,width: 75,),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                passValue();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            filler: passcheck,
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 38.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(30)),
                    height: 50,
                    width: 200,
                    child: Center(
                      child: Text('Start Chat',
                          style: GoogleFonts.bungee(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchInBrowser(
                    Uri.parse("https://gaurangmishragm7.carrd.co/"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Developer",
                    style:
                        GoogleFonts.kenia(color: Colors.white70, fontSize: 10),
                  ),
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/www.png',
                    height: 20,
                    width: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
