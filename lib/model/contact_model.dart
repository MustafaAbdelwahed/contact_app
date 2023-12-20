class Contact {
  Contact(
      {required this.id,
      required this.name,
      required this.phone,
      this.favoriteState = 'not-favorite',
      this.isFavorit = false}) {
    isFavorit = favoriteState == 'favorite';
  }

  final String name;
  final String phone;
  final String id;
  String favoriteState;
  bool isFavorit;
}
