import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import '../modules/cart_module.dart';
import 'cart_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Icon(
            Icons.location_on,
            color: Colors.grey[700],
          ),
        ),
        title: Text(
          'Sydney, Australia',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 78,
          // ),

          //good morning
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 20),
              child: Text('Good Morning!'),
            ),
          ),

          const SizedBox(
            height: 4,
          ),

          //Let's order fresh items for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Let\'s Order fresh items for you..',
              style: GoogleFonts.notoSerif(
                  fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          //divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),

          const SizedBox(
            height: 24,
          ),

          //fresh items + grid
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Fresh Items',
              style: TextStyle(fontSize: 24),
            ),
          ),

          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () => () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemsToCart(index);
                      },
                    );
                  },
                );
              },
            ),
          ),

          // floatingaction button
          FloatingActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CartPage(),
            )),
            backgroundColor: Colors.black,
            child: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
    );
  }
}
