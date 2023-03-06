import 'package:barber_shop/components/animations/loading_animation.dart';
import 'package:barber_shop/provider/auth/function_provider.dart';
import 'package:barber_shop/screens/auth/components/forms/login/login_form.dart';
import 'package:barber_shop/screens/auth/components/forms/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllForm extends StatelessWidget {
  const AllForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    FunctionsAuthProvider functionsAuthProvider =
        Provider.of<FunctionsAuthProvider>(context);

    String textTextButton = functionsAuthProvider.isRegister
        ? 'Já tem cadastro? Clique aqui!'
        : 'Não tem cadastro? Clique aqui e cadastre-se';
    String textElevatedButton =
        functionsAuthProvider.isRegister ? 'Cadastrar' : 'Entrar';
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              functionsAuthProvider.isRegister == true
                  ? const RegisterForm()
                  : const LoginForm(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (functionsAuthProvider.isRegister) {
                        functionsAuthProvider.register(
                            context: context,
                            email:
                                functionsAuthProvider.registerEmailController,
                            password: functionsAuthProvider
                                .registerPasswordController,
                            name: functionsAuthProvider.registerNameController,
                            phone:
                                functionsAuthProvider.registerPhoneController);
                      } else {
                        functionsAuthProvider.login(
                            context: context,
                            email: functionsAuthProvider.emailController,
                            password: functionsAuthProvider.passwordController);
                      }
                    }
                  },
                  child: functionsAuthProvider.buttonInLoading
                      ? const LoadingAnimation()
                      : Text(
                          textElevatedButton,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 28),
                        ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    functionsAuthProvider.changeLoginToRegister();
                  },
                  child: Text(textTextButton))
            ],
          ),
        ));
  }
}
