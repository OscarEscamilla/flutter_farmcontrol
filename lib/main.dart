import 'package:farm_control/repositories/SessionManager.dart';
import 'package:farm_control/screens/root_navigation_screen.dart';
import 'package:farm_control/screens/auth/login_screen.dart';
import 'package:farm_control/screens/auth/register_screen.dart';
import 'package:farm_control/screens/splash_screen.dart';
import 'package:farm_control/viewmodels/AuthViewModel.dart';
import 'package:flutter/material.dart';
import 'repositories/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        // Add other providers if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farm Control',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent[700]!),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/root': (context) => RootNavigationScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
