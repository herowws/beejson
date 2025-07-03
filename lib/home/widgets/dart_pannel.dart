import 'package:flutter/material.dart';

import '../../component/extend_input.dart';
import '../../component/title.dart';

class DartPannel extends StatelessWidget {
  const DartPannel({super.key, required this.provider});
  final dynamic provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          RenderTitle(icon: Icons.content_copy, title: 'Dart模型'),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: RenderExtendInput(
                maxLines: 100,
                hint: 'Dart 数据...',
                controller: provider.dartController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
