import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.38,
        color: Colors.blue,
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('denemeee')),
            Center(
              child: Text('denemeee'),
            ),
          ],
        ),
      ),
    );
  }
}
