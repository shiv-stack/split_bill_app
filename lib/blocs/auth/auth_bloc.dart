import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthBloc() : super(AuthInitial()) {
    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final userCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        final uid = userCredential.user?.uid;

        // Store user details in Firestore
        await _firestore.collection('users').doc(uid).set({
          'fullName': event.fullName,
          'email': event.email,
          'uid': uid,
          'createdAt': FieldValue.serverTimestamp(),
        });

        emit(Authenticated(userCredential.user!));
      } on FirebaseAuthException catch (e) {
        emit(AuthError(e.message ?? 'Signup failed'));
        emit(AuthInitial());
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(Authenticated(userCredential.user!));
      } on FirebaseAuthException catch (e) {
        emit(AuthError(e.message ?? 'Login failed'));
        emit(AuthInitial());
      }
    });

    on<LogoutRequested>((event, emit) async {
      await _firebaseAuth.signOut();
      emit(AuthInitial());
    });
    on<CheckAuthStatus>((event, emit) async {
      final user = _firebaseAuth.currentUser;

      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthInitial());
      }
    });
  }
}
