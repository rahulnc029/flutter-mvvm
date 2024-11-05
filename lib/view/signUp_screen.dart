import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obscurePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.alternate_email)
              ),
              onFieldSubmitted: (value) {
                // FocusScope.of(context).requestFocus(passwordFocusNode);
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obscurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: passwordFocusNode,
                  obscureText: _obscurePassword.value,
                  obscuringCharacter: "*",
                  decoration:  InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock_open_outlined),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obscurePassword.value = !_obscurePassword.value;
                          },
                          child:  Icon(_obscurePassword.value ? Icons.visibility_off : Icons.visibility)
                      ),
                      labelText: "Password"
                  ),
                );
              },
            ),
            SizedBox(height: height*.085,),
            RoundButton(
              title: "Sign Up",
              loading: authViewModel.loading,
              onPress: () {
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Email", context);
                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Password", context);
                }else if(_passwordController.text.length < 6){
                  Utils.flushBarErrorMessage("Please enter 6 digit Password", context);
                }else{
                  // Navigator.of(context).pushNamed(RoutesName.home);
                  Map data = {
                    "email" : _emailController.text.toString(),
                    "password" : _passwordController.text.toString()
                  };
                  authViewModel.loginApi(data, context);
                }
              },
            ),
            SizedBox(height: height*.02,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: const Text("Already have an Account? Login"),
            )
          ],
        ),
      ),
    );
  }
}
