import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
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
  final double _opacityHeight = Adapt.px(300);
  final double _appBarChangeHeight = Adapt.px(500);
  final double _totalHeight = Adapt.px(600);
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
            brightness: Brightness.light,
            iconTheme: _theme.iconTheme,
            title: Text(
              widget.title,
              style: TextStyle(
                color: _theme.textTheme.bodyText1.color,
                fontSize: Adapt.px(30),
              ),
            ),
          )
        : AppBar(
            key: ValueKey('AppBarHide'),
            backgroundColor: Colors.transparent,
            brightness: Brightness.dark,
            elevation: 0.0,
            leading: InkWell(
              child: Container(
                margin: EdgeInsets.all(
                  Adapt.px(10),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x60000000),
                ),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: Adapt.px(50),
                  color: const Color(0xFFFFFFFF),
                ),
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
          );
  }
}
