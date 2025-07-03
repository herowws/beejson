import 'package:bejson/home/provider.dart';
import 'package:bejson/home/widgets/dart_pannel.dart';
import 'package:bejson/home/widgets/json_pannel.dart';
import 'package:bejson/home/widgets/setting_pannel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final provider = HomeProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: provider,
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(child: SettingPannel(provider.config)),
                  VerticalDivider(
                    color: const Color(0xFFE0E0E0),
                    thickness: 1,
                    width: 60,
                  ),
                  Expanded(flex: 2, child: JsonPannel(provider: provider)),
                  VerticalDivider(
                    color: const Color(0xFFE0E0E0),
                    thickness: 1,
                    width: 60,
                  ),
                  Expanded(flex: 2, child: DartPannel(provider: provider)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
