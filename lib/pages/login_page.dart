import 'package:flutter/material.dart';
import 'package:libarary/providers/Auth_provider.dart';
import 'package:libarary/utils/my_snackbar.dart';
import 'package:libarary/utils/my_textFeild.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading : false
      ),
      body: Center(
        child: Column(
          children: [
            Form(
              key: formkey,
              child: Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextfeild(
                      lable: "email",
                      hint: "enter your email",
                      icon: Icons.email,
                      controller: emailController,
                      validator: (value) {
                      if(value == null || value == ""){
                      return "it can't be empty";
                      }
                      if(!value.contains("@gmail.com"))
                      {
                      return "enter the email correctly";
                      }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextfeild(
                      lable: "password",
                      hint: "enter your password",
                      icon: Icons.password,
                      controller: passwordController,
                      validator: (value) {
                      if(value == null || value == ""){
                      return "it can't be empty";
                      }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    await context.read<AuthProvider>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    showMySnackBar(
                      context,
                      context.read<AuthProvider>().authModel!.user.message,
                    );
                    if (context.read<AuthProvider>().authModel!.user.status) {
                      Navigator.pushNamed(context, "/library");
                    }
                  }
                },
                child: Text("login"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account"),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, "/registration"),
                    child: Text("signup"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}