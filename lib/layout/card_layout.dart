import 'package:flutter/material.dart';

class HouseLayout extends StatelessWidget {
  String id;
  String imagelink;
  double price;
  String title;
  String location;

  HouseLayout(
      {required this.id,
      required this.price,
      required this.title,
      required this.imagelink,
      required this.location});

  void selectedHouse(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('./house-description', arguments: {
      'id': id,
      'imagelink': imagelink,
      'price': price,
      'title': title,
      'location': location
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedHouse(context),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network(
                imagelink,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.greenAccent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Rs. " + price.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.blueAccent),
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
