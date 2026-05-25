import 'package:flutter/material.dart';
import '../utils/media_query_values.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool applyPadding;
  final bool applySafeArea;

  const BaseScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.applyPadding = true,
    this.applySafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = body;

    // Apply default padding globally using your BuildContext extension
    if (applyPadding) {
      content = Padding(
        padding: EdgeInsets.all(context.defaultPadding),
        child: content,
      );
    }

    // Wrap the body in a SafeArea
    if (applySafeArea) {
      content = SafeArea(child: content);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: content,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
