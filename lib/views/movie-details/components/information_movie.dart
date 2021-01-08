import 'package:autocinema/helpers/helper.dart';
import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/themes/theme_style.dart';
import 'package:flutter/material.dart';

class InformationMovie extends StatelessWidget {
  final String title;
  final String category;
  final String language;
  final String classification;
  final String duration;
  final String description;
  final String facebook;

  const InformationMovie({
    Key key,
    this.title,
    this.category,
    this.language,
    this.classification,
    this.duration,
    this.description,
    this.facebook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return Container(
      height: getProportionateScreenWidth(120),
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        0,
      ),
      decoration: BoxDecoration(
        color: _theme.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            getProportionateScreenWidth(25),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                facebook.isNotEmpty && facebook != null
                    ? InkWell(
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                        onTap: () => Helper.launchInBrowser(facebook),
                        child: Container(
                          width: getProportionateScreenWidth(40),
                          height: getProportionateScreenWidth(25),
                          child: Image.asset(
                            "assets/images/facebook_circle.png",
                            color: _theme.iconTheme.color,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Categoria: ",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "${category ?? ''}.", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
              ),
              RichText(
                text: TextSpan(
                  text: "Idioma: ",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "${language ?? ''}.", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Clasificación: ",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: "${classification ?? ''}.", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
              ),
              RichText(
                text: TextSpan(
                  text: "Duracion: ",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "${duration ?? ''} min.", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
