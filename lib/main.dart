// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:bejson/home/home.dart';
import 'package:bejson/home/provider.dart';
import 'package:bejson/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool kisweb;
  try {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      await windowManager.ensureInitialized();
      WindowOptions windowOptions = WindowOptions(
        size: Size(1000, 750),
        minimumSize: Size(800, 600),
        titleBarStyle: TitleBarStyle.normal,
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    } else {
      kisweb = true;
    }
  } catch (e) {
    kisweb = true;
  }

  await Storages.to.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeeJson',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0071E3),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Color(0xFF333333),
            fontFamily: 'PingFang SC',
          ),
        ),
      ),
      home: ListenableBuilder(
        listenable: HomeProvider(),
        builder: (context, child) => const HomePage(),
      ),
    );
  }
}
