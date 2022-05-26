import 'package:dukan/business_logic/authentication%20_logic/register_cubit.dart';
import 'package:dukan/data/local_data/shared_preferences/shared_pref.dart';
import 'package:dukan/routes.dart';
import 'package:dukan/ui/widgets/custom_button.dart';
import 'package:dukan/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/design_constants/colors_manager.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoadedState) {
            if (state.registerModel.status == true) {
              SharedPref.saveData(
                      key: 'token', value: state.registerModel.data!.token)
                  .then((value) {
                Navigator.pushReplacementNamed(
                    context, Routes.mainScreenRoute);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.registerModel.message.toString())));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.registerModel.message.toString())));
            }
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(),
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
                          Text('Sign Up',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 50),
                          customTextFormField(
                              context: context,
                              title: 'Name',
                              controller: nameController,
                              hint: 'Enter your name',
                              keyboardType: TextInputType.text,
                              validatorMassage: 'please Enter your name'),
                          const SizedBox(height: 40),
                          customTextFormField(
                              context: context,
                              title: 'Phone Number',
                              controller: phoneController,
                              hint: 'Enter your Phone Number',
                              keyboardType: TextInputType.phone,
                              validatorMassage: 'please Enter your Phone Number'),
                          const SizedBox(height: 40),
                          customEmailTextFormField(
                              context: context, emailController: emailController),
                          const SizedBox(height: 40),
                          customPasswordTextFormField(
                              context: context,
                              passwordController: passwordController,
                              icon: IconButton(
                                  onPressed: () {
                                    RegisterCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                  icon:
                                      RegisterCubit.get(context).isPasswordVisible
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility)),
                              isPasswordVisible:
                                  RegisterCubit.get(context).isPasswordVisible),
                          const SizedBox(height: 50),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Builder(builder: (context) {
                              return state is RegisterLoadingState
                                  ? const CircularProgressIndicator.adaptive()
                                  : customElevatedButton(
                                      context: context,
                                      text: 'SIGN UP',
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          RegisterCubit.get(context).userRegister(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameController.text,
                                              phone: phoneController.text);
                                        }
                                      });
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
