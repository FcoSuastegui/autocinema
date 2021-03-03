import 'package:autocinema/app/data/models/fire_base_model.dart';
import 'package:autocinema/app/data/models/response_model.dart';
import 'package:autocinema/app/data/services/auth_service.dart';
import 'package:autocinema/app/utils/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthController {
  FirebaseAuthController._internal();
  static FirebaseAuthController _instance = FirebaseAuthController._internal();
  static FirebaseAuthController get i => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUserModel> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential data = await _auth.signInWithCredential(credential);
      final FirebaseUserModel user = FirebaseUserModel(
        uid: data.user.uid,
        name: data.user.displayName ?? data.additionalUserInfo.profile['name'],
        alias: data.additionalUserInfo.profile['given_name'],
        email: data.user.email,
        photo: data.user.photoURL ?? data.additionalUserInfo.profile['picture'],
        signIn: 1,
      );

      final response = await _handleService(user);

      user.id = response.data['id'];
      //handlerLogDevice(user);

      return user;
    } on PlatformException catch (err) {
      print(err.message);
      return null;
      // Handle err
    } catch (err) {
      return null;
    }
  }

  Future<FirebaseUserModel> handleFacebookSignIn() async {
    try {
      final AccessToken result = await FacebookAuth.instance.login();
      if (result == null) return null;
      final FacebookAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.token);

      final UserCredential data =
          await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      final FirebaseUserModel user = FirebaseUserModel(
        uid: data.user.uid,
        name: data.user.displayName,
        alias: data.additionalUserInfo.profile['given_name'],
        email: data.user.email,
        photo: data.additionalUserInfo.profile['picture']['data']['url'],
        signIn: 2,
      );

      final response = await _handleService(user);

      user.id = response.data['id'];
      //handlerLogDevice(user);

      return user;
    } catch (e) {
      return null;
    }
  }

  Future<FirebaseUserModel> handleAppleSignIn() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

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

      final UserCredential data = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      final FirebaseUserModel user = FirebaseUserModel(
        uid: data.user.uid,
        name: data.user.providerData.first.displayName,
        alias: data.user.providerData.first.displayName,
        email: data.user.providerData.first.email,
        photo: data.user.providerData.first.photoURL,
        signIn: 3,
      );

      //final response = await _handleService(user);

      //user.id = response.data['id'];
      //handlerLogDevice(user);

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String generateNonce([int length = 32]) {
    final charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<ResponseModel> _handleService(FirebaseUserModel data) async {
    return await AuthService.loginSocial(
      {
        'uid': data.uid,
        'name': data.name,
        'alias': data.alias,
        'email': data.email,
        'photo': data.photo,
        'sign_in_with': data.signIn,
      },
    );
  }

  Future<void> signOut() async {
    final int singIn = GetStorages.user.signIn;

    switch (singIn) {
      case 1:
        try {
          _googleSignIn.disconnect();
        } on PlatformException catch (e) {
          print(e.message);
        }
        break;
      case 2:
        final AccessToken logged = await FacebookAuth.instance.isLogged;
        if (logged != null) FacebookAuth.instance.logOut();
        break;
      case 3:
        break;
      default:
    }
  }
}
