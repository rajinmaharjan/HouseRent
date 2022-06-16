import 'package:flutter/material.dart';
import 'package:house_rent_app/utils/colors_utils.dart';

class CategoryLayout extends StatelessWidget {
  String Cid;
  String title;

  CategoryLayout({
    required this.Cid,
    required this.title,
  });

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('./category-description', arguments: {
      'id': Cid,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringColor("b3f4ff"),
                hexStringColor("b3eeff"),
                hexStringColor("b3ddff"),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    margin: EdgeInsets.all(5),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
