import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'core/bloc/connectivity/connectivity_cubit.dart';
import 'core/repository/local_repository.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/string_constant.dart';
import 'core_ui/views/views.dart';
import 'core_ui/widgets/loading_indicator.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final LocalRepository localRepository = await LocalRepository.instance;
  runApp(MyApp(
    localRepository: localRepository,
  ));
}

class MyApp extends StatelessWidget {
  final LocalRepository localRepository;
  MyApp({
    super.key,
    required this.localRepository,
  });
  final _navKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalRepository>(
          create: (context) => localRepository,
          lazy: true,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConnectivityCubit>(
            create: (context) => ConnectivityCubit(),
          ),
        ],
        child: GlobalLoaderOverlay(
          overlayOpacity: 0.5,
          overlayColor: Colors.brown.withOpacity(0.5),
          useDefaultLoading: false,
          overlayWidget: const Center(
            child: LoadingIndicator(),
          ),
          child: Column(
            children: [
              BlocBuilder<ConnectivityCubit, ConnectivityState>(
                builder: (context, state) {
                  if (state is ConnectivityOffline) {
                    return const _ConnectionStatusAppBar(
                      title: StringConstants.noInternet,
                    );
                  }
                  if (state is ConnectivityRestored) {
                    return const _ConnectionStatusAppBar(
                      title: StringConstants.connectionRestored,
                      color: Colors.green,
                      icon: Icons.signal_wifi_4_bar,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              Expanded(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme().getThemeData(context),
                  home: const SplashScreen(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      autoLogin();
    });
  }

  autoLogin() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 160,
              width: 160,
              child: Center(
                  child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ))),
          const SizedBox(
            height: 20,
          ),
          Text(
            StringConstants.irlWireless,
            style: TextStyle(
              fontSize: 32,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
              color: AppTheme.appWhite,
            ),
          )
        ],
      ),
    ));
  }
}

class _ConnectionStatusAppBar extends StatelessWidget {
  const _ConnectionStatusAppBar({
    required this.title,
    this.color,
    this.icon,
  });

  final String title;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      width: double.maxFinite,
      color: color ?? Colors.red,
      padding: const EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.signal_wifi_connected_no_internet_4,
              color: Colors.white,
              size: 15,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
