import 'dart:async';

import 'package:facl_locker_room/componets/componets.dart';
import 'package:facl_locker_room/theme/app_colours.dart';
import 'package:facl_locker_room/util/extensions.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _versionNumber = 1.0;
  late final StreamController<double> _versionNumberStreamController;
  late final StreamController<Color> _bgColourStreamController;

  @override
  void initState() {
    super.initState();
    _versionNumberStreamController = StreamController();
    _bgColourStreamController = StreamController();
  }

  @override
  void dispose() {
    _versionNumberStreamController.close();
    _bgColourStreamController.close();
    super.dispose();
  }

  void _increaseVersionNumber() {
    _versionNumber += 0.1;
    _versionNumberStreamController.add(double.parse(_versionNumber.toStringAsFixed(1)));
    _changeBgColour(BgColour.greenish);
  }

  void _decreaseVersionNumber() {
    _versionNumber -= 0.1;
    _versionNumberStreamController.add(double.parse(_versionNumber.toStringAsFixed(1)));
    _changeBgColour(BgColour.purpleShadeLight);
  }

  void _changeBgColour(BgColour bgColour) {
    _bgColourStreamController.sink.add(bgColour.bgColour);
    _showSnackBar(bgColour.colourName);
  }

  void _showSnackBar(String colour) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('New background colour has been updated to $colour'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<Color>(
                    stream: _bgColourStreamController.stream,
                    initialData: BgColour.purpleShadeLight.bgColour,
                    builder: (context, snapshot) {
                      final bgColour = snapshot.data!;
                      return ExpandedView(
                        bgColour: bgColour,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    color: AppColours.offWhite,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset('assets/images/safe_box.png'),
                                ),
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Welcome to FACL locker room. \n',
                                style: context.textTheme.bodyText1,
                                children: [
                                  TextSpan(
                                    text: 'Here you can save as much as you want for the raining days ahead.',
                                    style: context.textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                ExpandedView(
                  bgColour: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ReuseableButton.outlined(
                        onPressed: _increaseVersionNumber,
                        text: 'Get Started',
                      ),
                      const SizedBox(height: 20),
                      ReuseableButton.outlined(
                        onPressed: _decreaseVersionNumber,
                        text: 'I already have an account',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            StreamBuilder<double>(
                stream: _versionNumberStreamController.stream,
                initialData: _versionNumber,
                builder: (context, snapshot) {
                  final versionNumber = snapshot.data;
                  return ReuseableButton(
                    onPressed: () {},
                    text: 'Version $versionNumber',
                    textColour: Colors.white,
                    size: Size(MediaQuery.of(context).size.width / 2.5, 20),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

enum BgColour {
  purpleShadeLight(bgColour: AppColours.purpleShadeLight, colourName: 'purple'),
  greenish(bgColour: AppColours.greenish, colourName: 'green');

  const BgColour({
    required this.bgColour,
    required this.colourName,
  });
  final Color bgColour;
  final String colourName;
}
