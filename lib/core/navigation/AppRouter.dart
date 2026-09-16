import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/Feature/Home/Presentation/view/Home_view.dart';
import 'package:to_do_list/core/Forms/Authontication/login_view.dart';
import 'package:to_do_list/core/Forms/Authontication/manager/Auth_Cubit.dart';
import 'package:to_do_list/Feature/Onboarding/Onboarding_view.dart';
import 'package:to_do_list/core/Forms/Authontication/Register.dart';
import 'package:to_do_list/Feature/welcome/welcome.dart';
import 'package:to_do_list/core/navigation/Routes.dart';
import 'package:to_do_list/Feature/Splash/SplashScreen.dart';
import 'package:to_do_list/core/Utilis/Firebase/Auth.dart';

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    routes: routes,
  );

  static List<GoRoute> routes = [
    GoRoute(
      path: Routes.kSplashView,
      builder: (context, state) => SplashScreen(),
    ),

    GoRoute(
      path: Routes.kOnboardingView,
      builder: (context, state) => OnboardingView(),
    ),

    GoRoute(
      path: Routes.kWelcome,
      builder: (context, state) => WelcomeView(),
    ),

    GoRoute(
      path: Routes.kLogin,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AuthCubit(
            AuthServices(),
          ),
          child: const LoginView(),
        );
      },
    ),

    GoRoute(
      path: Routes.kRegister,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AuthCubit(
            AuthServices(),
          ),
          child: const Register(),
        );
      },
    ),

    GoRoute(
      path: Routes.kHome,
      builder: (context, state) => HomeView(),
    ),
  ];
}