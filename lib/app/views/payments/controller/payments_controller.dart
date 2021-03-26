import 'package:autocinema/app/data/models/horary_model.dart';
import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:get/get.dart';

class PaymentsController extends GetxController {
  final MovieModel movie;
  final HoraryModel horary;

  RxDouble _zoneTarifa = 0.0.obs;
  double get zoneTarifa => _zoneTarifa.value;

  RxDouble _totalC = 0.0.obs;
  double get totalC => _totalC.value;

  RxInt _movieVehiculo = 0.obs;
  int get movieVehiculo => _movieVehiculo.value;

  RxInt _eventoVehiculo = 0.obs;
  int get eventoVehiculo => _eventoVehiculo.value;

  RxInt _movieMaxPersonXvehiculo = 0.obs;
  int get movieMaxPersonXvehiculo => _movieMaxPersonXvehiculo.value;

  RxInt _eventoMaxPersonXvehiculo = 0.obs;
  int get eventoMaxPersonXvehiculo => _eventoMaxPersonXvehiculo.value;

  RxInt _moviePersona = 0.obs;
  int get moviePersona => _moviePersona.value;

  RxInt _eventoPersona = 0.obs;
  int get eventoPersona => _eventoPersona.value;

  movieIncrementVehiculo(int v) {
    _movieVehiculo(v);
    _totalXvehiculo.value = double.parse(horary.tarifa) * _movieVehiculo.value;
    _movieMaxPersonXvehiculo.value = _movieVehiculo.value * 2;
    if (_moviePersona > _movieMaxPersonXvehiculo.value) {
      _moviePersona(_movieMaxPersonXvehiculo.value);
    }
    calculateTotal();
  }

  eventoIncrementVehiculo(int v) {
    _eventoVehiculo(v);
    _totalXvehiculo.value = double.parse(horary.tarifa) * _eventoVehiculo.value;
    _eventoMaxPersonXvehiculo.value = _eventoVehiculo.value * 2;
    if (_eventoPersona > _eventoMaxPersonXvehiculo.value) {
      _eventoPersona(_eventoMaxPersonXvehiculo.value);
    }
    calculateTotal();
  }

  movieIncrementPerson(int v) {
    _moviePersona(v);
    _totalXpersona.value = double.parse(horary.tarifaExtras) * _moviePersona.value;
    calculateTotal();
  }

  eventoIncrementPerson(int v) {
    _eventoPersona(v);
    _totalXpersona.value = double.parse(horary.tarifaExtras) * _eventoPersona.value;
    calculateTotal();
  }

  calculateTotal() {
    if (_zoneTarifa.value > 0) {
      _totalC(_totalXvehiculo.value + _totalXpersona.value + _zoneTarifa.value);
    } else {
      _totalC(_totalXvehiculo.value + _totalXpersona.value);
    }
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
    horary.especial == 1 ? eventoIncrementVehiculo(1) : movieIncrementVehiculo(1);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
