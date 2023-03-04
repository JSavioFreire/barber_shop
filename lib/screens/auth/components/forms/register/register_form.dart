import 'package:barber_shop/provider/auth/function_provider.dart';
import 'package:barber_shop/screens/auth/widgets/each_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {

  const RegisterForm(
      {super.key,
});

  @override
  Widget build(BuildContext context) {
       FunctionsAuthProvider functionsAuthProvider =
        Provider.of<FunctionsAuthProvider>(context);
    return Column(
      children: [
        EachForm(
            controller: functionsAuthProvider.registerNameController,
            hint: 'Nome',
            keyBoard: TextInputType.name,
            obscureText: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite seu nome!';
              } else {
                return null;
              }
            }),
        EachForm(
            controller: functionsAuthProvider.registerEmailController,
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
            }),
        EachForm(
            controller: functionsAuthProvider.registerPhoneController,
            hint: 'Numero do celular',
            keyBoard: TextInputType.phone,
            obscureText: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite seu número!';
              } else if (value.length < 8) {
                return 'Digite um número válido';
              } else {
                return null;
              }
            }),
        EachForm(
            controller: functionsAuthProvider.registerPasswordController,
            hint: 'Senha',
            keyBoard: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite uma senha';
              } else if (value.length < 6) {
                return 'Senha muito curta! Sua senha deve ter no mínimo 6 caracteres';
              } else {
                return null;
              }
            }),
        EachForm(
            controller: functionsAuthProvider.registerConfirmPasswordController,
            hint: 'Confirmar senha',
            keyBoard: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite uma senha';
              } else if (value.length < 6) {
                return 'Senha muito curta! Sua senha deve ter no mínimo 6 caracteres';
              } else if (functionsAuthProvider.registerPasswordController.text !=
                  functionsAuthProvider.registerConfirmPasswordController.text) {
                return 'As senha não são iguais';
              } else {
                return null;
              }
            }),
      ],
    );
  }
}
