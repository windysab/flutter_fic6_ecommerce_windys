import 'package:flutter/material.dart';
import 'package:flutter_fic6_ecommerce_windys/presentation/detial_product/detail_icon.dart';

import '../../../common/global_variables.dart';



class ListCategoryWidget extends StatelessWidget {
  const ListCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: GlobalVariables.categoryImages.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle the onTap event here
              // You can navigate to a new screen or perform some action.
              // Example:

              int categoryImageLength = GlobalVariables.categoryImages.length;
              String title = GlobalVariables.categoryImages[index]['title']!;

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    DetailIcon(length: categoryImageLength, title: title),
              ));
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
