import 'app_database.dart';
import '../models/product.dart';

class ProductDatabase {
  ProductDatabase._privateConstructor();

  static final ProductDatabase instance =
  ProductDatabase._privateConstructor();

  Future<void> insertProduct(Product product) async {
    final db = await AppDatabase.instance.database;

    await db.insert(
      'products',
      {
        'id': product.id,
        'name': product.name,
        'code': product.code,
        'barcode': product.barcode,
        'category': product.category,
        'unit': product.unit,
        'purchase_price': product.purchasePrice,
        'sale_price': product.salePrice,
        'wholesale_price': product.wholesalePrice,
        'physical_stock': product.physicalStock,
        'reserved_stock': product.reservedStock,
        'sold_quantity': product.soldQuantity,
        'minimum_stock': product.minimumStock,
        'image_path': product.imagePath,
        'supplier_id': product.supplierId,
        'description': product.description,
      },
    );
  }

  Future<List<Product>> getProducts() async {
    final db = await AppDatabase.instance.database;

    final rows = await db.query(
      'products',
      orderBy: 'name ASC',
    );

    return rows.map((row) {
      return Product(
        id: row['id'] as String,
        name: row['name'] as String,
        code: row['code'] as String? ?? '',
        barcode: row['barcode'] as String? ?? '',
        category: row['category'] as String? ?? '',
        unit: row['unit'] as String? ?? '',
        purchasePrice: (row['purchase_price'] as num).toDouble(),
        salePrice: (row['sale_price'] as num).toDouble(),
        wholesalePrice: (row['wholesale_price'] as num).toDouble(),
        physicalStock: row['physical_stock'] as int,
        reservedStock: row['reserved_stock'] as int,
        soldQuantity: row['sold_quantity'] as int,
        minimumStock: row['minimum_stock'] as int,
        imagePath: row['image_path'] as String?,
        supplierId: row['supplier_id'] as String?,
        description: row['description'] as String?,
      );
    }).toList();
  }
}