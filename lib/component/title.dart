import 'package:flutter/material.dart';

class RenderTitle extends StatelessWidget {
  const RenderTitle({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor, size: 20),
          ),
          Flexible(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
