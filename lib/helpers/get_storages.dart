import 'package:get_storage/get_storage.dart';

class GetStorages {
  GetStorages._internal();
  static GetStorages _instance = GetStorages._internal();
  static GetStorages get i => _instance;

  GetStorage _storage = GetStorage();

  // Métodos de getStorage
  Future<void> init() async => await GetStorage.init();
  Future<void> clear() async {
    await _storage.erase();
  }

  // Setter y getters de datos
  set server(String valor) => _storage.write('server', valor);
  String get server => _storage.read('server') ?? 'https://qacinema.timeshareapp.com';

  set api(String valor) => _storage.write('api', valor);
  String get api => _storage.read('api') ?? "$server/api/";

  set signIn(int value) => _storage.write('signIn', value);
  int get signIn => _storage.read('signIn') ?? 0;

  set onBoarding(bool value) => _storage.write('onBoarding', value);
  bool get onBoarding => _storage.read('onBoarding') ?? false;

  set page(String valor) => _storage.write('page', valor);
  String get page => _storage.read('page') ?? '/nav-bar';

  set avatar(String valor) => _storage.write('avatar', signIn > 0 ? "$valor" : "$server/$valor");
  String get avatar => _storage.read('avatar') ?? "$server/images/avatar-masculino.png";

  set name(String valor) => _storage.write('name', valor);
  String get name => _storage.read('name') ?? '';

  set email(String valor) => _storage.write('email', valor);
  String get email => _storage.read('email') ?? '';
}
