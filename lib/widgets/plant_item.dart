import 'package:flutter/material.dart';

import '../models/plant_model.dart';

class PlantItem extends StatelessWidget {
  final PlantModel plantModel;
  final VoidCallback? itemOnClicked;
  const PlantItem({Key? key, required this.plantModel, this.itemOnClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: 200,
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
        title: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.grey.withAlpha(80), width: 1),
          ),
          elevation: 0,
          child: ClipPath(
            clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Image.asset(plantModel.imagePath ?? ''),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plantModel.plantType ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          plantModel.title ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          plantModel.currentPrice ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: itemOnClicked,
      ),
    );
  }
}
