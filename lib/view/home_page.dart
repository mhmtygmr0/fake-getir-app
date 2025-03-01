import 'package:flutter/material.dart';

import '../product/custom_widgets.dart';

class HomePage extends StatelessWidget {
  final String _advertImage = "assets/advert2.png";
  final String _address = "Mücahitler Mahallesi Şehit Ertuğrul Polat Caddesi";
  final String _locationName = "Ev";
  final String _duration = "15-20 DK";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomWidgets.getAppBar("getir", Colors.amber, 24, FontWeight.bold),
      body: Column(
        children: [
          _getAdressBar(context, _locationName, _address, _duration),
          _getAdvert(_advertImage),
          _getCategories(),
        ],
      ),
      bottomNavigationBar: CustomWidgets.getBottomNavigationBar(0, (index) {}),
    );
  }

  Widget _getAdressBar(BuildContext context, String locationName,
      String address, String duration) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.80,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 11, bottom: 11, left: 15, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "$locationName, $address",
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.expand_more,
                        color: CustomWidgets.getirColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              height: 40,
              child: Center(
                child: Text(
                  duration,
                  style: const TextStyle(
                      fontSize: 13,
                      color: CustomWidgets.getirColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAdvert(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 13),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getCategories() {
    return Expanded(
      child: GridView.builder(
        itemCount: CustomWidgets.categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return _buildCategories(
            CustomWidgets.categories[index]["image"]!,
            CustomWidgets.categories[index]["title"]!,
          );
        },
      ),
    );
  }

  Widget _buildCategories(String imagePath, String text) {
    return Column(
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
