import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return buildUI(context);
  }

  Widget buildUI(BuildContext context) {
    Color valueColor = const Color(0xFF43C6AC);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 8),
          //Text('Loading...', style: Styles.body1TextStyle)
        ],
      ),
    );
  }
}