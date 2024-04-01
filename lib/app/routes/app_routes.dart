part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const NOTIFICATIONS = '/notifications';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const REPPORT_MOTO = '/repport-moto';
  static const MOTOS = '/motos';
  static const ADD_MOTOS = '/add-motos';
  static const HISTORIQUES = '/historiques';
  static const APROPOS = '/apropos';
  static const PARAMETRES = '/parametres';
  static const FEEDBACK = '/feedback';
  static const EDIT_PROFI = '/edit-profi';
  static const TERMS_CONDITIONS = '/terms-conditions';
}

class _Paths {
  _Paths._();
  static const HOME = '/home';
}
