import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthProviderD with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // éxito
    } on FirebaseAuthException catch (e) {
      return e.message; // mensaje de error para mostrar
    }
  }

  Future<String?> register(String email, String password, Map<String, dynamic> userData) async {
  try {
    // 1. Crear el usuario en Firebase Auth
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    
    // 2. Usar el correo como ID, limpio
    final cleanEmail = email.trim().toLowerCase();

    final userDoc = _firestore.collection('usuarios').doc(cleanEmail);

    // 3. (Opcional) Verificar si ya existe
    final docSnapshot = await userDoc.get();
    if (docSnapshot.exists) {
      return 'Este correo ya está registrado en Firestore';
    }

    // 4. Guardar los datos en Firestore
    await userDoc.set(userData);

    notifyListeners();
    return null; // éxito

  } on FirebaseAuthException catch (e) {
    return e.message;
  } catch (e) {
    return 'Error inesperado: $e';
  }
}

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}