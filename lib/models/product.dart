class Product {
  int id;
  String category;
  String product;
  int is_in_fridge;
  int is_in_cart;
  double amount;
  int? is_starred;
  int banned;

  Product({
    required this.id,
    required this.category,
    required this.product,
    required this.is_in_fridge,
    required this.is_in_cart,
    required this.amount,
    this.is_starred,
    required this.banned,
  });
}
