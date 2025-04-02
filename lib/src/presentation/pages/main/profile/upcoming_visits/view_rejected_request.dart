import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/home/get_visits/doctor_booking_request_response.dart';
import '../../../../components/buttons/bottom_navigation_button.dart';

class ViewRejectedRequest extends StatelessWidget {
  const ViewRejectedRequest({super.key, required this.bookingResponse});

  final BookingResponse bookingResponse;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.colorScheme.background,
          surfaceTintColor: context.theme.colorScheme.background,
          title: Text(context.translate(bookingResponse.status.first)),
        ),
        body: Padding(
          padding: AppUtils.kPaddingAll16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                bookingResponse.doctorIdData.doctorName,
                style: context.theme.textTheme.titleLarge,
              ),
              AppUtils.kGap12,
              Text(
                DateFormat('dd MMMM yyyy').format(DateTime.parse(bookingResponse.doctorBookingIdData.date)),
                style: context.theme.textTheme.bodyMedium,
              ),
              AppUtils.kGap12,
              Text(
                '${bookingResponse.doctorBookingIdData.fromTime} - ${bookingResponse.doctorBookingIdData.toTime}',
                style: context.theme.textTheme.bodyMedium,
              ),
              AppUtils.kGap12,
              Text(
                bookingResponse.doctorIdData.hospital,
                style: context.theme.textTheme.bodyMedium,
              ),
              AppUtils.kGap12,
              Card(
                elevation: 0,
                child: Padding(
                  padding: AppUtils.kPaddingAll16,
                  child: Text(
                    bookingResponse.patientDescription.substring(3, bookingResponse.patientDescription.length - 4),
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              AppUtils.kGap12,
              bookingResponse.doctorDescription.replaceAll('<p>', '').replaceAll('</p>', '').isEmpty
                  ? const SizedBox()
                  : Card(
                      elevation: 0,
                      child: Padding(
                        padding: AppUtils.kPaddingAll16,
                        child: Text(
                          bookingResponse.doctorDescription.replaceAll('<p>', '').replaceAll('</p>', ''),
                          style: context.theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationButton(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ),
      );
}
