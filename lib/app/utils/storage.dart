import 'package:autocinema/app/data/models/app_config_model.dart';
import 'package:autocinema/app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  static final Storage _instancia = Storage._internal();
  factory Storage() => _instancia;
  Storage._internal();

  static GetStorage _storage = GetStorage();

  // Métodos de getStorage
  static Future<void> init() async => await GetStorage.init();
  static Future<void> clear() async {
    await _storage.erase();
  }

  // Setter y getters de datos
  static set server(String valor) => _storage.write('server', valor);
  static String get server => _storage.read('server') ?? 'https://qacinema.timeshareapp.com';

  static set api(String valor) => _storage.write('api', valor);
  static String get api => _storage.read('api') ?? "$server/api";

  static set onBoarding(bool value) => _storage.write('onBoarding', value);
  static bool get onBoarding => _storage.read('onBoarding') ?? true;

  static set page(String valor) => _storage.write('page', valor);
  static String get page => _storage.read('page') ?? '/';

  static set auth(bool valor) => _storage.write('auth', valor);
  static bool get auth => _storage.read('auth') ?? false;

  static UserModel get user => UserModel.fromJson(_storage.read('user') ?? {});
  static set user(UserModel userModel) {
    userModel.photo == null || userModel.photo.isEmpty
        ? userModel.photo = "$server/images/avatar-masculino.png"
        : userModel.photo = userModel.signIn > 0 ? userModel.photo : "$server/${userModel.photo}";
    _storage.write('user', userModel.toJson());
  }

  static set config(AppConfigModel config) => _storage.write('config', config.toJson());
  static AppConfigModel get config => AppConfigModel.fromJson(_storage.read('config') ?? {});
}
