import 'package:flutter/material.dart';

import '../flutter_datawedge.dart';

class ButtonTabView extends StatefulWidget {
  final FlutterDataWedge fdw;

  const ButtonTabView({
    required this.fdw,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonTabView> createState() => _ButtonTabViewState();
}

class _ButtonTabViewState extends State<ButtonTabView> {
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Scan result',
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async => widget.fdw.enableScanner(true),
                child: const Text('Enable Scanner'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () async => widget.fdw.enableScanner(false),
                child: const Text('Disable Scanner'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.fdw.activateScanner(true),
                child: const Text('Activate Scanner'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.fdw.activateScanner(false),
                child: const Text('Deactivate Scanner'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.fdw.scannerControl(true),
                child: const Text('Scanner Control Activate'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.fdw.scannerControl(false),
                child: const Text('Scanner Control DeActivate'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.fdw.requestProfiles(),
                child: const Text('Request Profiles'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.fdw.requestActiveProfile(),
                child: const Text('Request active Profile'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.fdw.updateProfile(
                  profileName: 'data_wedge_demo',
                  pluginName: 'KEYSTROKE',
                  config: {
                    'keystroke_output_enabled': true,
                  },
                ),
                child: const Text('Enable KeyStroke Events'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.fdw.updateProfile(
                  profileName: 'data_wedge_demo',
                  pluginName: 'KEYSTROKE',
                  config: {
                    'keystroke_output_enabled': false,
                  },
                ),
                child: const Text('Disable KeyStroke Events'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
