import 'package:auto_route/auto_route.dart';
import 'package:rhymerr/features/favorites/favorites_screen.dart';
import 'package:rhymerr/features/home/home_screen.dart';
import 'package:rhymerr/features/history/history_screen.dart';
import 'package:rhymerr/features/search/search_screen.dart';
import 'package:rhymerr/features/settings/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: "/",
          children: [
            AutoRoute(
              page: SearchRoute.page,
              path: "search",
            ),
            AutoRoute(
              page: FavoritesRoute.page,
              path: "favorites",
            ),
            AutoRoute(
              page: HistoryRoute.page,
              path: "poems",
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: "settings",
            )
          ],
        ),
      ];
}
