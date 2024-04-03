import 'package:flutter/material.dart';

class QuietBox extends StatelessWidget {
  late String title;
  late String subTitle;

  QuietBox({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              Text(
                subTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
