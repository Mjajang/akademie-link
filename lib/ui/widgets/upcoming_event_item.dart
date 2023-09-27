import 'package:akademiklink/models/event_model.dart';
import 'package:akademiklink/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UpcomingEventItem extends StatelessWidget {
  final bool isLandscape;

  final EventModel event;

  const UpcomingEventItem({
    super.key,
    required this.event,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri _url = Uri.parse(event.urlEvent);
        if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch url');
        }
      },
      child: Container(
        color:
            event.currentEvent == false ? Colors.grey.shade300 : ternaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.date,
                    style: whiteTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: semiBold,
                      color:
                          event.currentEvent == false ? blackColor : whiteColor,
                    ),
                  ),
                  Text(
                    event.month,
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      color:
                          event.currentEvent == false ? blackColor : whiteColor,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 110,
                    child: Text(
                      event.title,
                      style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                        color: event.currentEvent == false
                            ? blackColor
                            : whiteColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 14,
                        color: event.currentEvent == false
                            ? blackColor
                            : whiteColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        event.hour,
                        style: whiteTextStyle.copyWith(
                          color: event.currentEvent == false
                              ? blackColor
                              : whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: event.currentEvent == false
                            ? blackColor
                            : whiteColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            (isLandscape ? 170 : 169),
                        child: Text(
                          event.address,
                          style: whiteTextStyle.copyWith(
                            color: event.currentEvent == false
                                ? blackColor
                                : whiteColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
