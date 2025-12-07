import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login: kembalikan null kalau sukses, atau pesan error kalau gagal
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // sukses
    } on FirebaseAuthException catch (e) {
      // e.code bisa dipakai untuk pesan yang lebih spesifik
      return e.message ?? "Terjadi kesalahan saat login.";
    } catch (e) {
      return "Terjadi kesalahan tak terduga.";
    }
  }

  // Register: kembalikan null kalau sukses, atau pesan error
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // sukses
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Terjadi kesalahan saat mendaftar.";
    } catch (e) {
      return "Terjadi kesalahan tak terduga.";
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Optional helper: ambil User? object
  User? get currentUser => _auth.currentUser;
}
