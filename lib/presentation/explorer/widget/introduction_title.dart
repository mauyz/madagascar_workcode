import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroductionTitle extends StatelessWidget {
  const IntroductionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        elevation: 2,
        child: InkWell(
          onTap: () {
            context.go("/intro");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20.0,
            ),
            child: Text(
              "Introduction".toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
