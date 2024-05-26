import 'package:flutter/material.dart';
import 'package:reminder_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    var rating;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 70,
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFF295c82), width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Center(
                child: Text(category.categoryName,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5, right: 0),
                  child: Icon(Icons.trending_up,
                      size: 25, color: Color(0xFF295c82)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(category.categoryPrecent,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
