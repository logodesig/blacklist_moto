import 'package:get/get.dart';

import '../modules/add_motos/bindings/add_motos_binding.dart';
import '../modules/add_motos/views/add_motos_view.dart';
import '../modules/apropos/bindings/apropos_binding.dart';
import '../modules/apropos/views/apropos_view.dart';
import '../modules/edit_profi/bindings/edit_profi_binding.dart';
import '../modules/edit_profi/views/edit_profi_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/historiques/bindings/historiques_binding.dart';
import '../modules/historiques/views/historiques_view.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/views/home.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/motos/bindings/motos_binding.dart';
import '../modules/motos/views/motos_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/parametres/bindings/parametres_binding.dart';
import '../modules/parametres/views/parametres_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/repport_moto/bindings/repport_moto_binding.dart';
import '../modules/repport_moto/views/repport_moto_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/terms_conditions/bindings/terms_conditions_binding.dart';
import '../modules/terms_conditions/views/terms_conditions_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.REPPORT_MOTO,
      page: () => const RepportMotoView(),
      binding: RepportMotoBinding(),
    ),
    GetPage(
      name: Routes.MOTOS,
      page: () => const MotosView(),
      binding: MotosBinding(),
    ),
    GetPage(
      name: Routes.ADD_MOTOS,
      page: () => const AddMotosView(),
      binding: AddMotosBinding(),
    ),
    GetPage(
      name: Routes.HISTORIQUES,
      page: () => const HistoriquesView(),
      binding: HistoriquesBinding(),
    ),
    GetPage(
      name: Routes.APROPOS,
      page: () => const AproposView(),
      binding: AproposBinding(),
    ),
    GetPage(
      name: Routes.PARAMETRES,
      page: () => const ParametresView(),
      binding: ParametresBinding(),
    ),
    GetPage(
      name: Routes.FEEDBACK,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFI,
      page: () => const EditProfiView(),
      binding: EditProfiBinding(),
    ),
    GetPage(
      name: Routes.TERMS_CONDITIONS,
      page: () => const TermsConditionsView(),
      binding: TermsConditionsBinding(),
    ),
  ];
}
