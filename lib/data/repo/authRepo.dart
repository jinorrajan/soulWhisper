import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soulwhisper/models/userModeel.dart';


class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepository({FirebaseAuth? firebaseAuth,FirebaseFirestore? firestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance, _firestore = firestore ?? FirebaseFirestore.instance;

  // Login Function
  Future<UserModel?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  // Sign-Up Function
  
  // Sign-Up Function with Email Save and ID Generation
  Future<UserModel?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = await _generateUniqueUserId();
      await saveUserToFirestore( email, userId);

      return UserModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<void> saveUserToFirestore( String email, String userId) async {
    await _firestore.collection('users').doc(userId).set({
      'email': email,
      'userId': userId, // Unique ID like SW001
      'createdAt': FieldValue.serverTimestamp(),
    });
  }


   // Generate Unique ID
  Future<String> _generateUniqueUserId() async {
    try {
      final doc = await _firestore.collection('uniqueId').doc('userCounter').get();

      // Safely parse the last counter value
      int lastId = 0;
      if (doc.exists) {
        Map<String, dynamic>? data = doc.data(); // Safely retrieve data
        if (data != null && data['lastId'] is int) {
          lastId = data['lastId'];
        } else if (data != null && data['lastId'] is String) {
          lastId = int.tryParse(data['lastId'] as String) ?? 0;
        }
      }

      final nextId = lastId + 1;

      // Update the counter in Firestore
      await _firestore.collection('uniqueId').doc('userCounter').set({
        'lastId': nextId,
      });

      // Format as SW001, SW002, etc.
      return 'SW${nextId.toString().padLeft(3, '0')}';
    } catch (e) {
      throw Exception("Failed to generate unique user ID: ${e.toString()}");
    }
  }

  // Logout Function
  Future<void> logout() async {
   try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    throw Exception("Logout failed: ${e.toString()}");
  }
  }

  // Get Current User
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        return UserModel.fromFirebaseUser(user);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Error getting user: $e");
    }
  }

  // Auth State Changes Stream
  Stream<UserModel?> get userStream {
    return _firebaseAuth.authStateChanges().map(
      (user) => user != null ? UserModel.fromFirebaseUser(user) : null,
    );
  }
}
