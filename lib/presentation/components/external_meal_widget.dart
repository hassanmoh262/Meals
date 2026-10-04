import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meals/domain/entities/meals.dart';
import 'package:meals/presentation/screens/reciepe_details_screen.dart';

class ExternalMealwidget extends StatelessWidget {
  const ExternalMealwidget(this.meals, {super.key});
  final Meals meals;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReciepeDetails(mealName: meals.mealName),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
        ),
        margin: EdgeInsets.all(8),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 8),
            Expanded(
              child: AutoSizeText(
                minFontSize: 16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                meals.mealName,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(width: 15),
            Container(
              margin: EdgeInsets.all(8),
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(meals.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
