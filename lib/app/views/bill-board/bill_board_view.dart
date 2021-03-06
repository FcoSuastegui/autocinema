import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/widgets/AppBar/filter_bar.dart';
import 'package:autocinema/app/widgets/AppBar/sliverappbar_delegate.dart';
import 'package:autocinema/app/widgets/Movie/list_movie/movie_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BillBoardView extends StatelessWidget {
  const BillBoardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: MovieView(
            type: 1,
            slivers: [
              SliverPersistentHeader(
                floating: true,
                delegate: SliverAppBarDelegate(
                  minHeight: Adapt.px(100),
                  maxHeight: Adapt.px(100),
                  child: FilterBar(
                    title: "billboard".tr,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
