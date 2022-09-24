import 'package:flutter/material.dart';
import 'package:online_cog/Views/Screens/ViewContents/request_cog.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return const RequestCog();
  }
}
