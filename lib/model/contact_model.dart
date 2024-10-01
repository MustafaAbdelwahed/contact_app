class Contact {
  Contact(
      {required this.id,
      required this.name,
      required this.phone,
      this.favoriteState = 'not-favorite',
      this.isFavorit = false}) {
    isFavorit = favoriteState == 'favorite';
  }

  final String id;
  final String name;
  final String phone;
  String favoriteState;
  bool isFavorit;
}
