import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  GroceryItemTile(
      {super.key,
      required this.color,
      required this.imagePath,
      required this.itemName,
      required this.itemPrice,
      required this.onPressed});

  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
              color: color[100], borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              // image
              Image.asset(
                imagePath,
                height: 64,
              ),
              const SizedBox(
                height: 10,
              ),

              Text(itemName),

              const SizedBox(
                height: 20,
              ),

              MaterialButton(
                onPressed: () {},
                color: color[800],
                child: Text(
                  "\$ " + itemPrice,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
