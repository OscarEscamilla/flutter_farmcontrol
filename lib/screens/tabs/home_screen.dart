import 'package:farm_control/constants/UI_constants.dart';
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
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(PADING_SCREEN),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border()
                  ),
                  child: Image.asset(
                    'assets/images/cow_img.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Welcome ${authViewModel.user?.email?.split("@")[0]}!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
