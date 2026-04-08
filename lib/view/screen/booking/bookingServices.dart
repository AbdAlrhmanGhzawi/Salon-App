import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/booking/booking_controller.dart';
import '../../../core/constant/color.dart';




class BookingServices extends StatelessWidget {
  const BookingServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingController bookingController =  Get.put(BookingController()) ;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Booking Calendar Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(

          appBar: AppBar(
            title: const Text('Booking Calendar Demo'),
          ),
          body:
          Center(
            child:
            BookingCalendar(
              bookingService:  bookingController.mockBookingService  ,// mockBookingService,
              convertStreamResultToDateTimeRanges: bookingController.convertStreamResultMock , //  convertStreamResultMock,
              getBookingStream: bookingController.getBookingStreamMock ,  // getBookingStreamMock,
              uploadBooking:  bookingController.uploadBookingMock , //uploadBookingMock,

              pauseSlots:  bookingController.generatePauseSlots()  ,//generatePauseSlots(),
              pauseSlotText: 'LUNCH',
              hideBreakTime: false,
              loadingWidget: const Text('Fetching data...'),
              uploadingWidget: const CircularProgressIndicator(),
              locale: 'hu_HU',
              startingDayOfWeek: StartingDayOfWeek.tuesday,
              wholeDayIsBookedWidget:
              const Text('Sorry, for this day everything is booked'),
              //disabledDates: [DateTime(2023, 1, 20)],
              //disabledDays: [6, 7],
            ),


          ),
        ));
  }

}
