import 'package:barber_shop/provider/auth/function_provider.dart';
import 'package:barber_shop/screens/auth/widgets/each_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {

  const LoginForm(
      {super.key,
    });

  @override
  Widget build(BuildContext context) {
     FunctionsAuthProvider functionsAuthProvider =
        Provider.of<FunctionsAuthProvider>(context);
    return Column(
      children: [
        EachForm(
          controller: functionsAuthProvider.emailController,
          hint: 'Email',
          keyBoard: TextInputType.emailAddress,
          obscureText: false,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Campo vazio. Digite seu email!';
            } else if (value.contains('@') && value.contains('.com')) {
              return null;
            } else {
              return 'Digite um email válido!';
            }
          },
        ),
        EachForm(
            controller: functionsAuthProvider.passwordController,
            hint: 'Senha',
            keyBoard: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite sua senha!';
              } else {
                return null;
              }
            }),
      ],
    );
  }
}
