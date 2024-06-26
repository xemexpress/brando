import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthAPI implements AuthAPIInterface {
  AuthAPI({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _userProfilesCollectionRef =
            firebaseFirestore.collection('userProfiles');

  final FirebaseAuth _firebaseAuth;
  final CollectionReference _userProfilesCollectionRef;

  @override
  AuthUser? get currentUser {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      return null;
    } else {
      return AuthUser.fromFirebaseUser(user);
    }
  }

  // Profile related

  // @override
  @override
  Future<void> initializeProfile({required String uid}) async {
    try {
      await _userProfilesCollectionRef.doc(uid).set(
        {
          'contactNumber': '',
        },
      );
    } catch (e) {
      throw GenericAuthException(
        message: 'Unexpected error when creating user profile. ${e.toString()}',
      );
    }
  }

  @override
  Future<void> updateDisplayName({required String newDisplayName}) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(newDisplayName);
    } on FirebaseAuthException catch (e) {
      throw GenericAuthException(
        message:
            'Met when updating the display name. Please set an exception for FirebaseAuthException of code ${e.code}.',
      );
    } catch (e) {
      throw GenericAuthException(
        message: 'Unexpected error when signing in. ${e.toString()}',
      );
    }
  }

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final AuthCredential credential = EmailAuthProvider.credential(
        email: currentUser!.email,
        password: oldPassword,
      );
      await _firebaseAuth.currentUser?.reauthenticateWithCredential(credential);
      await _firebaseAuth.currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw InvalidPasswordAuthException();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else {
        throw GenericAuthException(
          message:
              'Met when signing in. Please set an exception for FirebaseAuthException of code ${e.code}.',
        );
      }
    } catch (e) {
      throw GenericAuthException(
        message: 'Unexpected error when signing in. ${e.toString()}',
      );
    }
  }

  @override
  Future<void> updateContactNumber({required String contactNumber}) async {
    try {
      DocumentReference userProfileRef =
          _userProfilesCollectionRef.doc(currentUser!.id);

      try {
        await userProfileRef.update({
          'contactNumber': contactNumber,
        });
      } on FirebaseException catch (e) {
        if (e.code == 'not-found') {
          await userProfileRef.set({
            'contactNumber': contactNumber,
          });
        } else {
          rethrow;
        }
      }
    } on FirebaseAuthException catch (e) {
      throw GenericAuthException(
        message:
            'Met when signing in. Please set an exception for FirebaseAuthException of code ${e.code}.',
      );
    } catch (e) {
      throw GenericAuthException(
        message:
            'Unexpected error when updating the contact number. ${e.toString()}',
      );
    }
  }

  // Auth related

  @override
  Stream<AuthUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? null
          : AuthUser.fromFirebaseUser(firebaseUser);
    });
  }

  @override
  Stream<AuthUser?> userChanges() {
    Stream<User?> firebaseUserStream = _firebaseAuth.userChanges();

    return firebaseUserStream.switchMap((firebaseUser) {
      if (firebaseUser == null) {
        return Stream.value(null);
      }

      Stream<DocumentSnapshot> userProfileStream =
          _userProfilesCollectionRef.doc(firebaseUser.uid).snapshots();

      return userProfileStream.map((userProfileSnapshot) {
        if (userProfileSnapshot.exists) {
          final userProfile =
              userProfileSnapshot.data() as Map<String, dynamic>;

          return AuthUser.fromFirebaseUserAndProfileData(
            firebaseUser,
            userProfile,
          );
        } else {
          return AuthUser.fromFirebaseUser(firebaseUser);
        }
      });
    });
  }

  // @override
  // Stream<AuthUser?> userChanges() {
  //   return _firebaseAuth.userChanges().switchMap((firebaseUser) async* {
  //     if (firebaseUser == null) {
  //       yield null;
  //     }

  //     DocumentSnapshot userProfileSnapshot =
  //         await _userProfilesCollectionRef.doc(firebaseUser!.uid).get();
  //     if (userProfileSnapshot.exists) {
  //       final userProfile = userProfileSnapshot.data() as Map<String, dynamic>;

  //       yield AuthUser.fromFirebaseUserAndProfileData(
  //         firebaseUser,
  //         userProfile,
  //       );
  //     } else {
  //       yield AuthUser.fromFirebaseUser(firebaseUser);
  //     }
  //   });
  // }

  // @override
  // Stream<AuthUser?> userChanges() {
  //   return _firebaseAuth.userChanges().map((firebaseUser) {
  //     return firebaseUser == null
  //         ? null
  //         : AuthUser.fromFirebaseUser(firebaseUser);
  //   });
  // }

  @override
  Future<AuthUser> signInEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.checkFirebaseException('auth/invalid-credential')) {
        throw InvalidPasswordAuthException();
      } else if (e.checkFirebaseException('auth/invalid-email')) {
        throw InvalidEmailAuthException();
      } else if (e.checkFirebaseException('auth/network-request-failed')) {
        throw NetworkRequestAuthException();
      }

      throw GenericAuthException(
        message:
            'Met when signing in. Please set an exception for FirebaseAuthException of code ${e.code}.',
      );
    } catch (e) {
      throw GenericAuthException(
        message: 'Unexpected error when signing in. ${e.toString()}',
      );
    }
  }

  @override
  Future<AuthUser> signInWithGoogle() async {
    try {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      final UserCredential userCredential =
          await _firebaseAuth.signInWithPopup(authProvider);

      if (userCredential.credential == null) {
        throw UserNotLoggedInException();
      }

      await _firebaseAuth.signInWithCredential(userCredential.credential!);

      final user = currentUser;
      if (user == null) {
        throw UserNotLoggedInException();
      }

      // Initialize user profile
      await initializeProfile(uid: user.id);

      return user;
    } on FirebaseAuthException catch (e) {
      throw GenericAuthException(
        message:
            'Met when signing in with Google. Please set an exception for FirebaseAuthException of code ${e.code}.',
      );
    } catch (e) {
      throw GenericAuthException(
        message:
            'Unexpected error when signing in with Google. ${e.runtimeType} ${e.toString()}',
      );
    }
  }

  @override
  Future<AuthUser> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(); // by default we request the email and the public profile
      // or FacebookAuth.i.login()
      if (result.status == LoginStatus.success) {
        // you are logged
        final AccessToken accessToken = result.accessToken!;

        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);

        // Once signed in, return the UserCredential
        await _firebaseAuth.signInWithCredential(facebookAuthCredential);

        final user = currentUser;
        if (user == null) {
          throw UserNotLoggedInException();
        }

        return user;
      } else {
        throw UserNotLoggedInException();
      }
    } on FirebaseAuthException catch (e) {
      throw GenericAuthException(
        message:
            'Met when signing in with Facebook. Please set an exception for FirebaseAuthException of code ${e.code}.',
      );
    } catch (e) {
      throw GenericAuthException(
        message:
            'Unexpected error when signing in with Facebook. ${e.runtimeType} ${e.toString()}',
      );
    }
  }

  @override
  Future<AuthUser> signInWithApple() async {
    try {
      // To prevent replay attacks with the credential returned from Apple, we
      // include a nonce in the credential request. When signing in with
      // Firebase, the nonce in the id token returned by Apple, is expected to
      // match the sha256 hash of `rawNonce`.
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      await _firebaseAuth.signInWithCredential(oauthCredential);

      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInException();
      }
    } on FirebaseAuthException catch (e) {
      throw GenericAuthException(
        message:
            'Met when signing in with Apple. Please set an exception for FirebaseAuthException of code ${e.code}.',
      );
    } catch (e) {
      throw GenericAuthException(
        message:
            'Unexpected error when signing in with Apple. ${e.runtimeType} ${e.toString()}',
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      print('Met when signing out: ${e.code} ${e.message}');
      rethrow;
    } catch (e) {
      throw GenericAuthException(
        message: 'Unexpected error when signing out. ${e.toString()}',
      );
    }
  }
}
