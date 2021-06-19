import 'package:flutter/material.dart';

class UpiScreen extends StatefulWidget {
  const UpiScreen({Key? key}) : super(key: key);

  @override
  _UpiScreenState createState() => _UpiScreenState();
}

class _UpiScreenState extends State<UpiScreen> {
  TextStyle headingStyle = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1.2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: null,
        ),
        title: Text(
          'Savings',
          style: headingStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Pay through UPI',
              style: headingStyle,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: ListTile(
              title: TextField(
                keyboardType: TextInputType.phone,
                // maxLength: 10,
                decoration: InputDecoration(
                  hintText: 'Enter UPI Number',
                  hoverColor: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[300],
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
