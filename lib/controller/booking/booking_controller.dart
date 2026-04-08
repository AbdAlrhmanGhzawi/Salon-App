import 'dart:convert';

import 'package:salon_project/data/datatsource/remote/booking/booking_data.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/services/services.dart';
import '../../data/model/BookingModel.dart';
import '../../data/model/ServicesModel.dart';


class BookingController extends GetxController {
  BookingData bookingData = BookingData(Get.find()) ;
   List booking = [];

  final now = DateTime.now();
  late BookingService mockBookingService;
  late ServicesModel servicesModel ;

  MyServices myServices = Get.find() ;

  late int user_id ;



  getData() async {

    var response = await bookingData.getData(servicesModel.idSer!);

    if(response['status'] != "failure")
      booking.addAll(response['data']);
    print("=============================== Controller $response ") ;
   // booking.addAll(response['data']);

  }


  List<DateTimeRange> converted = [] ;


  @override
   void onInit() async {

    servicesModel = Get.arguments['servicesModel'];

    user_id = myServices.sharedPreferences.getInt("user_id")!;


     mockBookingService = BookingService(
        userId: '$user_id',
        serviceName: servicesModel.nameSer!,
        serviceDuration: servicesModel.maxTime! ,
        bookingEnd: DateTime(now.year, now.month, now.day, servicesModel.bookingEnd!),
        bookingStart: DateTime(now.year, now.month, now.day, servicesModel.bookingStart! ));

     await getData() ;
    converted.clear();

     super.onInit();


  }

  Stream<dynamic>  getBookingStreamMock(
      {required DateTime end, required DateTime start})  {



    final bookingList = <BookingService>[] ;

    for(int i = 0 ; i < booking.length ; i++)
      {
        SportBooking sportBooking = SportBooking.fromJson(booking[i]);
        final book = BookingService(
            userId: '$user_id',
            serviceName: servicesModel.nameSer!,
            serviceId: '${servicesModel.idSer}',
            serviceDuration: sportBooking.servicesDuration! ,
            bookingEnd: DateTime.parse(sportBooking.bookingEnd!) ,
            bookingStart: DateTime.parse(sportBooking.bookingStart!) );

       bookingList.add(book);

      }



    return Stream.value(bookingList) ;

  }





  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));


    print(newBooking.bookingStart.day);

    var res = await bookingData.getUserData( newBooking.userId!);
    if(res['status'] == "success"){

      List data = [];
      data.addAll(res['data']);
      for(int i = 0 ; i < data.length ; i++)
        {
          DateTime dataTime = DateTime.parse(data[i]['bookingStart'])   ;
          int idSer = data[i]['id_ser'];

          if(dataTime.day == newBooking.bookingStart.day && idSer == servicesModel.idSer){
            Get.snackbar(
              'تنبيه',
              'لا يمكن حجز أكثر من موعد في نفس اليوم',
              duration: Duration(seconds: 3), // Set the duration to 3 seconds
              backgroundColor: Colors.red , // Set the background color to green
              colorText: Colors.white, // Set the text color to white
              icon: const Icon(Icons.warning_amber_outlined, color: Colors.white), // Add an icon
              shouldIconPulse: true, // Make the icon pulse
              snackPosition: SnackPosition.BOTTOM, // Set the position to bottom
            );
            return ;
          }

          if(dataTime == newBooking.bookingStart){
            Get.snackbar(
              'تنبيه',
              'يوجد حجز لخدمة اخرى في نفس الوقت',
              duration: Duration(seconds: 3), // Set the duration to 3 seconds
              backgroundColor: Colors.red , // Set the background color to green
              colorText: Colors.white, // Set the text color to white
              icon: const Icon(Icons.warning_amber_outlined, color: Colors.white), // Add an icon
              shouldIconPulse: true, // Make the icon pulse
              snackPosition: SnackPosition.BOTTOM, // Set the position to bottom
            );
            return ;
          }

        }

    }



      var response = await bookingData.addBooking(newBooking.userId! , servicesModel.idSer!, servicesModel.nameSer! , servicesModel.maxTime!,'${newBooking.bookingStart}' , '${newBooking.bookingEnd}' );
      if(response['status'] == "notEmpty")
      {
        Get.snackbar(
          'تنبيه',
          'لايمكن الحجز في هذا الوقت لانه محجوز',
          duration: Duration(seconds: 3), // Set the duration to 3 seconds
          backgroundColor: Colors.red , // Set the background color to green
          colorText: Colors.white, // Set the text color to white
          icon: const Icon(Icons.warning_amber_outlined, color: Colors.white), // Add an icon
          shouldIconPulse: true, // Make the icon pulse
          snackPosition: SnackPosition.BOTTOM, // Set the position to bottom
        );
      }
      else {
        print("=============================== Controller $response ") ;


        converted.add(DateTimeRange(
            start: newBooking.bookingStart, end: newBooking.bookingEnd));
        Get.snackbar(
          'الحجوزات',
          'تم حجز الموعد في الساعة  ${newBooking.bookingStart.hour}:${newBooking.bookingStart.minute}',
          duration: Duration(seconds: 3), // Set the duration to 3 seconds
          backgroundColor: Colors.green , // Set the background color to green
          colorText: Colors.white, // Set the text color to white
          icon: const Icon(Icons.credit_score_rounded, color: Colors.white), // Add an icon
          shouldIconPulse: true, // Make the icon pulse
          snackPosition: SnackPosition.BOTTOM, // Set the position to bottom
        );


        print('${newBooking.toJson()} has been uploaded');
        print('${converted.length}');




    }




  }



  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {

    final List<BookingService> bookingList = streamResult;

    for (final booking in bookingList) {
      // Example: Convert BookingService to DateTimeRange
      final DateTimeRange bookingRange = DateTimeRange(
        start: booking.bookingStart,
        end: booking.bookingEnd,
      );

      converted.add(bookingRange);
    }

    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }



}