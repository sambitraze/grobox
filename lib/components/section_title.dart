
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
        ),
        const Spacer(),
        TextButton(
          onPressed: press,
          child: const Text(
            "See All",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
