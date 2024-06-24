import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/widgets/internet_exeption.dart';
import 'package:flutter_offline/flutter_offline.dart';

class OfflineWidget extends StatefulWidget {
  final Widget child;
  const OfflineWidget({super.key, required this.child});

  @override
  State<OfflineWidget> createState() => _OfflineWidgetState();
}

class _OfflineWidgetState extends State<OfflineWidget> {
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget item,
      ) {
        final bool connected = connectivity == ConnectivityResult.none;
        if (connected) {
          return const InternetExpetion();
        } else {
          return widget.child;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
