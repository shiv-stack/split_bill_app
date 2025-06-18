import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'blocs/auth/auth_bloc.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/homescreen.dart';
import 'screens/welcome_screen.dart';

class SplitBillApp extends StatelessWidget {
  const SplitBillApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        title: 'Split Bill App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: FutureBuilder<User?>(
          future: Future.value(FirebaseAuth.instance.currentUser),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else {
              if (snapshot.data != null) {
                return const HomeScreen(); // User is logged in
              } else {
                return const WelcomeScreen(); // User not logged in
              }
            }
          },
        ),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
