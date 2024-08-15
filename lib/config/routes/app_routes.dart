import 'package:go_router/go_router.dart';
import 'package:interactive_nuzo_and_namia/utils/navigation_keys.dart';

import '../../features/game/view/game_page.dart';

class AppRoutes {
  static String initialRoute = '/';

  static final router = GoRouter(
    navigatorKey: NavKeys.rootNavKey,
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        parentNavigatorKey: NavKeys.rootNavKey,
        path: initialRoute,
        name: 'game page',
        builder: (context, state) {
          return GamePage(key: state.pageKey);
        },
      ),
    ],
  );
}
