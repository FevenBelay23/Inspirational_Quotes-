import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/admin/blocs/quote/quote_bloc.dart';
import 'package:flutter_client/admin/dataproviders/quote.dart';
import 'package:flutter_client/admin/repositories/quote.dart';
import 'package:flutter_client/appuser/pages/homepage.dart';
import 'package:flutter_client/authentication/blocs/signup/signup_bloc.dart';
import 'package:flutter_client/authentication/dataProviders/auth.dart';
import 'package:flutter_client/authentication/pages/loginPage.dart';
import 'package:flutter_client/authentication/pages/signupPage.dart';
import 'package:flutter_client/blocObserver.dart';
import 'package:flutter_client/splash/splash.dart';
import 'package:go_router/go_router.dart';

import 'admin/pages/homepage.dart';
import 'authentication/blocs/login/login_bloc.dart';
import 'authentication/repositories/auth.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(
        App(),
      );
    },
    blocObserver: Observer(),
  );
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            authDataProvider: AuthDataProvider(),
          ),
        ),
        RepositoryProvider(
          create: (context) => QuoteRepository(
            dataProvider: QuoteDataProvider(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => QuoteBloc(
              quoteRepository: context.read<QuoteRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.light,
            primaryColor: const Color.fromARGB(255, 135, 233, 212),
            primarySwatch: Colors.blueGrey,
          ),
          debugShowCheckedModeBanner: false,
          routeInformationParser: _goRouter.routeInformationParser,
          routerDelegate: _goRouter.routerDelegate,
        ),
      ),
    );
  }

  final GoRouter _goRouter = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: "/login",
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: "/signup",
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const SignupPage(),
        ),
      ),
      GoRoute(
        path: "/admin",
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AdminHomepage(),
        ),
      ),
      GoRoute(
        path: "/user",
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AppUserHomepage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
  );
}
