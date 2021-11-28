import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color color;
  final String url;
  const Topic({
    Key? key,
    required this.text,
    required this.textColor,
    required this.color,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 100,
                width: 100,
                child: Image.asset(url)),
              Spacer(),
              Text(text,
                  style: TextStyle(
                      color: textColor.withOpacity(1),
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}
