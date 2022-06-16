import 'package:flutter/material.dart';

class HouseDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routsArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    String imagelink = routsArgs['imagelink'].toString();
    String houseId = routsArgs['id'].toString();
    String title = routsArgs['title'].toString();
    String location = routsArgs['location'].toString();
    String price = routsArgs['price'].toString();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                  child: Image.network(
                imagelink,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              )),
              Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'House ID: ',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: houseId),
                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Title: ',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: title),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Location: ',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: location),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Price: ',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: price),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Rent"),
                  style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      primary: Colors.white,
                      backgroundColor: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
