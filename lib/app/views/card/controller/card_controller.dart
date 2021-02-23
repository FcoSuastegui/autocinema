import 'package:autocinema/app/widgets/Cards/models/card_model.dart';
import 'package:get/get.dart';

enum typeCard {
  credit,
  debit,
}

class CardController extends GetxController {
  RxList<CardModel> cards = List<CardModel>().obs;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  CardModel card;
  getArguments() => card = Get.arguments;

  @override
  void onInit() {
    getCards();
    super.onInit();
  }

  Future<void> getCards() async {
    _loading(true);
    final list = await CardService().cards();
    list.forEach((item) => cards.add(item));
    _loading(false);
  }
}
