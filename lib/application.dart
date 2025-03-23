import 'package:flutter/material.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:hidden_labyrinths/router_controller.dart';
import 'package:provider/provider.dart';

class Application extends StatefulWidget {
  const Application({super.key, required this.preferencesProvider});

  final PreferencesProvider preferencesProvider;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final router = RouterController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: widget.preferencesProvider),
        ChangeNotifierProvider(
          create: (context) => ConfigProvider(
            widget.preferencesProvider,
            router.router,
          ),
        ),
      ],
      child: MaterialApp.router(routerConfig: router.router),
    );
  }
}
