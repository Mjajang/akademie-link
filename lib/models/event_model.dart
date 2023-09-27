class EventModel {
  final String date;
  final String month;
  final String title;
  final String hour;
  final String address;
  final String urlEvent;
  final bool currentEvent;

  EventModel({
    required this.date,
    required this.month,
    required this.title,
    required this.hour,
    required this.address,
    required this.urlEvent,
    this.currentEvent = false,
  });
}
