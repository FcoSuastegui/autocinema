import 'package:autocinema/app/data/models/boleto_model.dart';
import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BoletoController extends GetxController {
  static const _pageSize = 9;
  final PagingController<int, BoletoModel> boletoController = PagingController(firstPageKey: 1);

  @override
  void onInit() {
    boletoController.addPageRequestListener((pageKey) {
      getBoletos(pageKey);
    });
    super.onInit();
  }

  Future<void> getBoletos(int pageKey) async {
    final boletos = await AutoCinemaService.boletos(
      cliente: Storage.user.id,
      page: pageKey,
    );
    if (boletos.message.isEmpty) {
      final isLastPage = boletos.itemList.length <= _pageSize;
      print(isLastPage);
      isLastPage
          ? boletoController.appendLastPage(boletos.itemList)
          : boletoController.appendPage(boletos.itemList, pageKey + 1);
    } else {
      boletoController.error = boletos.message;
    }
  }
}
