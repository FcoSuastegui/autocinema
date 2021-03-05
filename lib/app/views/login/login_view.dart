import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/get_storage.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/views/login/bloc/login_bloc.dart';
import 'package:autocinema/app/widgets/Buttons/button_social_apleeks.dart';
import 'package:autocinema/app/widgets/Loading/loading_apleeks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  static final String routeName = '/login';
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Builder(
          builder: (context) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset("assets/images/splash-login.gif").image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: Adapt.px(100),
                  right: 0,
                  left: 0,
                  child: Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonSocialApleeks(
                          button: ButtonsApleeks.Google,
                          text: "google-btn".tr,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: Adapt.px(25),
                          ),
                          onPressed: () async {
                            LoadingApleeks.show(context);
                            bool auth = await BlocProvider.of<LoginBloc>(context).authGoogle();
                            LoadingApleeks.hide(context);
                            validateLoginSocial(auth: auth);
                          },
                        ),
                        ButtonSocialApleeks(
                          button: ButtonsApleeks.Facebook,
                          text: "facebook-btn".tr,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: Adapt.px(25),
                          ),
                          onPressed: () async {
                            LoadingApleeks.show(context);
                            bool auth = await BlocProvider.of<LoginBloc>(context).authFacebook();
                            LoadingApleeks.hide(context);
                            validateLoginSocial(auth: auth);
                          },
                        ),
                        FutureBuilder(
                          future: BlocProvider.of<LoginBloc>(context).isIOS13(),
                          initialData: false,
                          builder: (context, AsyncSnapshot<bool> snapshot) => snapshot.data
                              ? ButtonSocialApleeks(
                                  button: ButtonsApleeks.Apple,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: Adapt.px(25),
                                  ),
                                  text: "apple-btn".tr,
                                  onPressed: () async {
                                    LoadingApleeks.show(context);
                                    bool auth =
                                        await BlocProvider.of<LoginBloc>(context).authApple();
                                    LoadingApleeks.hide(context);
                                    validateLoginSocial(auth: auth);
                                  },
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void validateLoginSocial({bool auth}) {
    if (auth) {
      GetStorages.page = GetStorages.onBoarding ? '/boarding' : '/nav-bar';
      Get.offAllNamed(GetStorages.page);
    } else {
      Helper.error(message: "Acceso denegado");
    }
  }
}
