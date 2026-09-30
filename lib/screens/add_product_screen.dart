import 'package:flutter/material.dart';
import '../database/product_database.dart';
import '../models/product.dart';
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController purchasePriceController =
  TextEditingController();
  final TextEditingController salePriceController = TextEditingController();
  final TextEditingController wholesalePriceController =
  TextEditingController();
  final TextEditingController openingStockController =
  TextEditingController();
  final TextEditingController minimumStockController =
  TextEditingController();
  final TextEditingController supplierController = TextEditingController();
  final TextEditingController descriptionController =
  TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    barcodeController.dispose();
    categoryController.dispose();
    unitController.dispose();
    purchasePriceController.dispose();
    salePriceController.dispose();
    wholesalePriceController.dispose();
    openingStockController.dispose();
    minimumStockController.dispose();
    supplierController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> saveProduct() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final product = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: nameController.text.trim(),
      code: codeController.text.trim(),
      barcode: barcodeController.text.trim(),
      category: categoryController.text.trim(),
      unit: unitController.text.trim(),
      purchasePrice:
      double.tryParse(purchasePriceController.text.trim()) ?? 0,
      salePrice:
      double.tryParse(salePriceController.text.trim()) ?? 0,
      wholesalePrice:
      double.tryParse(wholesalePriceController.text.trim()) ?? 0,
      physicalStock:
      int.tryParse(openingStockController.text.trim()) ?? 0,
      reservedStock: 0,
      soldQuantity: 0,
      minimumStock:
      int.tryParse(minimumStockController.text.trim()) ?? 0,
      imagePath: null,
      supplierId: supplierController.text.trim().isEmpty
          ? null
          : supplierController.text.trim(),
      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),
    );

    await ProductDatabase.instance.insertProduct(product);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product saved successfully'),
      ),
    );
  }

  InputDecoration fieldDecoration(
      String label, {
        IconData? icon,
      }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon == null ? null : Icon(icon),
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Product Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_a_photo,
                      size: 42,
                    ),
                    const SizedBox(height: 8),
                    const Text('Product Photo'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Camera'),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.photo_library),
                          label: const Text('Gallery'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: nameController,
                decoration: fieldDecoration(
                  'Product Name',
                  icon: Icons.inventory_2,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Product Name দিন';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: codeController,
                decoration: fieldDecoration(
                  'Product Code',
                  icon: Icons.qr_code,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: barcodeController,
                decoration: fieldDecoration(
                  'Barcode',
                  icon: Icons.barcode_reader,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: categoryController,
                decoration: fieldDecoration(
                  'Category',
                  icon: Icons.category,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: unitController,
                decoration: fieldDecoration(
                  'Unit',
                  icon: Icons.straighten,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Price Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: purchasePriceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: fieldDecoration(
                  'Purchase Price',
                  icon: Icons.shopping_cart,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: salePriceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: fieldDecoration(
                  'Sale Price',
                  icon: Icons.sell,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: wholesalePriceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: fieldDecoration(
                  'Wholesale Price',
                  icon: Icons.store,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Stock Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: openingStockController,
                keyboardType: TextInputType.number,
                decoration: fieldDecoration(
                  'Opening Stock',
                  icon: Icons.inventory,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: minimumStockController,
                keyboardType: TextInputType.number,
                decoration: fieldDecoration(
                  'Minimum Stock',
                  icon: Icons.warning_amber,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: supplierController,
                decoration: fieldDecoration(
                  'Supplier',
                  icon: Icons.local_shipping,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: fieldDecoration(
                  'Description',
                  icon: Icons.description,
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton.icon(
                  onPressed: saveProduct,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Save Product',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}