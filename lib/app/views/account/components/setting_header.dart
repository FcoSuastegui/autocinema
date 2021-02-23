import 'package:autocinema/app/themes/adapt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 0, left: 0),
                    child: Text(
                      "guess".tr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Adapt.px(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 0, top: 0),
              padding: EdgeInsets.all(1.0),
              child: CircleAvatar(
                radius: Adapt.px(40),
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://img2.freepng.es/20180402/bje/kisspng-computer-icons-avatar-login-user-avatar-5ac207e69ecd41.2588125315226654466505.jpg',
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200], // border color
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
