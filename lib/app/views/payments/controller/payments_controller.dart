import 'package:autocinema/app/data/models/horary_model.dart';
import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:get/get.dart';

class PaymentsController extends GetxController {
  final MovieModel movie;
  final HoraryModel horary;

  RxDouble _totalC = 0.0.obs;
  double get totalC => _totalC.value;

  RxInt _vehiculo = 0.obs;
  int get vehiculo => _vehiculo.value;

  RxInt _persona = 0.obs;
  int get persona => _persona.value;

  incrementVehiculo(int v) {
    _vehiculo(v);
    _totalXvehiculo.value = double.parse(horary.tarifa) * _vehiculo.value;
    calculateTotal();
  }

  incrementPerson(int v) {
    _persona(v);
    _totalXpersona.value = double.parse(horary.tarifaExtras) * _persona.value;
    calculateTotal();
  }

  calculateTotal() {
    _totalC(_totalXvehiculo.value + _totalXpersona.value);
  }

  RxDouble _totalXvehiculo = 0.0.obs;
  double get totalXvehiculo => _totalXvehiculo.value;

  RxDouble _totalXpersona = 0.0.obs;
  double get totalXpersona => _totalXpersona.value;

  PaymentsController({
    this.horary,
    this.movie,
  })  : assert(horary != null),
        assert(movie != null) {
    incrementVehiculo(1);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
