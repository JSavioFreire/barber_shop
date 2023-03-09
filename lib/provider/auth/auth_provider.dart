import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? users;
  bool isLoading = true;


  AuthProvider() {
    checkLoginOrRegister();
  }

  void checkLoginOrRegister() {
    auth.authStateChanges().listen((User? user) {
      users = (user == null) ? null : user;
      isLoading = false;
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
