import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed:onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
        ),
        overlayColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shape: const LinearBorder(
          bottom: LinearBorderEdge(
            size: 1,
          ),
          side: BorderSide(
            color: Colors.black12,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
