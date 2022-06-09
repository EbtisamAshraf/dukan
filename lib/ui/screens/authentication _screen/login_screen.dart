import 'dart:io';
import 'package:dukan/business_logic/authentication%20_logic/login_cubit.dart';
import 'package:dukan/constants/design_constants/colors_manager.dart';
import 'package:dukan/data/local_data/shared_preferences/shared_pref.dart';
import 'package:dukan/routes.dart';
import 'package:dukan/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future <bool> onBackPressed () async{
      return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title:  const Text('Dukan', textAlign:TextAlign.center ,),
            content: const Text('Do you want to Exit?', textAlign:TextAlign.center ,),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () =>
                    Navigator.of(context).pop(false),
              ),
              TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    exit(0);
                  }
              ),
            ],
          ));
    }

    return WillPopScope(
      onWillPop: onBackPressed,
      child: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadedState) {
                if (state.loginModel.status == true) {
                  SharedPref.saveData(
                          key: 'token', value: state.loginModel.data!.token)
                      .then((value) {
                    Navigator.pushReplacementNamed(
                        context, Routes.mainScreenRoute);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.loginModel.message.toString())));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.loginModel.message.toString())));
                }
              }
            },
            builder: (context, state) {
              return Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.all(20.0),
                      color: ColorsManager.white,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Welcome,',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.registerScreenRoute);
                                    },
                                    child: Text('Sign Up',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text('Sign in to Continue',
                                style: Theme.of(context).textTheme.displaySmall),
                            const SizedBox(height: 50),
                            customEmailTextFormField(
                                context: context,
                                emailController: emailController),
                            const SizedBox(height: 40),
                            customPasswordTextFormField(
                                context: context,
                                passwordController: passwordController,
                                icon: IconButton(
                                    onPressed: () {
                                      LoginCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    icon:
                                        LoginCubit.get(context).isPasswordVisible
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility)),
                                isPasswordVisible:
                                    LoginCubit.get(context).isPasswordVisible),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text('Forgot Password?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall)),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: Builder(builder: (context) {
                                return state is LoginLoadingState
                                    ? const CircularProgressIndicator.adaptive()
                                    : customElevatedButton(
                                        context: context,
                                        text: 'SIGN IN',
                                        onPressed: () {
                                          if (formKey.currentState!.validate()) {
                                            LoginCubit.get(context).userLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                          }
                                        });
                              }),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 35.0),
                              child: Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text('-OR-',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
