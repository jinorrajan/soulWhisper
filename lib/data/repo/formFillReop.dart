import 'package:cloud_firestore/cloud_firestore.dart';

class Formfillreop {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   /// Save form data to Firebase
  Future<void> saveFormData(String userId, Map<String, dynamic> formData) async {
    try {
      await _firestore.collection('users').doc(userId).set(formData);
    } catch (e) {
      throw Exception('Failed to save form data: $e');
    }
  }
}
