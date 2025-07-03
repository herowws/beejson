import 'package:bejson/component/button.dart';
import 'package:bejson/home/provider.dart';
import 'package:bejson/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';

import '../../component/input.dart';
import '../../component/title.dart';

class JsonPannel extends StatelessWidget {
  const JsonPannel({super.key, required this.provider});
  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RenderTitle(icon: Icons.link, title: 'API请求'),
        Row(
          children: [
            Expanded(
              child: RenderInput(
                controller: provider.apiController,
                hint: '请输入API地址',
                prefixIcon: _buildPopup(
                  method: provider.httpMethod,
                  onChange: (value) {
                    Navigator.of(context).pop();
                    provider.httpMethod = value;
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
            RenderButton(
              icon: Icons.arrow_circle_down,
              text: '获取数据',
              onPressed: provider.onRequest,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: RenderTitle(icon: Icons.settings_ethernet, title: 'JSON输入'),
        ),
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
            child: RenderInput(
              maxLines: 100,
              hint: '在此粘贴JSON数据...',
              controller: provider.jsonController,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RenderButton(
                icon: Icons.delete,
                text: '清空',
                onPressed: provider.clearText,
              ),
              //RenderButton(icon: Icons.copy, text: '粘贴', onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class _buildPopup extends StatelessWidget {
  const _buildPopup({required this.method, this.onChange});
  final HttpMethod method;
  final Function(HttpMethod)? onChange;

  Widget _buildItem(HttpMethod method) {
    return GestureDetector(
      onTap: () => onChange?.call(method),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          method.toString(),
          style: TextStyle(
            fontSize: 13,
            letterSpacing: -0.5,
            fontWeight: FontWeight.bold,
            color: method.toColor(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 12,
      letterSpacing: -0.5,
      height: 1.3,
      fontWeight: FontWeight.bold,
      color: Color(0xFFE07742),
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: CustomPopup(
        barrierColor: Colors.transparent,
        showArrow: false,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: HttpMethod.values.map(_buildItem).toList(),
        ),
        child: UnconstrainedBox(
          child: Text(method.toString(), style: textStyle),
        ),
      ),
    );
  }
}
