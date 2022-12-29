import 'package:flutter/material.dart';
import 'package:superchat/contants/colors.dart';
import 'package:superchat/contants/custom_button.dart';
import 'package:superchat/contants/ktext.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool ischecked = false;

  onClicked() {
    setState(() {
      ischecked = !ischecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset('images/message_icon.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Center(
              child: KText(
                  text: "Terms and condtitons",
                  size: 24,
                  fontWeight: FontWeight.w400,
                  color: whiteColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: RichText(
                overflow: TextOverflow.clip,
                textAlign: TextAlign.end,

                textDirection: TextDirection.rtl,
                softWrap: true,

                // textScaleFactor: 1,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  text:
                      'To help you stay safe, chats are anonymous unless you tell someone who you are (not recommended!), and you can stop a chat at any time. See our  ',
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms of Service ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                    TextSpan(
                      text: 'and  ',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Community Guidelines ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: buttonTextColor),
                    ),
                    TextSpan(
                      text:
                          'for more info about the do’s and don’ts in using Super chat. Super chat video chat is moderated but no moderation is perfect. Users are solely responsible for their behavior while using Super Chat  ',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Checkbox(
                    activeColor: backgroundColor,
                    value: ischecked,
                    onChanged: ((value) => onClicked()),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Center(
                  child: KText(
                      text: "I agree to the Super chat’s terms and\nconditons",
                      size: 16,
                      fontWeight: FontWeight.w400,
                      color: whiteColor),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: CustomButton(text: 'GET  STARTED', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
