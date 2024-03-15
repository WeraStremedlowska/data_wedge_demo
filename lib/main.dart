import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:data_wedge_demo/widgets/button_tab_view.dart';
import 'package:data_wedge_demo/widgets/log_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flutter_datawedge.dart';

void main() {
  runZonedGuarded(
        () async {
      final binding = WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      final flutterOnError = FlutterError.onError;
      FlutterError.onError = (errorDetails) {
        flutterOnError?.call(errorDetails);
        log(errorDetails.toString());
      };
      _showApp(binding, const MyApp());
    },
        (error, stackTrace) {
      log(error.toString());
    },
  );
}

void _showApp(WidgetsBinding binding, Widget screen) {
  binding
  // ignore: invalid_use_of_protected_member
    ..scheduleAttachRootWidget(binding.wrapWithDefaultView(screen),)
    ..scheduleForcedFrame();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterDataWedge fdw = FlutterDataWedge();
  Future<void>? initScannerResult;
  late StreamSubscription onScanSubscription;

  @override
  void initState() {
    super.initState();
    initScannerResult = initScanner();
  }

  Future<void> initScanner() async {
    if (Platform.isAndroid) {
      await fdw.initialize();
      await fdw.createDefaultProfile(profileName: "data_wedge_demo");
      onScanSubscription = fdw.onScanResult.listen((ScanResult result) {
        print(result.data);
      });
    }
  }

  @override
  void dispose() {
    onScanSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initScannerResult,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            log('Error: ${snapshot.error}');
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          }
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text('DataWedge Demo'),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Scan'),
                    Tab(text: 'Event Log'),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  ButtonTabView(fdw: fdw),
                  LogTabView(fdw),
                ],
              ),
            ),
          );
        });
  }
}
