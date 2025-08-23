import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/constants/image_strings.dart';

class DummyData {
  static final List<Product> products = [
    Product(
        id: '001',
        name: 'Green Nike Sports Shoe',
        description:
            'Step up your game with the Green Nike Sports Shoe. Designed for comfort and performance, these shoes are perfect for your daily runs or gym sessions. The vibrant green color adds a stylish touch to your athletic wear.',
        imageUrl: ImageStrings.product1,
        price: 650,
        brand: 'Nike',
        category: 'Shoes',
        availableColors: ['Green', 'Black', 'White'],
        availableSizes: ['8', '9', '10', '11'],
        stockQuantity: 15,
        rating: 4.5,
        reviewCount: 120,
        isInStock: true),
    Product(
        id: '002',
        name: 'Black T-Shirt for Men',
        description:
            'A classic black t-shirt for men, made from premium quality cotton. This t-shirt offers a comfortable fit and is a versatile addition to any wardrobe. Perfect for casual outings or as a layering piece.',
        imageUrl: 'assets/images/product/product2.jpg',
        price: 250,
        brand: 'Generic',
        category: 'Apparel',
        availableColors: ['Black', 'White', 'Gray'],
        availableSizes: ['S', 'M', 'L', 'XL'],
        stockQuantity: 50,
        rating: 4.2,
        reviewCount: 85,
        isInStock: true),
    Product(
        id: '003',
        name: 'Red Jacket for Women',
        description:
            'Stay warm and stylish with this vibrant red jacket for women. It features a modern design with a comfortable fit, making it ideal for chilly weather. The bold color is sure to make a statement.',
        imageUrl: 'assets/images/product/product3.jpg',
        price: 1200,
        brand: 'Chic',
        category: 'Jackets',
        availableColors: ['Red', 'Blue', 'Black'],
        availableSizes: ['S', 'M', 'L'],
        stockQuantity: 20,
        rating: 4.8,
        reviewCount: 95,
        isInStock: true),
    Product(
        id: '004',
        name: 'Leather Brown Bag',
        description:
            'A stylish and durable leather brown bag that is perfect for carrying your essentials. With multiple compartments and a classic design, this bag combines functionality with elegance.',
        imageUrl: 'assets/images/product/product4.jpg',
        price: 850,
        brand: 'Artisan',
        category: 'Accessories',
        availableColors: ['Brown', 'Black'],
        availableSizes: ['One Size'],
        stockQuantity: 30,
        rating: 4.6,
        reviewCount: 150,
        isInStock: true),
  ];
}
