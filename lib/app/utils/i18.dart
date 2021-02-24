import 'package:get/get.dart';

class I18 extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'home': 'Home',
          'billboard': 'Billboard',
          'comming': 'Comming soon',
          'account': 'Account',
          'try': 'Try again',
          'wifi': 'Internet connection is available',
          'url-valid': 'Please enter a valid url',
          'url-access': 'This url could not be accessed',
          'guess': 'Guess',
          'my-cards': 'My cards',
          'logout': 'Log out',
          'change-password': 'Change password',
          'receive-notifications': 'Receive notifications',
        },
        'es': {
          'home': 'Inicio',
          'billboard': 'Cartelera',
          'comming': 'Próximamente',
          'account': 'Cuenta',
          'try': 'Intentar de nuevo',
          'wifi': 'Conexión a internet disponible',
          'url-valid': 'Favor de ingresar una url válida',
          'url-access': 'No se pudo acceder a esta url',
          'guess': 'Invitado',
          'my-cards': 'Mis tarjetas',
          'logout': 'Cerrar sesión',
          'change-password': 'Cambiar contraseña',
          'receive-notifications': 'Recibir notificaciones',
        }
      };
}
