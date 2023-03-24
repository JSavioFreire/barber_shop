import 'package:barber_shop/provider/db/admin/functions_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  BuildContext context;

  AuthProvider({required this.context}) {
    checkLoginOrRegister();
  }
  FirebaseAuth auth = FirebaseAuth.instance;

  late FunctionsAdm functionsAdm = Provider.of<FunctionsAdm>(context, listen: false);
  User? users;
  bool isLoading = true;

  void checkLoginOrRegister() {
    auth.authStateChanges().listen((User? user) {
      users = (user == null) ? null : user;
      isLoading = false;
      functionsAdm.checkIsAdmin(user!.email.toString());
      notifyListeners();
    });
  }

  getUser() {
    users = auth.currentUser;
    notifyListeners();
  }

  register(String email, String password, String name) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await users!.updateDisplayName(name);

      getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('O email já está cadastrado.');
      } else if (e.code == 'invalid-email') {
        throw AuthException('Digite um email válido.');
      }
    }
  }

  login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-email') {
        throw AuthException('Email não foi encontrado.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta, tente novamente.');
      }
    }
  }

  logout() async {
    await auth.signOut();
    getUser();
  }
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}
