import 'package:flutter/material.dart';

import '../models/plant_model.dart';

class PlantOriPriceItem extends StatelessWidget {
  final VoidCallback? itemOnClicked;
  final PlantModel plantModel;
  const PlantOriPriceItem({
    Key? key,
    required this.plantModel,
    this.itemOnClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0,
        child: ClipPath(
          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          child: Image.asset(
                            plantModel.imagePath ?? '',
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                        if (plantModel.originalPrice != null)
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Image.asset(
                              'assets/images/50_percentage.png',
                              fit: BoxFit.fill,
                              height: 40,
                              width: 40,
                            ),
                          )
                      ],
                    ),
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
                          const SizedBox(height: 5),
                          plantModel.originalPrice != null
                              ? Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    plantModel.originalPrice ?? '',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 5),
                          Text(
                            plantModel.currentPrice ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: itemOnClicked,
    );
  }
}
