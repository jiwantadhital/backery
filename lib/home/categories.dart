import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.water, "text": "Water Solution"},
      {"icon": Icons.electrical_services_rounded, "text": "Solar Water Heater"},
      {"icon": Icons.filter, "text": "Parqueting"},
      {"icon": Icons.view_module_sharp, "text": "Modular"},
    ];
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? text;
  final IconData icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 141, 13, 100),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Icon(icon)),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center,style: TextStyle(fontSize: 10))
          ],
        ),
      ),
    );
  }
}
