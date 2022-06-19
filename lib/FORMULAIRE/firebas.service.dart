
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
class Firebaseservice{

void insertData() async {
  var db = FirebaseFirestore.instance.collection("parkings");
  Map<String, dynamic> ourData = {
    "key": "Key",
    "keyl": 100,
    "key2": true,
    "key3": ['occupé', 52, 80, 100, 5200],
    "key4": {"hi": "World"},
  };
     db
       .doc("1")
       .set(ourData)
       .then((value) => print("success"));
}

void fireAddStudentToClassroom() {
  Map<String, dynamic> ourData = {
    "etat": "occupée",
    "type": "normal",
    "couverte":"false"

  };
  var db =  FirebaseFirestore.instance.collection("parkings");
  var studentsClassroomRef = db.doc("2").collection('places');

  studentsClassroomRef
      .doc("4")
      .set(ourData)
      .then((value) => print("success"));
}
void addreclamation(name_collection ,name_subcollection, nb,  variable   ) {
  Map<String, dynamic> ourData = {
    "feed": variable,
    'timestamp': FieldValue.serverTimestamp(),
  };

  final String uid= FirebaseAuth.instance.currentUser.uid;
  var db =  FirebaseFirestore.instance.collection(name_collection);
  var studentsClassroomRef = db.doc( uid).collection(name_subcollection);

  studentsClassroomRef
      .doc(nb)
      .set(ourData)
      .then((value) => print("success"));
}


Future<void> inputData() async {
  final User user = await FirebaseAuth.instance.currentUser;
  final String uid = user.uid.toString();//uid represente le id du

  print("hello");
  print(user.uid);return uid;
}

void addreclamationajout(name_collection ,name_subcollection, nb,  variable   ) {
  Map<String, dynamic> ourData = {
    "feed": variable,
    'timestamp': FieldValue.serverTimestamp(),
  };

  final String uid= FirebaseAuth.instance.currentUser.uid;
  var db =  FirebaseFirestore.instance.collection(name_collection);
  var studentsClassroomRef = db.doc( uid).collection(name_subcollection);

  studentsClassroomRef
      .doc(nb)
      .set(ourData)
      .then((value) => print("success"));
}


}


