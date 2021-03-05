import 'package:autocinema/app/data/models/boleto_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/boleto/component/boleto_card.dart';
import 'package:autocinema/app/views/boleto/controller/boleto_controller.dart';
import 'package:autocinema/app/widgets/Card/card_refresh.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer_list_movie.dart';
import 'package:autocinema/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BoletoView extends GetView<BoletoController> {
  static final String routeName = '/boleto';
  const BoletoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "boletos".tr,
        ),
      ),
      body: SliverScrollView(
        onRefresh: () => Future.sync(
          () => controller.boletoController.refresh(),
        ),
        slivers: [
          PagedSliverList.separated(
            pagingController: controller.boletoController,
            builderDelegate: PagedChildBuilderDelegate<BoletoModel>(
              itemBuilder: (context, boleto, index) => BoletoCard(
                boleto: boleto,
              ),
              firstPageErrorIndicatorBuilder: (context) => ShimmerListMovie(),
              noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                title: Column(
                  children: [
                    Text("No hay boletos disponibles"),
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: Adapt.px(20),
            ),
          ),
        ],
      ),
    );
  }
}
