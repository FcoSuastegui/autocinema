import 'package:flutter/material.dart';

class ListTileDefault extends StatelessWidget {
  final IconData leading;
  final String title, subtitle;
  final Color color;
  final Widget widget, trailing;
  final Function onTap;
  final Function(bool value) onChange;
  final double top, bottom, left, right;
  final bool boxshadow, _isSwitch, value;

  const ListTileDefault({
    Key key,
    @required this.title,
    this.onTap,
    this.leading,
    this.trailing,
    this.widget,
    this.subtitle,
    this.top = 0.0,
    this.bottom = 0.0,
    this.left = 20.0,
    this.right = 0.0,
    this.boxshadow = true,
    this.color = Colors.black38,
    this.value,
  })  : this.onChange = null,
        _isSwitch = false,
        super(key: key);

  const ListTileDefault.switchTile({
    Key key,
    @required this.title,
    @required this.onChange,
    this.leading,
    this.trailing,
    this.widget,
    this.subtitle,
    this.top = 10.0,
    this.bottom = 0.0,
    this.left = 20.0,
    this.right = 0.0,
    this.boxshadow = true,
    this.color = Colors.black38,
    @required this.value,
  })  : this.onTap = null,
        _isSwitch = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      width: width,
      child: Container(
        child: _isSwitch
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 0.0),
                      child: Text(
                        title ?? '',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Switch(
                      value: value,
                      onChanged: onChange,
                      activeTrackColor: Colors.blue,
                    ),
                  )
                ],
              )
            : GestureDetector(
                onTap: onTap,
                behavior: HitTestBehavior.translucent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title ?? '',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: trailing,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
