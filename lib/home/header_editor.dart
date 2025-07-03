import 'package:flutter/material.dart';

class HeaderEditor extends StatefulWidget {
  const HeaderEditor({super.key});

  @override
  State<HeaderEditor> createState() => _HeaderEditorState();
}

class _HeaderEditorState extends State<HeaderEditor> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 6,
            margin: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Column(children: [Text('developing...')]),
          ),
        ],
      ),
    );
  }
}
