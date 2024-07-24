import 'package:farm_control/constants/UI_constants.dart';
import 'package:farm_control/repositories/SessionManager.dart';
import 'package:farm_control/screens/auth/login_screen.dart';
import 'package:farm_control/utils/ui_utils.dart';
import 'package:farm_control/viewmodels/AuthViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(PADING_SCREEN),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              viewModel.signOut();
              SessionManager().clear();
              showCustomAlertDialog(context,() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              });
            },
            icon: Icon(Icons.logout),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.tealAccent[400]),
            label: const Text(
              'Logout',
              style: TextStyle(
                  //color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      )),
    );
  }
}
