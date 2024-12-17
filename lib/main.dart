import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:get/get.dart';
import 'package:soulwhisper/constant/colors.dart';
import 'package:soulwhisper/data/repo/authRepo.dart';
import 'bloc/authBloc/auth_bloc.dart';
import 'views/onboardScreen/splashScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized before calling async code.
  await Firebase.initializeApp(); // Initializes Firebase.
   FirebaseAuth.instance.setLanguageCode('en');
  runApp(
    RepositoryProvider(
      create: (_) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>())
                  ..add(AppStarted()), // Check session on app start
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgrounColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
