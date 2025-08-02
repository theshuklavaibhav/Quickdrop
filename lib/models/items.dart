class Items {
  String title;
  int? price; // Price is now optional
  bool isPurchased;

  Items({
    required this.title,
    this.price, // No longer required
    this.isPurchased = false,
  });
}