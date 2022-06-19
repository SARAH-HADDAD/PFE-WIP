import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SmartParkingFirebaseUser {
  SmartParkingFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SmartParkingFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SmartParkingFirebaseUser> smartParkingFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SmartParkingFirebaseUser>(
            (user) => currentUser = SmartParkingFirebaseUser(user));
