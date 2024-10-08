class Product {
  late int id;
  late String name;
  late double price;
  late int stock;
  late String category;

  Product(this.id, this.name, this.price, this.stock, this.category);

  @override
  String toString() {
    return 'id: $id\tnombre: $name\tprecio: $price\tstock: $stock\tcategoría:$category';
  }
}

List<Product> productList = [];

void addNewProduct(
    int id, String name, double price, int stock, String category) {
  var genericProduct = Product(id, name, price, stock, category);
  productList.add(genericProduct);
  // ignore: avoid_print
  print('El producto agregado es:');
  // ignore: avoid_print
  print(genericProduct);
}

void searchProductsByCategoryOrName(String category, String name) {
  var resultSearchList = productList
      .where(
          (product) => (product.category == category || product.name == name))
      .toList();
  // ignore: avoid_print
  print(
      '=================RESULTADOS DE LA BUSQUEDA PARA `categoría: $category nombre: $name`=================');
  for (var product in resultSearchList) {
    // ignore: avoid_print
    print(product);
  }
}

void updateStockProduct(int id, int stock) {
  // ignore: avoid_print
  print('=================RESULTADOS DE LA ACTUALIZACIÓN=================');
  for (var product in productList) {
    if (product.id == id) {
      product.stock = stock;
      // ignore: avoid_print
      print(product);
      return; // Salir de la función una vez actualizado
    }
  }
  // ignore: avoid_print
  print('El producto no fué encontrado');
}

void calculateInventory() {
  // ignore: avoid_print
  print(
      '=================RESULTADOS DEL CALCULO DE INVENTARIO=================');
  int totalStock = 0;
  double totalInventory = 0;
  for (var product in productList) {
    totalStock += product.stock;
    totalInventory += product.stock * product.price;
  }
  // ignore: avoid_print
  print(
      'El total del inventario en stock es: $totalStock valorado en \$ $totalInventory');
}

void main() {
  addNewProduct(
      1, "Leche", 0.95, 100, "Lacteos"); //AGREGA PRODUCTOS INICIALES A LA LISTA
  addNewProduct(
      2, "Queso", 2.20, 100, "Lacteos"); //AGREGA PRODUCTOS INICIALES A LA LISTA
  addNewProduct(
      3, "Gatorade", 1, 100, "Bebidas"); //AGREGA PRODUCTOS INICIALES A LA LISTA
  // ignore: avoid_print
  print('=================INVENTARIO DE PRODUCTOS=================');
  for (var product in productList) {
    //IMPRIME EL INVENTARIO INICIAL
    // ignore: avoid_print           //IMPRIME EL INVENTARIO INICIAL
    print(product); //IMPRIME EL INVENTARIO INICIAL
  } //IMPRIME EL INVENTARIO INICIAL
  addNewProduct(
      4, "Agua", 0.50, 100, "Bebidas"); //AGREGAMOS DOS PRODUCTOS INICIALES
  addNewProduct(
      5, "Limonada", 0.50, 100, "Bebidas"); //AGREGAMOS DOS PRODUCTOS INICIALES
  searchProductsByCategoryOrName(
      'Bebidas', ''); //BUSCA EL PRODUCTO POR CATEGORIA
  searchProductsByCategoryOrName('', 'Queso'); //BUSCA EL PRODUCTO POR NOMBRE
  updateStockProduct(3, 250); //ACTUALIZA EL STOCK DE UN PRODUCTO EXISTENTE
  updateStockProduct(6,
      250); //TRATA DE ACTUALIZAR EL STOCK DE UN PRODUCTO NO EXISTENTE(MENSAJE DE VALIDACION)
  calculateInventory(); //CALCULA EL TOTAL DEL INVENTARIO
  searchProductsByCategoryOrName('Lacteos',
      ''); //IMPRIME LA LISTA DE TODOS LOS PRODUCTOS EN LA CATEGORIA LACTEOS
}
