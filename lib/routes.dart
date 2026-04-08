import 'package:salon_project/test_view.dart';
import 'package:salon_project/view/screen/OnBoarding.dart';

import 'package:salon_project/view/screen/auth/signUp.dart';
import 'package:salon_project/view/screen/auth/success_signup.dart';
import 'package:salon_project/view/screen/booking/CancelBooking.dart';
import 'package:salon_project/view/screen/booking/ConfirmBooking.dart';
import 'package:salon_project/view/screen/booking/bookingServices.dart';
import 'package:salon_project/view/screen/home/homescreen.dart';
import 'package:salon_project/view/screen/employeesdetails.dart';
import 'package:salon_project/view/screen/services/services.dart';
import 'package:salon_project/view/screen/services/servicesdetails.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constant/routes.dart';


import 'core/middleware/mymiddleware.dart';
import 'view/screen/auth/login.dart';

List<GetPage<dynamic>>? routes = [

   GetPage(name: "/", page: () => const OnBoarding() , middlewares: [
  MyMiddleWare()
   ]),

 // GetPage(name: "/", page: () =>  const OnBoarding()) ,


  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.homePage, page: () =>  HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Services()),
  GetPage(name: AppRoute.EmployeeDetails, page: () => const EmployeeDetails()),

  ////////////////////////////////////////////////
  GetPage(name: AppRoute.ServicesDetails, page: () => const ServicesDetails()),
  GetPage(name: AppRoute.BookingServices, page: () => const BookingServices()),
  GetPage(name: AppRoute.CancelBooking, page: () => const CancelBooking()),
  GetPage(name: AppRoute.ConfirmBooking, page: () => const ConfirmBooking()),





  GetPage(name: "/TestView", page: () => const TestView()),





];