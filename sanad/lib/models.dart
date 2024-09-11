class Activity {
  Activity(
      {this.description = '',
      this.is_fav = false,
      required this.name,
      required this.type,
      required this.adress,
      required this.city,
      required this.date,
      required this.duration});
  final String name;
  final String description;
  final String type;
  final String date;
  final String adress;
  final String city;
  final bool is_fav;
  final int duration;
}
