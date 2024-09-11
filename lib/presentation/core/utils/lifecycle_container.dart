import 'dart:developer';

import 'package:flutter/material.dart';

class LifecycleContainer extends StatefulWidget {
  final Widget child;

  const LifecycleContainer({Key? key, required this.child}) : super(key: key);
  @override
  LifecycleContainerState createState() => LifecycleContainerState();
}

class LifecycleContainerState extends State<LifecycleContainer>
    with WidgetsBindingObserver {
  AppLifecycleState? _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_lastLifecycleState) {
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        //TODO: perform functions for exiting/pausing the app like changing user status to offline
        break;

      case AppLifecycleState.resumed:
      //TODO: perform functions like changing user status to online
      default:
    }
    log('App Life Cycle state ===> $_lastLifecycleState.');

    return widget.child;
  }
}
