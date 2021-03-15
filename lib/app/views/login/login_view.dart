import 'package:autocinema/app/themes/adapt.dart';
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
              alignment: AlignmentDirectional.topStart,
              fit: StackFit.expand,
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
                  top: Adapt.px(100),
                  left: Adapt.px(10),
                  child: IconButton(
                    onPressed: () => Get.back(result: false),
                    icon: Icon(Icons.clear, color: Colors.white),
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
    auth ? Get.back(result: true) : Helper.error(message: "Acceso denegado");
  }
}
