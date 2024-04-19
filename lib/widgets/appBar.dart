// ignore: file_names
import 'package:flutter/material.dart';
import 'package:resume_builder/fonts/fonts.dart';

// ignore: non_constant_identifier_names
Widget CustomAppBar({
  required BuildContext context,
  required String headingText,
  required Widget child,
}) {
  return Container(
    height: MediaQuery.of(context).size.height / 6,
    color: Colors.blueAccent.withOpacity(0.3),
    child: Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.blueAccent.withOpacity(0.5),
            padding: const EdgeInsets.only(
              top: 55,
              bottom: 45,
              left: 10,
              right: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.blueAccent.withOpacity(0.5),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.height / 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    headingText,
                    style: Fonts.HeadingFont,
                  ),
                  child,
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
