import 'package:flutter/material.dart';
import 'package:tour/common/theme.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000)).then((v) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = HotelConceptThemeProvider.get();
    return Scaffold(
      body: Container(
        //color: themeData.accentColor,
        color: Colors.red,
        child: Center(
          child: Text(
            "Payment API Timeout",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
