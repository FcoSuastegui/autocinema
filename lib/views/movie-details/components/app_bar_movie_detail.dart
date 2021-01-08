import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/themes/theme_style.dart';
import 'package:flutter/material.dart';

class AppBarMovie extends StatelessWidget {
  final ScrollController controller;
  final String title;

  const AppBarMovie({
    Key key,
    this.controller,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: _CustomAppBar(
        controller: controller,
        title: title,
      ),
    );
  }
}

class _CustomAppBar extends StatefulWidget {
  final ScrollController controller;
  final String title;
  const _CustomAppBar({
    this.controller,
    this.title,
  });
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<_CustomAppBar> {
  bool showBar = false;
  double _opacity = 0.0;
  final double _opacityHeight = getProportionateScreenWidth(300);
  final double _appBarChangeHeight = getProportionateScreenWidth(400);
  final double _totalHeight = getProportionateScreenWidth(550);
  void _checkTitle() {
    if (widget.controller.position.pixels >= _appBarChangeHeight) {
      double v = _opacityHeight - (_totalHeight - widget.controller.position.pixels);
      v = v > _opacityHeight || v < 0 ? _opacityHeight : v;
      _opacity = v / _opacityHeight;
      showBar = true;
    } else {
      showBar = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    widget.controller.addListener(_checkTitle);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_checkTitle);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = ThemeStyle.getTheme(context);
    return showBar
        ? AppBar(
            key: ValueKey('AppBarShow'),
            backgroundColor: _theme.backgroundColor.withOpacity(_opacity),
            brightness: _theme.brightness,
            iconTheme: _theme.iconTheme,
            title: Text(
              widget.title,
              style: TextStyle(
                color: _theme.textTheme.bodyText1.color,
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
          )
        : AppBar(
            key: ValueKey('AppBarHide'),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: InkWell(
              child: Container(
                margin: EdgeInsets.all(
                  getProportionateScreenWidth(10),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x60000000),
                ),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: getProportionateScreenWidth(25),
                  color: const Color(0xFFFFFFFF),
                ),
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
          );
  }
}
