class Inventory {
  String name, descriptions;
  int quantity = 0;
  double cost_price = .0, selling_price = .0;

  Inventory(
    this.name, {
    this.quantity = 0,
    this.cost_price = 0,
    this.selling_price = 0,
    this.descriptions = "",
  });
}
