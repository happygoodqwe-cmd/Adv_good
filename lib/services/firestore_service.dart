import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addMachine(Map<String, dynamic> machineData) async {
    await _firestore.collection('machines').add(machineData);
  }

  Stream<List<Map<String, dynamic>>> getMachinesStream() {
    return _firestore.collection('machines').snapshots().map((snapshot) => 
      snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
  }

  Future<void> updateMachineCounter(String machineId, int counter) async {
    await _firestore.collection('machines').doc(machineId).update({'counter': counter});
  }

  Future<void> addLog(Map<String, dynamic> logData) async {
    await _firestore.collection('logs').add(logData);
  }

  Stream<List<Map<String, dynamic>>> getLogsStream() {
    return _firestore.collection('logs').snapshots().map((snapshot) => 
      snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
  }

  Future<User?> signUp(String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  Future<User?> signIn(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();
}