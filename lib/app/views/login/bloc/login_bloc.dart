import 'dart:io';

import 'package:autocinema/app/data/models/user_model.dart';
import 'package:autocinema/app/data/services/auth_service.dart';
import 'package:autocinema/app/globals/controller/firebase_auth_controller.dart';
import 'package:autocinema/app/utils/get_storage.dart';
import 'package:autocinema/app/utils/validator_string.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:pub_semver/pub_semver.dart';

class LoginBloc extends FormBloc<String, String> {
  final username = TextFieldBloc(validators: [
    ValidatorString.required,
  ]);

  final password = TextFieldBloc(validators: [
    ValidatorString.required,
  ]);

  LoginBloc() {
    addFieldBlocs(fieldBlocs: [username, password]);
  }

  Future<bool> authGoogle() async {
    bool auth = false;
    final user = await FirebaseAuthController.i.handleGoogleSignIn();
    if (user != null) {
      auth = true;
      GetStorages.user = UserModel.fromJson(user.toJson());
    }
    return auth;
  }

  Future<bool> authFacebook() async {
    bool auth = false;
    final user = await FirebaseAuthController.i.handleFacebookSignIn();
    if (user != null) {
      auth = true;
      GetStorages.user = UserModel.fromJson(user.toJson());
    }
    return auth;
  }

  Future<bool> authApple() async {
    bool auth = false;
    final user = await FirebaseAuthController.i.handleAppleSignIn();
    if (user != null) {
      auth = true;
      GetStorages.user = UserModel.fromJson(user.toJson());
    }
    return auth;
  }

  Future<bool> isIOS13() async {
    bool habilitado = false;
    if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      final versionA = Version.parse("13.0.0");
      Version version;
      try {
        version = Version.parse("${double.parse(iosInfo.systemVersion).toString()}.0");
      } catch (e) {
        version = Version.parse("${iosInfo.systemVersion}");
      }
      if (version >= versionA) {
        habilitado = true;
      }
    }
    return habilitado;
  }

  @override
  void onSubmitting() async {
    final response = await AuthService.login(
      username: username.value,
      password: password.value,
    );
    if (response.status) {
      GetStorages.page = GetStorages.onBoarding ? '/boarding' : '/nav-bar';
      GetStorages.user = UserModel.fromJson(response.data);
      emitSuccess(
        canSubmitAgain: true,
        successResponse: "Exito",
      );
    } else {
      emitFailure(failureResponse: response.message);
    }
  }

  @override
  Future<void> close() {
    username.close();
    password.close();
    return super.close();
  }
}
