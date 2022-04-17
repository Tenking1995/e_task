import 'package:flutter/material.dart';
import 'package:my_app/models/plant_model.dart';
import '../common/app_color.dart';
import '../widgets/plant_ori_price_item.dart';

class PlantListScreen extends StatefulWidget {
  final Function(int) changePage;
  const PlantListScreen({Key? key, required this.changePage}) : super(key: key);

  @override
  State<PlantListScreen> createState() => _PlantListScreenState();
}

class _PlantListScreenState extends State<PlantListScreen> {
  final List<PlantModel> _plants = [
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit',
      currentPrice: 'RM 100.00',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit',
      originalPrice: 'RM 100.00',
      currentPrice: 'RM 50.00',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit',
      currentPrice: 'RM 100.00',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit',
      originalPrice: 'RM 100.00',
      currentPrice: 'RM 50.00',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit',
      currentPrice: 'RM 100.00',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit',
      originalPrice: 'RM 100.00',
      currentPrice: 'RM 50.00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: GestureDetector(
        onTap: () {
          // * Close soft keyboard
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: ScrollConfiguration(
            // * Prevent scroll view scroll glow
            behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  // * Add bottom app bar bottom spcae
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(15.0),
                    child: SizedBox.shrink(),
                  ),
                  // * Middle widget (search bar)
                  flexibleSpace: Container(
                    // * With border radius and blur shadow
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(color: Color.fromARGB(193, 201, 199, 199), blurRadius: 5, spreadRadius: 0.2),
                      ],
                    ),
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 50, right: 20, top: 10),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(fontSize: 15.0),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(10),
                        // * Icon Search
                        prefixIcon: Container(
                          constraints: const BoxConstraints(
                            maxHeight: 60,
                            maxWidth: 60,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset(
                            'assets/images/icon_search.png',
                          ),
                        ),
                        // * Icon Filter
                        suffixIcon: Container(
                          constraints: const BoxConstraints(
                            maxHeight: 60,
                            maxWidth: 60,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Image.asset('assets/images/icn_filter.png'),
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              _showSimpleDialog('Filter', 'Button Filter Clicked');
                            },
                          ),
                        ),
                        hintText: "Search Salon",
                      ),
                    ),
                  ),
                  shadowColor: Colors.grey[50],
                  backgroundColor: Colors.white,
                  // * Stick on the screen
                  pinned: true,
                  elevation: 3,
                  // * Always show shadow; will only show bottom shadow when scroll down by default
                  forceElevated: true,
                  // * Button back
                  leading: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Image.asset('assets/images/icn_arrow.png'),
                      onPressed: () {
                        setState(
                          () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            widget.changePage(0);
                          },
                        );
                      },
                    ),
                  ),
                  leadingWidth: 48,
                ),
                // * Plant list
                SliverPadding(
                  padding: const EdgeInsets.all(15.0),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      childAspectRatio: 5 / 9,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        var plantModel = _plants[index];
                        return PlantOriPriceItem(
                            plantModel: plantModel,
                            itemOnClicked: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              _showSimpleDialog('Discoveries', 'Plant Clicked');
                            });
                      },
                      childCount: _plants.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // * =================================================================
  // * Private Functions
  // * =================================================================

  void _showSimpleDialog(String title, String description) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: SizedBox(
          height: 50,
          width: 50,
          child: Center(child: Text(title)),
        ),
        content: SizedBox(
          height: 50,
          width: 50,
          child: Center(child: Text(description)),
        ),
      ),
    );
  }
}
