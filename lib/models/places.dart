class Places {
  String location;
  String title;
  String subtitle;
  String description;
  List category;
  String type;
  String image;
  List imageList;
  String? date;
  String? month;
  String? fulldate;
  String? time;
  Places({
    required this.location,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.type,
    required this.image,
    required this.imageList,
    this.date,
    this.month,
    this.fulldate,
    this.time,
  });
}
