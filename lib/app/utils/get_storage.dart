import 'package:autocinema/app/data/models/user_model.dart';
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
  String get api => _storage.read('api') ?? "$server/api";

  set onBoarding(bool value) => _storage.write('onBoarding', value);
  bool get onBoarding => _storage.read('onBoarding') ?? true;

  set page(String valor) => _storage.write('page', valor);
  String get page => _storage.read('page') ?? '/nav-bar';

  set user(UserModel userModel) {
    userModel.photo == null || userModel.photo.isEmpty
        ? userModel.photo = "$server/images/avatar-masculino.png"
        : userModel.photo = userModel.signIn > 0 ? userModel.photo : "$server/${userModel.photo}";
    _storage.write('user', userModel.toJson());
  }

  UserModel get user => UserModel.fromJson(_storage.read('user') ?? {});
}
