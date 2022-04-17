import 'dart:async';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/app_color.dart';
import '../common/app_string.dart';
import '../common/application.dart';
import '../models/plant_model.dart';
import '../widgets/plant_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  final List<String> _plants = [
    'assets/images/button_icon1.png',
    'assets/images/button_icon2.png',
    'assets/images/button_icon3.png',
    'assets/images/button_icon4.png',
    'assets/images/button_icon5.png',
  ];
  final List<PlantModel> _newServices = [
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur',
      currentPrice: 'RM 10.00',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur',
      currentPrice: 'RM 10.00',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur',
      currentPrice: 'RM 10.00',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur',
      currentPrice: 'RM 10.00',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur',
      currentPrice: 'RM 10.00',
    ),
  ];
  final List<String> _shopPlants = [
    'assets/images/shop_plants_icon1.png',
    'assets/images/shop_plants_icon2.png',
    'assets/images/shop_plants_icon3.png',
    'assets/images/shop_plants_icon4.png',
    'assets/images/shop_plants_icon5.png',
  ];
  final List<PlantModel> discoveries = [
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit. Lorem ipsum dolor sit amet',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit. Lorem ipsum dolor sit amet',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit. Lorem',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit. Lorem ipsum dolor sit amet',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit. Lorem ipsum dolor sit amet',
    ),
    PlantModel(
      imagePath: 'assets/images/img_plant.jpg',
      plantType: 'Lorem Ipsum',
      title: 'Lorem ipsum dolor sit amet consectetur adipising elit. Lorem',
    ),
  ];

  Completer<GoogleMapController> mapController = Completer();
  final _scrollController = ScrollController();
  double _scrollPosition = 0;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          // * Prevent scroll view scroll glow
          behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                // * Header
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: Application.getScreenWidth(context),
                  color: AppColor.primary,
                  child: Wrap(
                    children: [
                      // * Logo
                      Center(
                        child: Text(
                          AppString.txt_logo,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // * Header description with line
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 25),
                                color: AppColor.background,
                                height: 1,
                              ),
                            ),
                            Text(
                              AppString.txt_home_description,
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 25),
                                color: AppColor.background,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // * Appointment info
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Row(
                          children: [
                            getIconWithTextContainer('assets/images/icon_calender.png', '14 Oct 2020', false),
                            getIconWithTextContainer('assets/images/icon_clock.png', '12:30 PM', false),
                            getIconWithTextContainer('assets/images/icon_location_light.png',
                                '123 Plant Street, 1/1 Taman Jaya Oranga', true),
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  'assets/images/icon_arrow.png',
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              onTap: () => _showSimpleDialog('View Full Address', 'Button Address Clicked'),
                            ),
                          ],
                        ),
                      ),
                      // * Account details
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                        child: Row(
                          children: [
                            // * Credit
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        AppString.txt_credit,
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'RM100.00',
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 0.5),
                            // * Points
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        AppString.txt_points,
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '10',
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 0.5),
                            // * Packages
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        AppString.txt_package,
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '1',
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // * Banner
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/home_banner.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                // * Buttons & Plant type list
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: AppColor.white,
                  child: Column(
                    children: [
                      // * Buttons
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: InkWell(
                                onTap: () => _showSimpleDialog('Shop', 'Button Shop Clicked'),
                                child: Center(
                                  child: Image.asset('assets/images/btn_shop.png'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                onTap: () => _showSimpleDialog('Services', 'Button Services Clicked'),
                                child: Center(
                                  child: Image.asset('assets/images/btn_services.png'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                onTap: () => _showSimpleDialog('Posts', 'Button Posts Clicked'),
                                child: Center(
                                  child: Image.asset('assets/images/btn_posts.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // * Plant type list
                      Container(
                        constraints: const BoxConstraints(maxHeight: 90),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _plants.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  if (i == 0) const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () => _showSimpleDialog('Plant', 'Button clicked'),
                                    child: Center(
                                      child: Image.asset(_plants[i]),
                                    ),
                                  ),
                                  if (i == _plants.length - 1) const SizedBox(width: 10),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // * New services & Shop list
                Container(
                  color: AppColor.background,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      // * Title & Description & View All button
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // * Title
                                Text(
                                  AppString.txt_new_services,
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                // * Description
                                Text(
                                  AppString.txt_new_services_desc,
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // * View All button
                            TextButton(
                              onPressed: () => _showSimpleDialog('View All', 'Button view all clicked'),
                              child: Text(
                                AppString.txt_view_all,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // * New services list
                      Container(
                        constraints: const BoxConstraints(maxHeight: 320),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: _newServices.length,
                          itemBuilder: (ctx, i) {
                            return Row(
                              children: [
                                if (i == 0) const SizedBox(width: 20),
                                PlantItem(
                                  plantModel: _newServices[i],
                                  itemOnClicked: () => _showSimpleDialog('Service', 'Service Clicked'),
                                ),
                                if (i == _newServices.length - 1) const SizedBox(width: 20),
                              ],
                            );
                          },
                        ),
                      ),
                      // * Shop list
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/shop_plants_icon_main.png',
                              height: 90,
                            ),
                            Expanded(
                              child: Container(
                                constraints: const BoxConstraints(maxHeight: 80),
                                child: FadingEdgeScrollView.fromScrollView(
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _shopPlants.length,
                                    itemBuilder: (ctx, i) {
                                      return Container(
                                        margin: const EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            if (i == 0) const SizedBox(width: 10),
                                            InkWell(
                                              onTap: () => _showSimpleDialog('Shop', 'Shop Clicked'),
                                              child: Center(
                                                child: Image.asset(_shopPlants[i]),
                                              ),
                                            ),
                                            if (i == _shopPlants.length - 1) const SizedBox(width: 10),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // * List scroll position indicator line
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            width: double.infinity,
                            height: 1,
                            color: AppColor.primary,
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 100),
                            top: 7,
                            left: _scrollPosition,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              decoration: const BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              width: 55,
                              height: 7,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // * Dicoveries list
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  color: AppColor.darkBackground,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/trending_discoveries.jpg',
                        fit: BoxFit.fill,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 20,
                        ),
                        child: MasonryGridView.count(
                          // * Disable scroll in scroll view
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 2,
                          itemCount: discoveries.length,
                          itemBuilder: (context, index) {
                            var plantModel = discoveries[index];
                            return GestureDetector(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.grey.withAlpha(80), width: 1),
                                ),
                                elevation: 0,
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                  child: Container(
                                    decoration: const BoxDecoration(color: Colors.white),
                                    child: Wrap(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Image.asset(
                                              plantModel.imagePath ?? '',
                                              fit: BoxFit.fill,
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
                              onTap: () => _showSimpleDialog('Discoveries', 'Plant Clicked'),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // * Location
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppString.txt_location,
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // * Google Map
                      Center(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: AspectRatio(
                              aspectRatio: 2 / 1,
                              child: GoogleMap(
                                onMapCreated: (controller) => mapController.complete(controller),
                                initialCameraPosition: const CameraPosition(
                                  target: LatLng(45.521563, -122.677433),
                                  zoom: 11.0,
                                ),
                                markers: {
                                  const Marker(
                                    markerId: MarkerId('center'),
                                    position: LatLng(45.521563, -122.677433),
                                    infoWindow: InfoWindow(
                                      title: 'My Place',
                                    ),
                                  )
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // * 1st location
                      const Text(
                        'Sunway Pyramid',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Image.asset(
                              'assets/images/icon_location_dark.png',
                              height: 12,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '10, Floor, Lorem Ipsum Mall, Jalan ss23 Lorem, Selangor, Malaysia',
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => _showSimpleDialog('Address', 'Address Clicked'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Image.asset(
                              'assets/images/icn_clock.png',
                              height: 12,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '10am - 10pm',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // * 2nd location
                      const Text(
                        'The Garden Mall',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Image.asset(
                              'assets/images/icon_location_dark.png',
                              height: 12,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '10, Floor, Lorem Ipsum Mall, Jalan ss23 Lorem, Selangor, Malaysia',
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => _showSimpleDialog('Address', 'Address Clicked'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Image.asset(
                              'assets/images/icn_clock.png',
                              height: 12,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '10am - 10pm',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      )
                    ],
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
  // * Widgets
  // * =================================================================

  static Widget getIconWithTextContainer(String assetImagePath, String text, bool isEllipsis) {
    return !isEllipsis
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.asset(
                  assetImagePath,
                  height: 15,
                  width: 15,
                ),
                const SizedBox(width: 5),
                Text(
                  text,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.asset(
                    assetImagePath,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  // * =================================================================
  // * Private Functions
  // * =================================================================

  void _scrollListener() {
    setState(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      _scrollPosition = (currentScroll / maxScroll) * (MediaQuery.of(context).size.width - 100);
    });
  }

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
