import 'package:flutter/material.dart';
import 'package:house_rent_app/layout/card_layout.dart';
import 'package:house_rent_app/layout/house_description.dart';
import 'package:house_rent_app/models/data_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: ListView.builder(
              itemCount: HouseList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: HouseLayout(
                    id: HouseList[index].id,
                    title: HouseList[index].title,
                    price: HouseList[index].price,
                    imagelink: HouseList[index].image,
                    location: HouseList[index].location,
                  ),
                );
              },
            ),
          ),
        ),
        routes: {'./house-description': (ctx) => HouseDescription()});
  }
}
