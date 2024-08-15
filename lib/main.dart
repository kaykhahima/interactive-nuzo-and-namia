import 'package:flutter/material.dart';
import 'package:interactive_nuzo_and_namia/shared/providers_list.dart';
import 'package:interactive_nuzo_and_namia/utils/navigation_keys.dart';
import 'package:provider/provider.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const NuzoAndNamiaApp(),
    ),
  );
}

class NuzoAndNamiaApp extends StatelessWidget {
  const NuzoAndNamiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nuzo and Namia App',
      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: NavKeys.rootScaffoldMessengerKey,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
