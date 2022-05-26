import 'package:flutter/material.dart';

Widget customEmailTextFormField(
    {required BuildContext context, TextEditingController? emailController}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Email', style: Theme.of(context).textTheme.displaySmall),
      TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: Theme.of(context).textTheme.displayMedium,
        decoration: const InputDecoration(hintText: 'Enter your Email'),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'please enter your email address';
          } else {
            return null;
          }
        },
      ),
    ],
  );
}

Widget customPasswordTextFormField(
    {required BuildContext context,
    TextEditingController? passwordController ,required bool isPasswordVisible ,required Widget icon}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Password', style: Theme.of(context).textTheme.displaySmall),
      TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        style: Theme.of(context).textTheme.displaySmall,
        obscureText: !isPasswordVisible,
        decoration:  InputDecoration(hintText: 'Enter your password',
            suffixIcon:  icon),
        validator: (String? value) {
          if (value!.length <= 5 || value.isEmpty) {
            return 'password is too short';
          } else {
            return null;
          }
        },
      ),
    ],
  );
}

Widget customTextFormField(
    {required BuildContext context, TextEditingController? controller , TextInputType? keyboardType, String? hint ,String? validatorMassage , String? title }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title!, style: Theme.of(context).textTheme.displaySmall),
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.displayMedium,
        decoration:  InputDecoration(hintText: hint),
        validator: (String? value) {
          if (value!.isEmpty) {
            return validatorMassage ;
          } else {
            return null;
          }
        },
      ),
    ],
  );
}