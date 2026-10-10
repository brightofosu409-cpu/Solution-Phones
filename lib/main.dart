import 'package:flutter/material.dart';

void main() {
  runApp(const SolutionPhonesApp());
}

class SolutionPhonesApp extends StatelessWidget {
  const SolutionPhonesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SOLUTION PHONES',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
        elevation:0,
        title: const Text(
          'SOLUTION PHONES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const CartPage(),
    ),
  );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome 👋',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Find the perfect phone for you.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            // Search
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for a phone...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  category('All'),
                  category('iPhone'),
                  category('Samsung'),
                  category('Tecno'),
                  category('Infinix'),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Popular Phones',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: phoneCard(
                    context,
                    'iPhone 13',
                    'GHS 4,500',
                    Icons.phone_iphone,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: phoneCard(
                    context,
                    'Samsung S24',
                    'GHS 8,200',
                    Icons.smartphone,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: phoneCard(
                    context,
                    'Tecno Camon',
                    'GHS 3,200',
                    Icons.phone_android,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: phoneCard(
                    context,
                    'Infinix Note',
                    'GHS 2,800',
                    Icons.phone_android,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
onTap: (index) {
  if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrdersPage(),
      ),
    );
  } else if (index == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }
},
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget category(String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(name),
      ),
    );
  }

  Widget phoneCard( 
    BuildContext context,
    String name,
    String price,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 65,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              price,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
        Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailsPage(
        name: name,
        price: price,
        icon: icon,
      ),
    ),
  );
                },
                child: const Text('View'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProductDetailsPage extends StatelessWidget {
  final String name;
  final String price;
  final IconData icon;

  const ProductDetailsPage({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phone image
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                size: 150,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 25),

            // Phone name
            Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Price
            Text(
              price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Specifications',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            specification('Storage', '128 GB'),
            specification('RAM', '6 GB'),
            specification('Camera', '12 MP'),
            specification('Battery', '5000 mAh'),
            specification('Network', '4G / 5G'),

            const SizedBox(height: 25),

            const Text(
              'Description',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'This phone is available from SOLUTION PHONES. '
              'Contact us or place your order through the app.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // Add to cart
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () { cartItems.add (CartItem(name: name,
                price: price,
                icon: Icons.phone_iphone,
                ),
                );
                   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$name added to cart'),
    ),
  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Buy now
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget specification(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
class CartItem {
  final String name;
  final String price;
  final IconData icon;

  CartItem({
    required this.name,
    required this.price,
    required this.icon,
  });

  double get priceValue {
    return double.parse(
      price.replaceAll('GHS ', '').replaceAll(',', ''),
    );
  }
}

final List<CartItem> cartItems = [];
final List<List<CartItem>> orderHistory = [];
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get total {
    return cartItems.fold(
      0,
      (sum, item) => sum + item.priceValue,
    );
  }

  String formatPrice(double amount) {
    return 'GHS ${amount.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey.shade100,
                              child: Icon(
                                item.icon,
                                color: Colors.blue,
                              ),
                            ),
                            title: Text(
                              item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'GHS ${item.priceValue.toStringAsFixed(0)}',
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const Divider(),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formatPrice(total),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CheckoutPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Proceed to Checkout',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  double get total {
    return cartItems.fold(
      0,
      (sum, item) => sum + item.priceValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 12),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Delivery Address',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),

            const SizedBox(height: 25),

            const Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.account_balance_wallet,
                ),
                title: const Text('Mobile Money'),
                subtitle: const Text(
                  'MTN MoMo / Telecel Cash / AT Money',
                ),
                trailing: const Icon(
                  Icons.radio_button_checked,
                  color: Colors.blue,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...cartItems.map(
              (item) => ListTile(
                title: Text(item.name),
                trailing: Text(
                  'GHS ${item.priceValue.toStringAsFixed(0)}',
                ),
              ),
            ),

            const Divider(),

            ListTile(
              title: const Text(
                'Total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                'GHS ${total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
               onPressed: () {
  if (cartItems.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Your cart is empty!'),
      ),
    );
    return;
  }

  orderHistory.add(List<CartItem>.from(cartItems));
  cartItems.clear();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Order Confirmed!'),
      content: const Text(
        'Your order has been placed successfully.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.popUntil(context, (route)  => route.isFirst);
          },
          child: const Text('Continue Shopping'),
        ),
      ],
    ),
  );
},
                child: const Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        centerTitle: true,
      ),
      body: orderHistory.isEmpty
          ? const Center(
              child: Text(
                'No orders yet',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                final order = orderHistory[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    leading: const Icon(
                      Icons.shopping_bag,
                      size: 35,
                    ),
                    title: Text('Order ${index + 1}'),
                    subtitle: Text(
                      order.map((item) => item.name).join(', '),
                    ),
                    trailing: Text(
                      'GHS ${order.fold<double>(0, (total, item) => total + item.priceValue).toStringAsFixed(2)}',
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to SOLUTION PHONES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Your customer profile'),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('My Orders'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPage(),
                  ),
                );
              },
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact Support'),
              subtitle: Text('Get help with your order'),
            ),
          ],
        ),
      ),
    );
  }
}