class Product {
  final String id;
  final String name;
  final String code;
  final String barcode;
  final String category;
  final String unit;

  final double purchasePrice;
  final double salePrice;
  final double wholesalePrice;

  final int physicalStock;
  final int reservedStock;
  final int soldQuantity;
  final int minimumStock;

  final String? imagePath;
  final String? supplierId;
  final String? description;

  const Product({
    required this.id,
    required this.name,
    required this.code,
    required this.barcode,
    required this.category,
    required this.unit,
    required this.purchasePrice,
    required this.salePrice,
    required this.wholesalePrice,
    required this.physicalStock,
    required this.reservedStock,
    required this.soldQuantity,
    required this.minimumStock,
    this.imagePath,
    this.supplierId,
    this.description,
  });

  int get availableStock {
    return physicalStock - reservedStock;
  }

  double get stockCostValue {
    return physicalStock * purchasePrice;
  }

  double get stockSaleValue {
    return physicalStock * salePrice;
  }

  double get potentialGrossProfit {
    return stockSaleValue - stockCostValue;
  }

  double get reservedCostValue {
    return reservedStock * purchasePrice;
  }

  double get reservedSaleValue {
    return reservedStock * salePrice;
  }

  double get reservedPotentialProfit {
    return reservedSaleValue - reservedCostValue;
  }
}