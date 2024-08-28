import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/auth_provider.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider= Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 50,),
            InkWell(
              onTap: (){
                authProvider.login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: authProvider.loading? CircularProgressIndicator():Text('Login',style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
