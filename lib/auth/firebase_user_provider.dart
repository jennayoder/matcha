import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MatchaFirebaseUser {
  MatchaFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MatchaFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MatchaFirebaseUser> matchaFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MatchaFirebaseUser>(
      (user) {
        currentUser = MatchaFirebaseUser(user);
        return currentUser!;
      },
    );
