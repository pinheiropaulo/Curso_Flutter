import 'package:flutter/material.dart';
import 'package:great_places/src/components/image_input.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Lugar'),
      ),
      body: Column(
        children: [
          const Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Titulo',
                ),
              ),
              SizedBox(height: 10),
              ImageInput()
            ],
          ),
        ],
      ),
    );
  }
}
