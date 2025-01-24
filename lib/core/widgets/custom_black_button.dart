import 'package:flutter/material.dart';
import 'package:notepad/core/constants/app_radius.dart';

class CustomBlackButton extends StatelessWidget {
  const CustomBlackButton({
    super.key,
    required this.hintText,
    required this.onPressed,
  });
  final Function() onPressed;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
        foregroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.onPrimary),
        elevation: WidgetStateProperty.all(8),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 30,
          ),
        ),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: AppRadius.large,
          ),
        ),
      ),
      child: Text(
        hintText,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
