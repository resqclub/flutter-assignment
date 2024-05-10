class Offer {
  final String name;

  Offer({required this.name});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      name: json['name'],
    );
  }
}
