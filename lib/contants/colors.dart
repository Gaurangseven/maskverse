import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xff01111e);

const Color whiteColor = Color(0xffffffff);

const Color buttonTextColor=Colors.blue;

const Color seletedColor=Color(0xffEFEFEF);

const Color bgcallcolor=Color(0xff112B3C);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  // border: InputBorder.none,
  hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xff0078AA), width: 2.0),
    bottom: BorderSide(color: Color(0xff0078AA), width: 2.0),
  ),
);