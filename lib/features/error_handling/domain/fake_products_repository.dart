import 'package:flutter_lab/features/error_handling/domain/entity/product_entity.dart';

class FakeProductsRepository {
  Future<List<ProductEntity>> getProducts() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    // throw Exception('Failed to fetch products');

    return mockProducts;
  }
}

const mockProducts = [
  ProductEntity(
    title: 'Product 1',
    price: '31 \$',
    imageUrl: 'https://prd.place/400?id=1',
  ),
  ProductEntity(
    title: 'Product 2',
    price: '45 \$',
    imageUrl: 'https://prd.place/400?id=2',
  ),
  ProductEntity(
    title: 'Product 3',
    price: '27 \$',
    imageUrl: 'https://prd.place/400?id=3',
  ),
  ProductEntity(
    title: 'Product 4',
    price: '34 \$',
    imageUrl: 'https://prd.place/400?id=4',
  ),
  ProductEntity(
    title: 'Product 5',
    price: '10 \$',
    imageUrl: 'https://prd.place/400?id=5',
  ),
  ProductEntity(
    title: 'Product 6',
    price: '25 \$',
    imageUrl: 'https://prd.place/400?id=6',
  ),
  ProductEntity(
    title: 'Product 7',
    price: '53 \$',
    imageUrl: 'https://prd.place/400?id=7',
  ),
  ProductEntity(
    title: 'Product 8',
    price: '43 \$',
    imageUrl: 'https://prd.place/400?id=8',
  ),
  ProductEntity(
    title: 'Product 9',
    price: '64 \$',
    imageUrl: 'https://prd.place/400?id=9',
  ),
  ProductEntity(
    title: 'Product 10',
    price: '34 \$',
    imageUrl: 'https://prd.place/400?id=10',
  ),
];
