import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Details'),
        ),
      ),
      body: Column(
        children: [
          const CircleAvatar(),
          Container(
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
