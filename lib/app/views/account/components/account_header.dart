import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader();
  @override
  Widget build(BuildContext context) {
    final user = Storage.user;
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
                      user.name.isEmpty ? "guess".tr : user.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Adapt.px(30),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 0, left: 0),
                    child: Text(
                      user.email ?? '',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Adapt.px(25),
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
                radius: Adapt.px(70),
                backgroundColor: Colors.white,
                backgroundImage: user.photo.isEmpty
                    ? Image.network("${Storage.server}/images/avatar-masculino.png").image
                    : Image.network(user.photo).image,
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
