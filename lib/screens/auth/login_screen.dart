import 'package:farm_control/screens/root_navigation_screen.dart';
import 'package:farm_control/viewmodels/AuthViewModel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.asset('assets/images/login_image.png'),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          User? user = await viewModel.signIn(
                              _emailController.text, _passwordController.text);
                          if (user != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RootNavigationScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please verify your email and password'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.tealAccent[700],
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.tealAccent[400]),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              //color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.grey[800], // The color of the line
                          thickness: 1, // The thickness of the line
                          indent:
                              0, // The amount of empty space on the leading edge of the line
                          endIndent:
                              5, // The amount of empty space on the trailing edge of the line
                        )),
                        Text("or"),
                        Expanded(
                            child: Divider(
                          color: Colors.grey[800], // The color of the line
                          thickness: 1, // The thickness of the line
                          indent:
                              5, // The amount of empty space on the leading edge of the line
                          endIndent:
                              0, // The amount of empty space on the trailing edge of the line
                        )),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.google,
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
