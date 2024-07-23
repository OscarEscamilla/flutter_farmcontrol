import 'package:farm_control/viewmodels/AuthViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body:  Center(
        child: authViewModel != null
            ? Text('Welcome ${authViewModel.user?.email}!', style: TextStyle(fontSize: 20))
            : Text('Please sign in', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
