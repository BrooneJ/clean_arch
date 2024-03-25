import 'package:clean_arch/di/di_setup.dart';
import 'package:clean_arch/presentation/main_screen.dart';
import 'package:clean_arch/presentation/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => getIt.get<MainViewModel>(),
        child: const MainScreen(),
      ),
    ),
  ],
);
