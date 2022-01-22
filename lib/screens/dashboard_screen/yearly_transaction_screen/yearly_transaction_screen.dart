import 'package:flutter/material.dart';

class YearlyTransactionScreen extends StatefulWidget {
  const YearlyTransactionScreen({ Key? key }) : super(key: key);

  @override
  _YearlyTransactionScreenState createState() => _YearlyTransactionScreenState();
}

class _YearlyTransactionScreenState extends State<YearlyTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Yearly Transaction Screen"),
      ),
    );
  }
}