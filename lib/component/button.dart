import 'package:flutter/material.dart';

class RenderButton extends StatelessWidget {
  const RenderButton({
    super.key,
    this.icon,
    this.text,
    this.onPressed,
    this.backgroundColor,
  });
  final IconData? icon;
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: Colors.white, size: 20),
          ElevatedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor:
                  backgroundColor ?? Theme.of(context).primaryColor,
              foregroundColor: null,
            ),
            child: Text(
              text ?? '',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
