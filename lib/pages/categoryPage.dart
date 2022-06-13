import 'package:flutter/material.dart';
import 'package:house_rent_app/layout/category_layout.dart';
import 'package:house_rent_app/models/category_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: CategoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: CategoryLayout(
                Cid: CategoryList[index].Cid,
                title: CategoryList[index].title,
                imagelink: CategoryList[index].image,
              ),
            );
          },
        ),
      ),
    );
  }
}
