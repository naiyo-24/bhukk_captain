import 'package:get/get.dart';
import '../views/auth/login_screen.dart';
import '../views/auth/otp_screen.dart';
import '../views/home/home_screen.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/account/account_screen.dart';
import '../views/account/edit_account_screen.dart';
import '../views/order/order_popup.dart';
import '../views/order/pickup_map_screen.dart';
import '../views/order/otp_pickup_screen.dart';
import '../views/order/delivery_map_screen.dart';
import '../views/order/otp_delivery_screen.dart';
import '../views/order/payment_screen.dart';
import '../views/order/order_success_screen.dart';
import '../bindings/auth_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/order_binding.dart';
import '../bindings/account_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      bindings: [AuthBinding(), HomeBinding()],
      // Keep HomeController alive so online state persists
      participatesInRootNavigator: true,
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardScreen(),
      bindings: [AuthBinding(), HomeBinding()],
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => const AccountScreen(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.EDIT_ACCOUNT,
      page: () => const EditAccountScreen(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.ORDER_POPUP,
      page: () => const OrderPopup(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.PICKUP_MAP,
      page: () => const PickupMapScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.OTP_PICKUP,
      page: () => const OtpPickupScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.DELIVERY_MAP,
      page: () => const DeliveryMapScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.OTP_DELIVERY,
      page: () => const OtpDeliveryScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => const PaymentScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.ORDER_SUCCESS,
      page: () => const OrderSuccessScreen(),
      binding: OrderBinding(),
    ),
  ];
}